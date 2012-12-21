package net.xxs.action.card;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.xxs.bean.Pager.Order;
import net.xxs.entity.Brand;
import net.xxs.entity.PaymentConfig;
import net.xxs.service.BrandService;
import net.xxs.service.CardsService;
import net.xxs.service.PaymentConfigService;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.opensymphony.xwork2.interceptor.annotations.InputConfig;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;

/**
 * 前台Action类 - 充值卡
 */

@ParentPackage("card")
@InterceptorRefs({
	@InterceptorRef(value = "memberVerifyInterceptor"),
	@InterceptorRef(value = "cardStack")
})
public class CardsAction extends BaseCardAction {

	private static final long serialVersionUID = -4969421249817468001L;

	private String sign;
	private Map<String, String> cardsAttributeIdMap;
	private String orderType;
	
	private Brand brand;
	
	@Resource(name = "cardsServiceImpl")
	private CardsService cardsService;
	@Resource(name = "brandServiceImpl")
	private BrandService brandService;
	@Resource(name = "paymentConfigServiceImpl")
	private PaymentConfigService paymentConfigService;
	@Validations(
		requiredStrings = {
			@RequiredStringValidator(fieldName = "sign", message = "参数错误!")
		}
	)
	@InputConfig(resultName = "error")
	public String list() {
		
		if (StringUtils.equalsIgnoreCase(orderType, "priceAsc")) {
			pager.setOrderBy("price");
			pager.setOrder(Order.asc);
		} else if (StringUtils.equalsIgnoreCase(orderType, "priceDesc")) {
			pager.setOrderBy("price");
			pager.setOrder(Order.desc);
		} else if (StringUtils.equalsIgnoreCase(orderType, "dateAsc")) {
			pager.setOrderBy("createDate");
			pager.setOrder(Order.asc);
		} else {
			orderType = "";
			pager.setOrderBy(null);
			pager.setOrder(null);
		}
		pager.setSearchBy(null);
		pager.setKeyword(null);
		
		if (brand != null && StringUtils.isNotEmpty(brand.getId())) {
			brand = brandService.load(brand.getId());
		} else {
			brand = null;
		}
		
		return "picture_list";
	}
	
	@Validations(
		requiredStrings = { 
			@RequiredStringValidator(fieldName = "pager.keyword", message = "搜索关键词不允许为空!") 
		}
	)
	@InputConfig(resultName = "error")
	public String search() throws Exception {
		if (StringUtils.equalsIgnoreCase(orderType, "priceAsc")) {
			pager.setOrderBy("price");
			pager.setOrder(Order.asc);
		} else if (StringUtils.equalsIgnoreCase(orderType, "priceDesc")) {
			pager.setOrderBy("price");
			pager.setOrder(Order.desc);
		} else if (StringUtils.equalsIgnoreCase(orderType, "dateAsc")) {
			pager.setOrderBy("createDate");
			pager.setOrder(Order.asc);
		} else {
			pager.setOrderBy(null);
			pager.setOrder(null);
		}
		
		pager = cardsService.search(pager);
		
		return "picture_search";
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public Map<String, String> getCardsAttributeIdMap() {
		return cardsAttributeIdMap;
	}

	public void setCardsAttributeIdMap(Map<String, String> cardsAttributeIdMap) {
		this.cardsAttributeIdMap = cardsAttributeIdMap;
	}

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}

	public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}

	// 获取所有支付方式集合
	public List<PaymentConfig> getAllPaymentConfigList() {
		return paymentConfigService.getAllList();
	}
}