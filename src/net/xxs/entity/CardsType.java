package net.xxs.entity;

import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Transient;

import net.xxs.bean.CardsParameter;
import net.xxs.util.JsonUtil;

import org.apache.commons.lang.StringUtils;
import org.codehaus.jackson.type.TypeReference;
import org.hibernate.annotations.ForeignKey;

/**
 * 实体类 - 充值卡类型
 */

@Entity
public class CardsType extends BaseEntity {

	private static final long serialVersionUID = -6173231303962800416L;

	private String name;// 类型名称
	private String cardsParameterStore;// 充值卡参数存储
	
	private Set<CardsAttribute> cardsAttributeSet = new HashSet<CardsAttribute>();// 充值卡属性
	private Set<Cards> cardsSet = new HashSet<Cards>();// 充值卡
	private Set<CardsCategory> cardsCategorySet = new HashSet<CardsCategory>();// 充值卡分类
	private Set<Brand> brandSet = new HashSet<Brand>();// 充值卡品牌
	
	@Column(nullable = false)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(length = 3000)
	public String getCardsParameterStore() {
		return cardsParameterStore;
	}

	public void setCardsParameterStore(String cardsParameterStore) {
		this.cardsParameterStore = cardsParameterStore;
	}

	@OneToMany(mappedBy = "cardsType", fetch = FetchType.LAZY, cascade = {CascadeType.REMOVE})
	@OrderBy("orderList asc")
	public Set<CardsAttribute> getCardsAttributeSet() {
		return cardsAttributeSet;
	}

	public void setCardsAttributeSet(Set<CardsAttribute> cardsAttributeSet) {
		this.cardsAttributeSet = cardsAttributeSet;
	}

	@OneToMany(mappedBy = "cardsType", fetch = FetchType.LAZY)
	public Set<Cards> getCardsSet() {
		return cardsSet;
	}

	public void setCardsSet(Set<Cards> cardsSet) {
		this.cardsSet = cardsSet;
	}
	
	@OneToMany(mappedBy = "cardsType", fetch = FetchType.LAZY)
	public Set<CardsCategory> getCardsCategorySet() {
		return cardsCategorySet;
	}

	public void setCardsCategorySet(Set<CardsCategory> cardsCategorySet) {
		this.cardsCategorySet = cardsCategorySet;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	@OrderBy("name asc")
	@ForeignKey(name = "fk_cards_type_brand_set")
	public Set<Brand> getBrandSet() {
		return brandSet;
	}

	public void setBrandSet(Set<Brand> brandSet) {
		this.brandSet = brandSet;
	}

	// 获取充值卡参数集合
	@SuppressWarnings("unchecked")
	@Transient
	public List<CardsParameter> getCardsParameterList() {
		if (StringUtils.isEmpty(cardsParameterStore)) {
			return null;
		}
		try {
			return JsonUtil.toObject(cardsParameterStore, new TypeReference<List<CardsParameter>>() {});
		} catch (Exception e) {
			return null;
		}
	}
	
	// 设置充值卡参数集合
	@Transient
	public void setCardsParameterList(List<CardsParameter> cardsParameterList) {
		if (cardsParameterList == null || cardsParameterList.size() == 0) {
			cardsParameterStore = null;
			return;
		}
		Collections.sort(cardsParameterList);
		cardsParameterStore = JsonUtil.toJson(cardsParameterList);
	}

}