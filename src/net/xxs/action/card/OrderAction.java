package net.xxs.action.card;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.xxs.bean.Card;
import net.xxs.directive.PaymentResultMethod;
import net.xxs.entity.Brand;
import net.xxs.entity.Member;
import net.xxs.entity.MemberDiscount;
import net.xxs.entity.Order;
import net.xxs.entity.Order.OrderStatus;
import net.xxs.entity.OrderLog;
import net.xxs.entity.OrderLog.OrderLogType;
import net.xxs.entity.PaymentConfig;
import net.xxs.entity.PaymentDiscount;
import net.xxs.entity.Product;
import net.xxs.payment.BasePaymentProduct;
import net.xxs.payment.PaymentResult;
import net.xxs.service.BrandService;
import net.xxs.service.MemberDiscountService;
import net.xxs.service.OrderLogService;
import net.xxs.service.OrderService;
import net.xxs.service.PaymentConfigService;
import net.xxs.service.PaymentDiscountService;
import net.xxs.service.ProductService;
import net.xxs.util.DateUtil;
import net.xxs.util.JsonUtil;
import net.xxs.util.PaymentProductUtil;
import net.xxs.util.SettingUtil;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.opensymphony.xwork2.interceptor.annotations.InputConfig;
import com.opensymphony.xwork2.validator.annotations.RequiredFieldValidator;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.StringLengthFieldValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;

/**
 * 前台Action类 - 订单处理
 */

@ParentPackage("card")
@InterceptorRefs({
	@InterceptorRef(value = "memberVerifyInterceptor"),
	@InterceptorRef(value = "token", params = {"excludeMethods", "info,list,view,save,batch,Lquery,Rquery,search"}),
	@InterceptorRef(value = "cardStack")
})
public class OrderAction extends BaseCardAction {
	
	private static final long serialVersionUID = 2553137844831167917L;
	
	private String productId;//充值卡编码
	private String cardNum;//卡号
	private String cardPwd;//密码
	private String cardString;//卡密组的字符串
	private String memo;// 附言
	
	private String dateScope; //时间范围
	private Date beginDate;// 开始日期
	private Date endDate;// 结束日期
	private String tempBeginDate;// 开始日期
	private String tempEndDate;// 结束日期
	
	private List<Order> orderList = new ArrayList<Order>();
	private PaymentConfig paymentConfig;// 支付方式
	private Order order;// 订单
	private PaymentResult paymentResult;// 支付返回参数
	
	@Resource(name = "paymentConfigServiceImpl")
	private PaymentConfigService paymentConfigService;
	@Resource(name = "paymentDiscountServiceImpl")
	private PaymentDiscountService paymentDiscountService;
	@Resource(name = "orderServiceImpl")
	private OrderService orderService;
	@Resource(name = "orderLogServiceImpl")
	private OrderLogService orderLogService;
	@Resource(name = "productServiceImpl")
	private ProductService productService;
	@Resource(name = "brandServiceImpl")
	private BrandService brandService;
	@Resource(name = "memberDiacountServiceImpl")
	private MemberDiscountService memberDiacountService;
	
	
	public List<Card> jiexi(String str){
		List<Card> cardList = new ArrayList<Card>();
	    String tempFilex[]=str.split("\n");//以换行符拆分
	    for (int j = 0; j < tempFilex.length; j++) {
	    	String nums[] = tempFilex[j].split(",");
	    	Card card = new Card();
	    	Integer.parseInt(nums[0].trim());
	    	Integer.parseInt(nums[1].trim());
	    	card.setNum(nums[0].trim());
	    	card.setPwd(nums[1].trim());
	    	//card.setFace(Integer.parseInt(nums[2].trim()));//暂时不支持自定义面额
	    	cardList.add(card);
		}
		return cardList;
	}
	public static boolean containsAny(String str, String searchChars) { 
		if(str.length()!=str.replace(searchChars,"").length())  { 
			return false; 
		} 
	  		return true;
	}
	//保存提交的充值卡订单
	@Validations(
		requiredStrings = {
			@RequiredStringValidator(fieldName = "paymentConfig.id", message = "请选择一个支付通道!"),
			@RequiredStringValidator(fieldName = "productId", message = "请选择一种面额!"),
			@RequiredStringValidator(fieldName = "cardNum", message = "请输入卡号!"),
			@RequiredStringValidator(fieldName = "cardPwd", message = "请输入密码!")
		},
		stringLengthFields = {
			@StringLengthFieldValidator(fieldName = "cardNum", minLength = "1", maxLength = "50", message = "卡号长度超出限制!"),
			@StringLengthFieldValidator(fieldName = "cardPwd", minLength = "1", maxLength = "50", message = "密码长度超出限制!")
		}
	)
	@InputConfig(resultName = "error")
	public String save() {
		Member loginMember = getLoginMember();
		Product product = productService.load(productId); 
		paymentConfig = paymentConfigService.load(paymentConfig.getId());//获取支付方式
		Brand brand = product.getCards().getBrand();//为order准备brandId
		PaymentDiscount paymentDiscount = paymentDiscountService.getPaymentDiscountByPaymentConfigAndBrand(paymentConfig, brand);
		if (null == paymentDiscount){
			return ajax(Status.error,"通道信息异常!请与客服联系解决！");
		}
		if(!"0".equals(paymentDiscount.getFace())){
			if (containsAny(paymentDiscount.getFace(),String.valueOf(product.getPrice().intValue()))){
				return ajax(Status.error,paymentConfig.getName()+"暂不支持名额为："+product.getPrice()+"元的"+product.getCards().getName());
			}
		}
		Double tempmemberdiscount = 0.00;
		MemberDiscount md =  memberDiacountService.getDiscountByMemberAndBrand(loginMember, brand);
		if(md!=null){
			tempmemberdiscount = md.getDiscount();
		}
		order = makeOrder(loginMember, product, brand, paymentDiscount,	tempmemberdiscount);
		BasePaymentProduct paymentProduct = PaymentProductUtil.getPaymentProduct(paymentConfig.getPaymentProductId());
		//发送支付信息
		try {
			paymentResult = paymentProduct.cardPay(paymentConfig,order, getRequest());
		} catch (Exception e) {
			addActionError("订单支付提交失败!"+paymentResult.getReason());
			return ajax(Status.error,"订单支付提交失败!"+paymentResult.getReason());
		}
		if ((paymentResult == null || StringUtils.isEmpty(paymentResult.getOrderSn()))){
			return ajax(Status.error,"订单支付提交失败!"+paymentResult.getReason());
		}
		order = orderService.getOrderByOrderSn(paymentResult.getOrderSn());
		if(StringUtils.isEmpty(order.getRetCode())||!paymentResult.getCode().equals(order.getRetCode())){
			if(paymentResult.getIsSuccess()){
				order.setOrderStatus(OrderStatus.paymenting);
			}else{
				order.setOrderStatus(OrderStatus.failure);
			}
			order.setRetCode(paymentResult.getCode());
			order.setRetMsg(paymentResult.getReturnMsg());
			System.out.println("订单状态已变更");
			orderService.update(order);
		}else{
			System.out.println("订单状态未变化");
		}
		return ajax(Status.success,"提交成功");
	}
	private Order makeOrder(Member loginMember, Product product, Brand brand,PaymentDiscount paymentDiscount, Double tempmemberdiscount) {
		//生成订单
		order = new Order();
		order.setBrandId(brand.getId());//此列不能为空
		order.setOrderStatus(OrderStatus.paymenting);
		order.setPaymentConfigName(paymentConfig.getName());
		order.setAmount(SettingUtil.setPriceScale(product.getPrice()));//默认充值卡面额为订单金额
		order.setMemo(memo);
		order.setMember(loginMember);
		order.setPaymentConfig(paymentConfig);
		order.setProductSn(product.getProductSn());
		order.setProductName(product.getName());//货品名称
		order.setProductPrice(product.getPrice());//价格默认为销售价
		order.setCardCode(paymentDiscount.getCode());//通道编码
		order.setCardDiscount(paymentDiscount.getDiscount());//即时折扣率
		order.setMemberDiscount(BigDecimal.valueOf(tempmemberdiscount));//即时会员优惠率
		order.setProduct(product);
		order.setCardNum(cardNum);//卡号
		order.setCardPwd(cardPwd);//密码
		order.setBankAccount(paymentConfig.getBargainorId());
		order.setBankName(paymentConfig.getName());
		orderService.save(order);
		order = orderService.get(order.getId());
		// 订单日志
		OrderLog orderLog = new OrderLog();
		orderLog.setOrderLogType(OrderLogType.create);
		orderLog.setOrderSn(order.getOrderSn());
		orderLog.setOperator(null);
		orderLog.setInfo(null);
		orderLog.setOrder(order);
		orderLogService.save(orderLog);
		return order;
	}
	//查询订单最新状态
	@Validations(
		requiredFields = { 
			@RequiredFieldValidator(fieldName = "ids", message = "订单ID不能为空!")
		}		
	)
	@InputConfig(resultName = "error")	
	public String Rquery() {
		if(ids!=null && ids.length>0){
			for (int i = 0; i < ids.length; i++) {
				id = ids[i];
				order = orderService.get(id);
				if(order.getOrderStatus()==OrderStatus.failure || order.getOrderStatus() == OrderStatus.paid){
					continue;
				}
				paymentConfig = order.getPaymentConfig();
				BasePaymentProduct paymentProduct = PaymentProductUtil.getPaymentProduct(paymentConfig.getPaymentProductId());
				//发送查询请求
				try {
					paymentResult = paymentProduct.cardQuery(paymentConfig,order.getOrderSn(), getRequest());
				} catch (Exception e) {
					addActionError("订单支付提交失败!");
					return ERROR;
				}
				if ((paymentResult == null || StringUtils.isEmpty(paymentResult.getOrderSn()))){
					addActionError("缺失支付单号!");
					return ERROR;
				}
				order = orderService.getOrderByOrderSn(paymentResult.getOrderSn());
				if(StringUtils.isEmpty(order.getRetCode())||!paymentResult.getCode().equals(order.getRetCode())){
					order.setRetCode(paymentResult.getCode());
					order.setRetMsg(paymentResult.getReturnMsg());
					System.out.println("订单状态已变更");
					orderService.update(order);
				}else{
					System.out.println("订单状态未变化");
				}
			}
		}
		
		return ajax(Status.success,"刷新成功");
	}
	//查询订单最新状态
	@Validations(
		requiredFields = { 
			@RequiredFieldValidator(fieldName = "ids", message = "订单ID不能为空!")
		}		
	)
	@InputConfig(resultName = "error")	
	public String Lquery() {
		if(ids!=null && ids.length>0){
			for (int i = 0; i < ids.length; i++) {
				id = ids[i];
				order = orderService.get(id);
				orderList.add(order);
			}
		}
		List<Map<String, String>> optionList = new ArrayList<Map<String, String>>();
		for (Order order : orderList) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("id", order.getId());
			map.put("orderStatus", order.getOrderStatus().toString());
			map.put("retCode", PaymentResultMethod.resultText(order.getPaymentConfig().getPaymentProductId()+order.getRetCode()));
//			System.out.println(order.getPaymentConfig().getPaymentProductId()+"||"+order.getRetCode()+"||"+order.getPaymentConfig().getPaymentProductId()+order.getRetCode()+"||"+PaymentResultMethod.resultText(order.getPaymentConfig().getPaymentProductId()+order.getRetCode()));
			optionList.add(map);
			
		}
		return ajax(Status.success,JsonUtil.toJson(optionList));
	}
	// 订单列表
	public String list() {
		pager = orderService.getOrderPager(getLoginMember(), pager);
		return LIST;
	}
	
	// 查询订单
	public String search() {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		order.setMember(getLoginMember());
		if("day".equals(dateScope)){
			beginDate = new Date();
			endDate	= new Date();
		}
		if("week".equals(dateScope)){
			beginDate = DateUtil.getAfterDay(-7);
			endDate	= new Date();
		}
		if("month".equals(dateScope)){
			beginDate = DateUtil.getAfterDay(-30);
			endDate	= new Date();	
		}
		if("quarter".equals(dateScope)){
			beginDate = DateUtil.getAfterMonth(-3);
			endDate	= new Date();
		}
		if (beginDate != null) {
			beginDate.setHours(0);
			beginDate.setMinutes(0);
			beginDate.setSeconds(0);
		}
		if (endDate != null) {
			endDate.setHours(23);
			endDate.setMinutes(59);
			endDate.setSeconds(59);
		}
		pager = orderService.getOrderPager(beginDate,endDate,order,pager);
		if(beginDate!=null){
			tempBeginDate = sf.format(beginDate);
		}
		if(endDate!=null){
			tempEndDate = sf.format(endDate);
		}
		return LIST;
	}
	
	// 订单详情
	@Validations(
		requiredStrings = {
			@RequiredStringValidator(fieldName = "id", message = "订单ID不允许为空!")
		}
	)
	@InputConfig(resultName = "error")
	public String view() {
		order = orderService.load(id);
		return "view";
	}
	
	// 获取所有支付方式集合
	public List<PaymentConfig> getAllPaymentConfigList() {
		return paymentConfigService.getAllList();
	}
	// 获取所有品牌
	public List<Brand> getAllBrandList() {
		return brandService.getAllList();
	}
	//获取所有的订单状态
	public List<OrderStatus> getOrderStatusList() {
		return Arrays.asList(OrderStatus.values());
	}
	
	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}


	public PaymentConfig getPaymentConfig() {
		return paymentConfig;
	}

	public void setPaymentConfig(PaymentConfig paymentConfig) {
		this.paymentConfig = paymentConfig;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getCardNum() {
		return cardNum;
	}

	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}

	public String getCardPwd() {
		return cardPwd;
	}

	public void setCardPwd(String cardPwd) {
		this.cardPwd = cardPwd;
	}

	public String getCardString() {
		return cardString;
	}

	public void setCardString(String cardString) {
		this.cardString = cardString;
	}
	public PaymentResult getPaymentResult() {
		return paymentResult;
	}
	public void setPaymentResult(PaymentResult paymentResult) {
		this.paymentResult = paymentResult;
	}
	public Date getBeginDate() {
		return beginDate;
	}
	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public List<Order> getOrderList() {
		return orderList;
	}
	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
	}
	public String getDateScope() {
		return dateScope;
	}
	public void setDateScope(String dateScope) {
		this.dateScope = dateScope;
	}
	public String getTempBeginDate() {
		return tempBeginDate;
	}
	public void setTempBeginDate(String tempBeginDate) {
		this.tempBeginDate = tempBeginDate;
	}
	public String getTempEndDate() {
		return tempEndDate;
	}
	public void setTempEndDate(String tempEndDate) {
		this.tempEndDate = tempEndDate;
	}
	
}