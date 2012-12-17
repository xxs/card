package net.xxs.action.shop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.xxs.bean.Pager.Order;
import net.xxs.entity.Brand;
import net.xxs.entity.CardsAttribute;
import net.xxs.entity.CardsCategory;
import net.xxs.entity.PaymentConfig;
import net.xxs.service.BrandService;
import net.xxs.service.CardsAttributeService;
import net.xxs.service.CardsCategoryService;
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
 * 前台Action类 - 商品
 */

@ParentPackage("shop")
@InterceptorRefs({
	@InterceptorRef(value = "memberVerifyInterceptor"),
	@InterceptorRef(value = "shopStack")
})
public class CardsAction extends BaseShopAction {

	private static final long serialVersionUID = -4969421249817468001L;

	private String sign;
	private Map<String, String> cardsAttributeIdMap;
	private String orderType;
	private String viewType;
	
	private CardsCategory cardsCategory;
	private Brand brand;
	private List<CardsCategory> pathList;
	
	@Resource(name = "cardsServiceImpl")
	private CardsService cardsService;
	@Resource(name = "cardsCategoryServiceImpl")
	private CardsCategoryService cardsCategoryService;
	@Resource(name = "brandServiceImpl")
	private BrandService brandService;
	@Resource(name = "cardsAttributeServiceImpl")
	private CardsAttributeService cardsAttributeService;
	@Resource(name = "paymentConfigServiceImpl")
	private PaymentConfigService paymentConfigService;
	@Validations(
		requiredStrings = {
			@RequiredStringValidator(fieldName = "sign", message = "参数错误!")
		}
	)
	@InputConfig(resultName = "error")
	public String list() {
		if (StringUtils.equalsIgnoreCase(viewType, "tableType")) {
			viewType = "tableType";
		} else {
			viewType = "pictureType";
		}
		
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
		
		cardsCategory = cardsCategoryService.getCardsCategoryBySign(sign);
		if (cardsCategory == null) {
			addActionError("参数错误!");
			return ERROR;
		}
		
		if (brand != null && StringUtils.isNotEmpty(brand.getId())) {
			brand = brandService.load(brand.getId());
		} else {
			brand = null;
		}
		
		if (cardsAttributeIdMap == null || cardsAttributeIdMap.size() == 0) {
			pager = cardsService.getCardsPager(cardsCategory, brand, null, pager);
		} else {
			Map<CardsAttribute, String> cardsAttributeMap = new HashMap<CardsAttribute, String>();
			for (String cardsAttributeId : cardsAttributeIdMap.keySet()) {
				CardsAttribute cardsAttribute = cardsAttributeService.load(cardsAttributeId);
				String cardsAttributeOption = cardsAttributeIdMap.get(cardsAttributeId);
				cardsAttributeMap.put(cardsAttribute, cardsAttributeOption);
			}
			pager = cardsService.getCardsPager(cardsCategory, brand, cardsAttributeMap, pager);
		}
		pathList = cardsCategoryService.getCardsCategoryPathList(cardsCategory);
		
		if (StringUtils.equalsIgnoreCase(viewType, "tableType")) {
			return "table_list";
		} else {
			return "picture_list";
		}
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
		
		if (StringUtils.equalsIgnoreCase(viewType, "tableType")) {
			return "table_search";
		} else {
			return "picture_search";
		}
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

	public String getViewType() {
		return viewType;
	}

	public void setViewType(String viewType) {
		this.viewType = viewType;
	}

	public CardsCategory getCardsCategory() {
		return cardsCategory;
	}

	public void setCardsCategory(CardsCategory cardsCategory) {
		this.cardsCategory = cardsCategory;
	}

	public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}

	public List<CardsCategory> getPathList() {
		return pathList;
	}

	public void setPathList(List<CardsCategory> pathList) {
		this.pathList = pathList;
	}
	// 获取所有支付方式集合
	public List<PaymentConfig> getAllPaymentConfigList() {
		return paymentConfigService.getAllList();
	}
}