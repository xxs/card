package net.xxs.service;

import java.util.List;

import net.xxs.bean.Pager;
import net.xxs.entity.CardsAttribute;
import net.xxs.entity.CardsType;

/**
 * Service接口 - 商品属性
 */

public interface CardsAttributeService extends BaseService<CardsAttribute, String> {
	
	/**
	 * 根据商品类型获取未使用的商品属性值对象属性序号,若无可用序号则返回null
	 * 
	 * @return 商品属性值对象属性序号
	 */
	public Integer getUnusedPropertyIndex(CardsType cardsType);
	
	/**
	 * 根据商品类型获取商品属性集合
	 * 
	 * @return 商品属性集合
	 */
	public List<CardsAttribute> getCardsAttributeList(CardsType cardsType);
	
	/**
	 * 根据商品类型获取商品属性分页对象
	 * 
	 * @return 分页对象
	 */
	public Pager getCardsAttributePager(CardsType cardsType, Pager pager);

}