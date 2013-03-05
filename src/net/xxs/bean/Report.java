package net.xxs.bean;



/**
 * Bean类 - 统计报表
 */
public class Report {
	
	private String tongdao;//通道
	private Integer saleCount;//交易数量 
	private String saleMoney;// 交易金额
	public String getTongdao() {
		return tongdao;
	}
	public void setTongdao(String tongdao) {
		this.tongdao = tongdao;
	}
	public Integer getSaleCount() {
		return saleCount;
	}
	public void setSaleCount(Integer saleCount) {
		this.saleCount = saleCount;
	}
	public String getSaleMoney() {
		return saleMoney;
	}
	public void setSaleMoney(String saleMoney) {
		this.saleMoney = saleMoney;
	}
	
}