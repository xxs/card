package net.xxs.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Transient;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.hibernate.annotations.ForeignKey;

/**
 * 实体类 - 地区
 */

@Entity
@JsonIgnoreProperties(value = {"JavassistLazyInitializer", "handler", "createDate", "modifyDate", "parent", "children"})
public class Area extends BaseEntity {

	private static final long serialVersionUID = -2158109459123036967L;
	
	public static final String PATH_SEPARATOR = ",";// 路径分隔符

	private String name;// 名称
	private String displayName;// 完整地区名称
	private String path;// 路径
	private Integer grade;// 层级
	private Integer orderList;// 排序
	
	private Area parent;// 上级地区
	
	private Set<Area> children = new HashSet<Area>();// 下级地区

	@Column(nullable = false)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Column(nullable = false, length = 3000)
	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
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
	@ForeignKey(name = "fk_area_parent")
	public Area getParent() {
		return parent;
	}

	public void setParent(Area parent) {
		this.parent = parent;
	}

	@OneToMany(mappedBy = "parent", fetch = FetchType.LAZY, cascade = {CascadeType.REMOVE})
	@OrderBy("orderList asc")
	public Set<Area> getChildren() {
		return children;
	}

	public void setChildren(Set<Area> children) {
		this.children = children;
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

}