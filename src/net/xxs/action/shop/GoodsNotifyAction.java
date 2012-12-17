package net.xxs.action.shop;

import javax.annotation.Resource;

import net.xxs.entity.GoodsNotify;
import net.xxs.entity.Member;
import net.xxs.entity.Product;
import net.xxs.service.GoodsNotifyService;
import net.xxs.service.ProductService;

import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.opensymphony.xwork2.interceptor.annotations.InputConfig;
import com.opensymphony.xwork2.validator.annotations.EmailValidator;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.StringLengthFieldValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;

/**
 * 前台Action类 - 到货通知
 */

@ParentPackage("shop")
@InterceptorRefs({
	@InterceptorRef(value = "memberVerifyInterceptor", params = {"excludeMethods", "add,save"}),
	@InterceptorRef(value = "shopStack")
})
public class GoodsNotifyAction extends BaseShopAction {

	private static final long serialVersionUID = 3262342523271202673L;
	
	private Product product;// 货品
	private GoodsNotify goodsNotify;// 到货通知
	
	@Resource(name = "productServiceImpl")
	private ProductService productService;
	@Resource(name = "goodsNotifyServiceImpl")
	private GoodsNotifyService goodsNotifyService;

	// 添加
	@Validations(
		requiredStrings = {
			@RequiredStringValidator(fieldName = "product.id", message = "参数错误!")
		}
	)
	@InputConfig(resultName = "error")
	public String add() {
		product = productService.load(product.getId());
		if (!product.getIsOutOfStock()) {
			addActionError("此货品暂不缺货!");
			return ERROR;
		}
		return "add";
	}
	
	// 保存
	@Validations(
		requiredStrings = {
			@RequiredStringValidator(fieldName = "product.id", message = "参数错误!"),
			@RequiredStringValidator(fieldName = "goodsNotify.email", message = "E-mail不允许为空!")
		},
		emails = {
			@EmailValidator(fieldName = "goodsNotify.email", message = "E-mail格式错误!")
		},
		stringLengthFields = {
			@StringLengthFieldValidator(fieldName = "goodsNotify.email", maxLength = "200", message = "E-mail长度超出限制!")
		}
	)
	@InputConfig(resultName = "error")
	public String save() {
		product = productService.load(product.getId());
		if (!product.getIsOutOfStock()) {
			addActionError("此货品暂不缺货!");
			return ERROR;
		}
		goodsNotify.setProduct(product);
		if (getLoginMember() != null) {
			goodsNotify.setMember(getLoginMember());
		}
		goodsNotify.setIsSent(false);
		goodsNotify.setSendDate(null);
		goodsNotifyService.save(goodsNotify);
		redirectUrl = getContextPath() + "/";
		return SUCCESS;
	}
	
	// 列表
	public String list() {
		pager = goodsNotifyService.findPager(getLoginMember(), pager);
		return LIST;
	}
	
	// 删除
	@Validations(
		requiredStrings = {
			@RequiredStringValidator(fieldName = "id", message = "参数错误!")
		}
	)
	@InputConfig(resultName = "ajaxError")
	public String ajaxDelete() {
		GoodsNotify goodsNotify = goodsNotifyService.load(id);
		Member loginMember = getLoginMember();
		if (loginMember != goodsNotify.getMember()) {
			return ajax(Status.error, "参数错误!");
		}
		goodsNotifyService.delete(goodsNotify);
		return ajax(Status.success, "删除成功!");
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public GoodsNotify getGoodsNotify() {
		return goodsNotify;
	}

	public void setGoodsNotify(GoodsNotify goodsNotify) {
		this.goodsNotify = goodsNotify;
	}
	
}