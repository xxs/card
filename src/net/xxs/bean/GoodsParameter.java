package net.xxs.bean;

import net.xxs.util.CommonUtil;

/**
 * Bean类 - 商品参数
 */

public class GoodsParameter implements Comparable<GoodsParameter> {
	
	private String id;// ID
	private String name;// 参数名称
	private Integer orderList;// 排序
	
	public GoodsParameter() {
		this.id = CommonUtil.getUUID();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getOrderList() {
		return orderList;
	}

	public void setOrderList(Integer orderList) {
		this.orderList = orderList;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (obj == null) {
			return false;
		}
		if (obj instanceof GoodsParameter) {
			GoodsParameter goodsParameter = (GoodsParameter) obj;
			if (this.getId() == null || goodsParameter.getId() == null) {
				return false;
			} else {
				return (this.getId().equals(goodsParameter.getId()));
			}
		}
		return false;
	}
	
	@Override
	public int hashCode() {
		return id == null ? System.identityHashCode(this) : (this.getClass().getName() + this.getId()).hashCode();
	}

	public int compareTo(GoodsParameter goodsParameter) {
		if (goodsParameter.getOrderList() == null) {
			return 1;
		}
		if (this.getOrderList() == null) {
			return -1;
		}
		return this.getOrderList().compareTo(goodsParameter.getOrderList());
	}

}