package net.xxs.entity;

import java.math.BigDecimal;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Transient;

import net.xxs.bean.CardsImage;
import net.xxs.bean.SpecificationValue;
import net.xxs.bean.PageTemplateConfig;
import net.xxs.bean.Setting;
import net.xxs.entity.CardsAttribute.AttributeType;
import net.xxs.util.JsonUtil;
import net.xxs.util.ReflectionUtil;
import net.xxs.util.SerialNumberUtil;
import net.xxs.util.SettingUtil;
import net.xxs.util.TemplateConfigUtil;

import org.apache.commons.lang.StringUtils;
import org.codehaus.jackson.type.TypeReference;
import org.compass.annotations.Index;
import org.compass.annotations.Searchable;
import org.compass.annotations.SearchableProperty;
import org.compass.annotations.Store;
import org.hibernate.annotations.ForeignKey;

/**
 * 实体类 - 充值卡
 */

@Entity
@Searchable
public class Cards extends BaseEntity {

	private static final long serialVersionUID = 8394952361534286179L;
	
	public static final int DEFAULT_CARDS_LIST_PAGE_SIZE = 12;// 充值卡列表默认每页显示数
	public static final int CARDS_ATTRIBUTE_VALUE_PROPERTY_COUNT = 20;// 充值卡属性值对象属性个数
	public static final String CARDS_ATTRIBUTE_VALUE_PROPERTY_NAME_PREFIX = "cardsAttributeValue";// 充值卡属性值对象属性名称前缀
	
	private String cardsSn;// 充值卡编号
	private String name;// 充值卡名称
	private BigDecimal price;// 销售价
	private Integer score;// 积分
	private Boolean isMarketable;// 是否上架
	private Boolean isBest;// 是否为精品充值卡
	private Boolean isNew;// 是否为新品充值卡
	private Boolean isHot;// 是否为热销充值卡
	private Boolean isSpecificationEnabled;// 是否启用充值卡规格
	private String introduction;// 介绍
	private String metaKeywords;// 页面关键词
	private String metaDescription;// 页面描述
	private String htmlPath;// HTML静态文件路径
	private String cardsImageStore;// 充值卡图片存储
	private String cardsAttributeValue0;// 充值卡属性值0
	private String cardsAttributeValue1;// 充值卡属性值1
	private String cardsAttributeValue2;// 充值卡属性值2
	private String cardsAttributeValue3;// 充值卡属性值3
	private String cardsAttributeValue4;// 充值卡属性值4
	private String cardsAttributeValue5;// 充值卡属性值5
	private String cardsAttributeValue6;// 充值卡属性值6
	private String cardsAttributeValue7;// 充值卡属性值7
	private String cardsAttributeValue8;// 充值卡属性值8
	private String cardsAttributeValue9;// 充值卡属性值9
	private String cardsAttributeValue10;// 充值卡属性值10
	private String cardsAttributeValue11;// 充值卡属性值11
	private String cardsAttributeValue12;// 充值卡属性值12
	private String cardsAttributeValue13;// 充值卡属性值13
	private String cardsAttributeValue14;// 充值卡属性值14
	private String cardsAttributeValue15;// 充值卡属性值15
	private String cardsAttributeValue16;// 充值卡属性值16
	private String cardsAttributeValue17;// 充值卡属性值17
	private String cardsAttributeValue18;// 充值卡属性值18
	private String cardsAttributeValue19;// 充值卡属性值19
	private String cardsParameterValueStore;// 充值卡参数存储
	
	private CardsCategory cardsCategory;// 充值卡分类
	private CardsType cardsType;// 充值卡类型
	private Brand brand;// 品牌
	
	private Set<Specification> specificationSet = new HashSet<Specification>();// 规格
	private Set<Product> productSet = new LinkedHashSet<Product>();// 货品

	@Column(nullable = false, unique = true)
	public String getCardsSn() {
		return cardsSn;
	}

	public void setCardsSn(String cardsSn) {
		this.cardsSn = cardsSn;
	}

	@SearchableProperty(store = Store.YES, index = Index.ANALYZED)
	@Column(nullable = false)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@SearchableProperty(store = Store.YES, index = Index.ANALYZED)
	@Column(nullable = false, precision = 15, scale = 5)
	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = SettingUtil.setPriceScale(price);
	}
	
	@Column(nullable = false)
	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}
	
	@SearchableProperty(store = Store.YES, index = Index.ANALYZED)
	@Column(nullable = false)
	public Boolean getIsMarketable() {
		return isMarketable;
	}

	public void setIsMarketable(Boolean isMarketable) {
		this.isMarketable = isMarketable;
	}

	@SearchableProperty(store = Store.YES, index = Index.ANALYZED)
	@Column(nullable = false)
	public Boolean getIsBest() {
		return isBest;
	}

	public void setIsBest(Boolean isBest) {
		this.isBest = isBest;
	}

	@SearchableProperty(store = Store.YES, index = Index.ANALYZED)
	@Column(nullable = false)
	public Boolean getIsNew() {
		return isNew;
	}

	public void setIsNew(Boolean isNew) {
		this.isNew = isNew;
	}

	@SearchableProperty(store = Store.YES, index = Index.ANALYZED)
	@Column(nullable = false)
	public Boolean getIsHot() {
		return isHot;
	}

	public void setIsHot(Boolean isHot) {
		this.isHot = isHot;
	}

	@Column(nullable = false)
	public Boolean getIsSpecificationEnabled() {
		return isSpecificationEnabled;
	}

	public void setIsSpecificationEnabled(Boolean isSpecificationEnabled) {
		this.isSpecificationEnabled = isSpecificationEnabled;
	}

	@Lob
	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	@Column(length = 3000)
	public String getMetaKeywords() {
		return metaKeywords;
	}

	public void setMetaKeywords(String metaKeywords) {
		this.metaKeywords = metaKeywords;
	}

	@Column(length = 3000)
	public String getMetaDescription() {
		return metaDescription;
	}

	public void setMetaDescription(String metaDescription) {
		this.metaDescription = metaDescription;
	}

	@SearchableProperty(store = Store.YES, index = Index.NO)
	@Column(nullable = false, updatable = false)
	public String getHtmlPath() {
		return htmlPath;
	}

	public void setHtmlPath(String htmlPath) {
		this.htmlPath = htmlPath;
	}

	@SearchableProperty(store = Store.YES, index = Index.NO)
	@Column(length = 3000)
	public String getCardsImageStore() {
		return cardsImageStore;
	}

	public void setCardsImageStore(String cardsImageStore) {
		this.cardsImageStore = cardsImageStore;
	}

	public String getCardsAttributeValue0() {
		return cardsAttributeValue0;
	}

	public void setCardsAttributeValue0(String cardsAttributeValue0) {
		this.cardsAttributeValue0 = cardsAttributeValue0;
	}

	public String getCardsAttributeValue1() {
		return cardsAttributeValue1;
	}

	public void setCardsAttributeValue1(String cardsAttributeValue1) {
		this.cardsAttributeValue1 = cardsAttributeValue1;
	}

	public String getCardsAttributeValue2() {
		return cardsAttributeValue2;
	}

	public void setCardsAttributeValue2(String cardsAttributeValue2) {
		this.cardsAttributeValue2 = cardsAttributeValue2;
	}

	public String getCardsAttributeValue3() {
		return cardsAttributeValue3;
	}

	public void setCardsAttributeValue3(String cardsAttributeValue3) {
		this.cardsAttributeValue3 = cardsAttributeValue3;
	}

	public String getCardsAttributeValue4() {
		return cardsAttributeValue4;
	}

	public void setCardsAttributeValue4(String cardsAttributeValue4) {
		this.cardsAttributeValue4 = cardsAttributeValue4;
	}

	public String getCardsAttributeValue5() {
		return cardsAttributeValue5;
	}

	public void setCardsAttributeValue5(String cardsAttributeValue5) {
		this.cardsAttributeValue5 = cardsAttributeValue5;
	}

	public String getCardsAttributeValue6() {
		return cardsAttributeValue6;
	}

	public void setCardsAttributeValue6(String cardsAttributeValue6) {
		this.cardsAttributeValue6 = cardsAttributeValue6;
	}

	public String getCardsAttributeValue7() {
		return cardsAttributeValue7;
	}

	public void setCardsAttributeValue7(String cardsAttributeValue7) {
		this.cardsAttributeValue7 = cardsAttributeValue7;
	}

	public String getCardsAttributeValue8() {
		return cardsAttributeValue8;
	}

	public void setCardsAttributeValue8(String cardsAttributeValue8) {
		this.cardsAttributeValue8 = cardsAttributeValue8;
	}

	public String getCardsAttributeValue9() {
		return cardsAttributeValue9;
	}

	public void setCardsAttributeValue9(String cardsAttributeValue9) {
		this.cardsAttributeValue9 = cardsAttributeValue9;
	}

	public String getCardsAttributeValue10() {
		return cardsAttributeValue10;
	}

	public void setCardsAttributeValue10(String cardsAttributeValue10) {
		this.cardsAttributeValue10 = cardsAttributeValue10;
	}

	public String getCardsAttributeValue11() {
		return cardsAttributeValue11;
	}

	public void setCardsAttributeValue11(String cardsAttributeValue11) {
		this.cardsAttributeValue11 = cardsAttributeValue11;
	}

	public String getCardsAttributeValue12() {
		return cardsAttributeValue12;
	}

	public void setCardsAttributeValue12(String cardsAttributeValue12) {
		this.cardsAttributeValue12 = cardsAttributeValue12;
	}

	public String getCardsAttributeValue13() {
		return cardsAttributeValue13;
	}

	public void setCardsAttributeValue13(String cardsAttributeValue13) {
		this.cardsAttributeValue13 = cardsAttributeValue13;
	}

	public String getCardsAttributeValue14() {
		return cardsAttributeValue14;
	}

	public void setCardsAttributeValue14(String cardsAttributeValue14) {
		this.cardsAttributeValue14 = cardsAttributeValue14;
	}

	public String getCardsAttributeValue15() {
		return cardsAttributeValue15;
	}

	public void setCardsAttributeValue15(String cardsAttributeValue15) {
		this.cardsAttributeValue15 = cardsAttributeValue15;
	}

	public String getCardsAttributeValue16() {
		return cardsAttributeValue16;
	}

	public void setCardsAttributeValue16(String cardsAttributeValue16) {
		this.cardsAttributeValue16 = cardsAttributeValue16;
	}

	public String getCardsAttributeValue17() {
		return cardsAttributeValue17;
	}

	public void setCardsAttributeValue17(String cardsAttributeValue17) {
		this.cardsAttributeValue17 = cardsAttributeValue17;
	}

	public String getCardsAttributeValue18() {
		return cardsAttributeValue18;
	}

	public void setCardsAttributeValue18(String cardsAttributeValue18) {
		this.cardsAttributeValue18 = cardsAttributeValue18;
	}

	public String getCardsAttributeValue19() {
		return cardsAttributeValue19;
	}

	public void setCardsAttributeValue19(String cardsAttributeValue19) {
		this.cardsAttributeValue19 = cardsAttributeValue19;
	}

	@Column(length = 3000)
	public String getCardsParameterValueStore() {
		return cardsParameterValueStore;
	}

	public void setCardsParameterValueStore(String cardsParameterValueStore) {
		this.cardsParameterValueStore = cardsParameterValueStore;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(nullable = false)
	@ForeignKey(name = "fk_cards_cards_category")
	public CardsCategory getCardsCategory() {
		return cardsCategory;
	}

	public void setCardsCategory(CardsCategory cardsCategory) {
		this.cardsCategory = cardsCategory;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@ForeignKey(name = "fk_cards_cards_type")
	public CardsType getCardsType() {
		return cardsType;
	}

	public void setCardsType(CardsType cardsType) {
		this.cardsType = cardsType;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@ForeignKey(name = "fk_cards_brand")
	public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}
	
	@ManyToMany(fetch = FetchType.LAZY)
	@OrderBy("orderList asc")
	@ForeignKey(name = "fk_specification_set")
	public Set<Specification> getSpecificationSet() {
		return specificationSet;
	}

	public void setSpecificationSet(Set<Specification> specificationSet) {
		this.specificationSet = specificationSet;
	}

	@OneToMany(mappedBy = "cards", fetch = FetchType.LAZY, cascade = {CascadeType.REMOVE})
	public Set<Product> getProductSet() {
		return productSet;
	}

	public void setProductSet(Set<Product> productSet) {
		this.productSet = productSet;
	}

	
	// 获取充值卡图片
	@Transient
	public List<CardsImage> getCardsImageList() {
		if (StringUtils.isEmpty(cardsImageStore)) {
			return null;
		}
		try {
			return JsonUtil.toObject(cardsImageStore, new TypeReference<List<CardsImage>>() {});
		} catch (Exception e) {
			return null;
		}
	}
	
	// 设置充值卡图片
	@Transient
	public void setCardsImageList(List<CardsImage> cardsImageList) {
		if (cardsImageList == null || cardsImageList.size() == 0) {
			cardsImageStore = null;
			return;
		}
		Collections.sort(cardsImageList);
		cardsImageStore = JsonUtil.toJson(cardsImageList);
	}
	
	// 获取充值卡属性值
	@Transient
	public Object getCardsAttributeValue(CardsAttribute cardsAttribute) {
		if (cardsAttribute == null) {
			return null;
		}
		String propertyName = CARDS_ATTRIBUTE_VALUE_PROPERTY_NAME_PREFIX + cardsAttribute.getPropertyIndex();
		return (String) ReflectionUtil.invokeGetterMethod(this, propertyName);
	}
	
	// 设置充值卡属性值
	@Transient
	public void setCardsAttributeValue(CardsAttribute cardsAttribute, String cardsAttributeValue) {
		if (cardsAttribute == null) {
			return;
		}
		if (cardsAttribute.getAttributeType() == AttributeType.filter && !cardsAttribute.getOptionList().contains(cardsAttributeValue)) {
			throw new IllegalArgumentException("cardsAttributeValue error");
		}
		String propertyName = CARDS_ATTRIBUTE_VALUE_PROPERTY_NAME_PREFIX + cardsAttribute.getPropertyIndex();
		ReflectionUtil.invokeSetterMethod(this, propertyName, cardsAttributeValue);
	}
	
	// 获取充值卡参数值
	@Transient
	public Map<String, String> getCardsParameterValueMap() {
		if (StringUtils.isEmpty(cardsParameterValueStore)) {
			return null;
		}
		try {
			return JsonUtil.toObject(cardsParameterValueStore, new TypeReference<Map<String, String>>() {});
		} catch (Exception e) {
			return null;
		}
	}
	
	// 设置充值卡参数值
	@Transient
	public void setCardsParameterValueMap(Map<String, String> cardsParameterValueMap) {
		if (cardsParameterValueMap == null || cardsParameterValueMap.size() == 0) {
			return;
		}
		cardsParameterValueStore = JsonUtil.toJson(cardsParameterValueMap);
	}
	
	// 保存处理
	@Override
	@Transient
	public void onSave() {
		if (price == null || price.compareTo(new BigDecimal(0)) < 0) {
			price = new BigDecimal(0);
		}
		if (score == null || score < 0) {
			score = 0;
		}
		if (isMarketable == null) {
			isMarketable = false;
		}
		if (isBest == null) {
			isBest = false;
		}
		if (isNew == null) {
			isNew = false;
		}
		if (isHot == null) {
			isHot = false;
		}
		if (isSpecificationEnabled == null) {
			isSpecificationEnabled = false;
		}
		if (StringUtils.isEmpty(cardsSn)) {
			cardsSn = SerialNumberUtil.buildCardsSn();
		}
		PageTemplateConfig pageTemplateConfig = TemplateConfigUtil.getPageTemplateConfig(PageTemplateConfig.CARDS_CONTENT);
		htmlPath = pageTemplateConfig.getHtmlRealPath();
	}
	
	// 更新处理
	@Override
	@Transient
	public void onUpdate() {
		if (price == null || price.compareTo(new BigDecimal(0)) < 0) {
			price = new BigDecimal(0);
		}
		if (score == null || score < 0) {
			score = 0;
		}
		if (isMarketable == null) {
			isMarketable = false;
		}
		if (isBest == null) {
			isBest = false;
		}
		if (isNew == null) {
			isNew = false;
		}
		if (isHot == null) {
			isHot = false;
		}
		if (isSpecificationEnabled == null) {
			isSpecificationEnabled = false;
		}
		if (StringUtils.isEmpty(cardsSn)) {
			cardsSn = SerialNumberUtil.buildCardsSn();
		}
	}
	
	// 获取默认货品
	@Transient
	public Product getDefaultProduct() {
		if (isSpecificationEnabled) {
			for (Product product : productSet) {
				if (product.getIsDefault()) {
					return product;
				}
			}
		} else {
			for (Product product : productSet) {
				return product;
			}
		}
		return null;
	}
	
	// 获取默认充值卡图片（大）
	@Transient
	public String getDefaultBigCardsImagePath() {
		List<CardsImage> cardsImageList = getCardsImageList();
		if (cardsImageList != null && cardsImageList.size() > 0) {
			return cardsImageList.get(0).getBigImagePath();
		} else {
			Setting setting = SettingUtil.getSetting();
			return setting.getDefaultBigCardsImagePath();
		}
	}
	
	// 获取默认充值卡图片（小）
	@Transient
	public String getDefaultSmallCardsImagePath() {
		List<CardsImage> cardsImageList = getCardsImageList();
		if (cardsImageList != null && cardsImageList.size() > 0) {
			return cardsImageList.get(0).getSmallImagePath();
		} else {
			Setting setting = SettingUtil.getSetting();
			return setting.getDefaultSmallCardsImagePath();
		}
	}
	
	// 获取默认充值卡图片（缩略图）
	@Transient
	public String getDefaultThumbnailCardsImagePath() {
		List<CardsImage> cardsImageList = getCardsImageList();
		if (cardsImageList != null && cardsImageList.size() > 0) {
			return cardsImageList.get(0).getThumbnailImagePath();
		} else {
			Setting setting = SettingUtil.getSetting();
			return setting.getDefaultThumbnailCardsImagePath();
		}
	}
	
	// 获取充值卡规格值
	@Transient
	public Set<SpecificationValue> getSpecificationValueSet() {
		Set<SpecificationValue> specificationValueSet = new HashSet<SpecificationValue>();
		for (Product product : productSet) {
			if (product.getIsMarketable()) {
				specificationValueSet.addAll(product.getSpecificationValueList());
			}
		}
		return specificationValueSet;
	}
	
	// 设置充值卡属性值为NULL
	@Transient
	public void setCardsAttributeValueToNull() {
		for (int i = 0; i < CARDS_ATTRIBUTE_VALUE_PROPERTY_COUNT; i ++) {
			String propertyName = CARDS_ATTRIBUTE_VALUE_PROPERTY_NAME_PREFIX + i;
			ReflectionUtil.invokeSetterMethod(this, propertyName, null, String.class);
		}
	}
}