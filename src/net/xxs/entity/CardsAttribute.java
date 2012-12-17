package net.xxs.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

import net.xxs.util.JsonUtil;

import org.apache.commons.lang.StringUtils;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.hibernate.annotations.ForeignKey;

/**
 * 实体类 - 商品属性
 */

@Entity
@JsonIgnoreProperties(value = {"JavassistLazyInitializer", "handler", "createDate", "modifyDate", "optionStore", "propertyIndex", "cardsType"})
public class CardsAttribute extends BaseEntity {

	private static final long serialVersionUID = 2989102568413246570L;
	
	public static final String OPTION_TEXT_SEPARATOR = ",";// 可选项文本分隔符
	
	// 商品属性类型（筛选项、输入项）
	public enum AttributeType {
		filter, input
	}

	private String name;// 名称
	private AttributeType attributeType;// 属性类型
	private String optionStore;// 可选项储存
	private Integer orderList;// 排序
	private Integer propertyIndex;// 对象属性序号
	
	private CardsType cardsType;// 商品类型

	@Column(nullable = false)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Column(nullable = false, updatable = false)
	public AttributeType getAttributeType() {
		return attributeType;
	}

	public void setAttributeType(AttributeType attributeType) {
		this.attributeType = attributeType;
	}

	public String getOptionStore() {
		return optionStore;
	}

	public void setOptionStore(String optionStore) {
		this.optionStore = optionStore;
	}
	
	@Column(nullable = false)
	public Integer getPropertyIndex() {
		return propertyIndex;
	}

	public void setPropertyIndex(Integer propertyIndex) {
		this.propertyIndex = propertyIndex;
	}

	public Integer getOrderList() {
		return orderList;
	}

	public void setOrderList(Integer orderList) {
		this.orderList = orderList;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(nullable = false)
	@ForeignKey(name = "fk_cards_attribute_cards_type")
	public CardsType getCardsType() {
		return cardsType;
	}

	public void setCardsType(CardsType cardsType) {
		this.cardsType = cardsType;
	}
	
	// 获取可选项
	@SuppressWarnings("unchecked")
	@Transient
	public List<String> getOptionList() {
		if (StringUtils.isEmpty(optionStore)) {
			return null;
		}
		return JsonUtil.toObject(optionStore, ArrayList.class);
	}
	
	// 设置可选项
	@Transient
	public void setOptionList(List<String> optionList) {
		if (optionList == null || optionList.size() == 0) {
			optionStore = null;
			return;
		}
		optionStore = JsonUtil.toJson(optionList);
	}
	
	// 获取可选项字符串
	@SuppressWarnings("unchecked")
	@Transient
	public String getOptionText() {
		if (StringUtils.isEmpty(optionStore)) {
			return null;
		}
		List<String> optionList = JsonUtil.toObject(optionStore, ArrayList.class);
		return StringUtils.join(optionList, OPTION_TEXT_SEPARATOR);
	}
	
	// 设置可选项字符串
	@Transient
	public void setOptionText(String optionText) {
		if (StringUtils.isEmpty(optionText)) {
			optionStore = null;
			return;
		}
		optionStore = JsonUtil.toJson(optionText.split(OPTION_TEXT_SEPARATOR));
	}
	
	// 保存处理
	@Override
	@Transient
	public void onSave() {
		if (orderList == null || orderList < 0) {
			orderList = 0;
		}
	}
	
	// 更新处理
	@Override
	@Transient
	public void onUpdate() {
		if (orderList == null || orderList < 0) {
			orderList = 0;
		}
	}

}