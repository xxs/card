package net.xxs.dao;

import java.util.List;

import net.xxs.bean.Pager;
import net.xxs.entity.CardsAttribute;
import net.xxs.entity.CardsType;

/**
 * Dao接口 - 充值卡属性
 */

public interface CardsAttributeDao extends BaseDao<CardsAttribute, String> {
	
	/**
	 * 根据充值卡类型获取未使用的充值卡属性值对象属性序号,若无可用序号则返回null
	 * 
	 * @return 充值卡属性值对象属性序号
	 */
	public Integer getUnusedPropertyIndex(CardsType cardsType);
	
	/**
	 * 根据充值卡类型获取充值卡属性集合
	 * 
	 * @return 充值卡属性集合
	 */
	public List<CardsAttribute> getCardsAttributeList(CardsType cardsType);
	
	/**
	 * 根据充值卡类型获取充值卡属性分页对象
	 * 
	 * @return 分页对象
	 */
	public Pager getCardsAttributePager(CardsType cardsType, Pager pager);

}