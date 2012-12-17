package net.xxs.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Transient;

import org.hibernate.annotations.ForeignKey;

/**
 * 实体类 - 商品分类
 */

@Entity
public class CardsCategory extends BaseEntity {

	private static final long serialVersionUID = -5132652107151648662L;

	public static final String PATH_SEPARATOR = ",";// 树路径分隔符
	public static final String CARDS_LIST_URL_PREFIX = "/shop/cards_list/";// 商品列表URL前缀
	public static final String CARDS_LIST_URL_SUFFIX = "htm";// 商品列表URL后缀

	private String name;// 分类名称
	private String sign;// 标识
	private String metaKeywords;// 页面关键词
	private String metaDescription;// 页面描述
	private String path;// 树路径
	private Integer grade;// 层级
	private Integer orderList;// 排序
	
	private CardsCategory parent;// 上级分类
	private CardsType cardsType;// 商品类型
	
	private Set<CardsCategory> children = new HashSet<CardsCategory>();// 下级分类
	private Set<Cards> cardsSet = new HashSet<Cards>();// 商品

	@Column(nullable = false)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Column(nullable = false, unique = true)
	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
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
	
	@Column(nullable = false, length = 3000)
	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
	
	@Column(nullable = false)
	public Integer getGrade() {
		return grade;
	}

	public void setGrade(Integer grade) {
		this.grade = grade;
	}

	public Integer getOrderList() {
		return orderList;
	}

	public void setOrderList(Integer orderList) {
		this.orderList = orderList;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@ForeignKey(name = "fk_cards_category_parent")
	public CardsCategory getParent() {
		return parent;
	}

	public void setParent(CardsCategory parent) {
		this.parent = parent;
	}

	@OneToMany(mappedBy = "parent", fetch = FetchType.LAZY)
	@OrderBy("orderList asc")
	public Set<CardsCategory> getChildren() {
		return children;
	}

	public void setChildren(Set<CardsCategory> children) {
		this.children = children;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@ForeignKey(name = "fk_cards_category_cards_type")
	public CardsType getCardsType() {
		return cardsType;
	}

	public void setCardsType(CardsType cardsType) {
		this.cardsType = cardsType;
	}

	@OneToMany(mappedBy = "cardsCategory", fetch = FetchType.LAZY)
	public Set<Cards> getCardsSet() {
		return cardsSet;
	}

	public void setCardsSet(Set<Cards> cardsSet) {
		this.cardsSet = cardsSet;
	}
	
	// 保存处理
	@Override
	@Transient
	public void onSave() {
		if (grade == null || grade < 0) {
			grade = 0;
		}
		if (orderList == null || orderList < 0) {
			orderList = 0;
		}
	}
	
	// 更新处理
	@Override
	@Transient
	public void onUpdate() {
		if (grade == null || grade < 0) {
			grade = 0;
		}
		if (orderList == null || orderList < 0) {
			orderList = 0;
		}
	}
	
	// 获取URL
	@Transient
	public String getUrl() {
		return CARDS_LIST_URL_PREFIX + sign + "." + CARDS_LIST_URL_SUFFIX;
	}

}