package net.xxs.bean;


/**
 * Bean类 - 购物车项Cookie
 */

public class CartItemCookie {
	
	public static final String CART_ITEM_LIST_COOKIE_NAME = "cartItemList";// 保存未登录会员购物车项集合的Cookie名称
	public static final int CART_ITEM_LIST_COOKIE_MAX_AGE = 86400;// 保存未登录会员购物车项集合的Cookie最大有效时间（单位：秒）
	
	private String i;// 充值卡ID
	private Integer q;// 充值卡购买数量
	
	public String getI() {
		return i;
	}
	
	public void setI(String i) {
		this.i = i;
	}

	public Integer getQ() {
		return q;
	}

	public void setQ(Integer q) {
		this.q = q;
	}
	
}