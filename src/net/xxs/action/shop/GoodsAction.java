package net.xxs.action.shop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.xxs.bean.Pager.Order;
import net.xxs.entity.Brand;
import net.xxs.entity.GoodsAttribute;
import net.xxs.entity.GoodsCategory;
import net.xxs.entity.PaymentConfig;
import net.xxs.service.BrandService;
import net.xxs.service.GoodsAttributeService;
import net.xxs.service.GoodsCategoryService;
import net.xxs.service.GoodsService;
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
public class GoodsAction extends BaseShopAction {

	private static final long serialVersionUID = -4969421249817468001L;

	private String sign;
	private Map<String, String> goodsAttributeIdMap;
	private String orderType;
	private String viewType;
	
	private GoodsCategory goodsCategory;
	private Brand brand;
	private List<GoodsCategory> pathList;
	
	@Resource(name = "goodsServiceImpl")
	private GoodsService goodsService;
	@Resource(name = "goodsCategoryServiceImpl")
	private GoodsCategoryService goodsCategoryService;
	@Resource(name = "brandServiceImpl")
	private BrandService brandService;
	@Resource(name = "goodsAttributeServiceImpl")
	private GoodsAttributeService goodsAttributeService;
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
		
		goodsCategory = goodsCategoryService.getGoodsCategoryBySign(sign);
		if (goodsCategory == null) {
			addActionError("参数错误!");
			return ERROR;
		}
		
		if (brand != null && StringUtils.isNotEmpty(brand.getId())) {
			brand = brandService.load(brand.getId());
		} else {
			brand = null;
		}
		
		if (goodsAttributeIdMap == null || goodsAttributeIdMap.size() == 0) {
			pager = goodsService.getGoodsPager(goodsCategory, brand, null, pager);
		} else {
			Map<GoodsAttribute, String> goodsAttributeMap = new HashMap<GoodsAttribute, String>();
			for (String goodsAttributeId : goodsAttributeIdMap.keySet()) {
				GoodsAttribute goodsAttribute = goodsAttributeService.load(goodsAttributeId);
				String goodsAttributeOption = goodsAttributeIdMap.get(goodsAttributeId);
				goodsAttributeMap.put(goodsAttribute, goodsAttributeOption);
			}
			pager = goodsService.getGoodsPager(goodsCategory, brand, goodsAttributeMap, pager);
		}
		pathList = goodsCategoryService.getGoodsCategoryPathList(goodsCategory);
		
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
		
		pager = goodsService.search(pager);
		
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

	public Map<String, String> getGoodsAttributeIdMap() {
		return goodsAttributeIdMap;
	}

	public void setGoodsAttributeIdMap(Map<String, String> goodsAttributeIdMap) {
		this.goodsAttributeIdMap = goodsAttributeIdMap;
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

	public GoodsCategory getGoodsCategory() {
		return goodsCategory;
	}

	public void setGoodsCategory(GoodsCategory goodsCategory) {
		this.goodsCategory = goodsCategory;
	}

	public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}

	public List<GoodsCategory> getPathList() {
		return pathList;
	}

	public void setPathList(List<GoodsCategory> pathList) {
		this.pathList = pathList;
	}
	// 获取所有支付方式集合
	public List<PaymentConfig> getAllPaymentConfigList() {
		return paymentConfigService.getAllList();
	}
}