package net.xxs.dao.impl;

import java.util.ArrayList;
import java.util.List;

import net.xxs.bean.Pager;
import net.xxs.dao.CardsAttributeDao;
import net.xxs.entity.Cards;
import net.xxs.entity.CardsAttribute;
import net.xxs.entity.CardsType;

import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

/**
 * Dao实现类 - 商品属性
 */

@Repository("cardsAttributeDaoImpl")
public class CardsAttributeDaoImpl extends BaseDaoImpl<CardsAttribute, String> implements CardsAttributeDao {
	
	@SuppressWarnings("unchecked")
	public Integer getUnusedPropertyIndex(CardsType cardsType) {
		String hql = "from CardsAttribute as cardsAttribute where cardsAttribute.cardsType = :cardsType";
		List<CardsAttribute> cardsAttributeList = getSession().createQuery(hql).setParameter("cardsType", cardsType).list();
		if (cardsAttributeList != null && cardsAttributeList.size() >= Cards.CARDS_ATTRIBUTE_VALUE_PROPERTY_COUNT) {
			return null;
		}
		List<Integer> usedPropertyIndexList = new ArrayList<Integer>();
		for (CardsAttribute cardsAttribute : cardsAttributeList) {
			usedPropertyIndexList.add(cardsAttribute.getPropertyIndex());
		}
		for (int i = 0; i < Cards.CARDS_ATTRIBUTE_VALUE_PROPERTY_COUNT; i ++) {
			if (!usedPropertyIndexList.contains(new Integer(i))) {
				return i;
			}
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public List<CardsAttribute> getCardsAttributeList(CardsType cardsType) {
		String hql = "from CardsAttribute as cardsAttribute where cardsAttribute.cardsType = :cardsType order by cardsAttribute.orderList asc";
		return getSession().createQuery(hql).setParameter("cardsType", cardsType).list();
	}
	
	public Pager getCardsAttributePager(CardsType cardsType, Pager pager) {
		return findPager(pager, Restrictions.eq("cardsType", cardsType));
	}
	
	// 删除的同时清除商品对应属性值
	@Override
	public void delete(CardsAttribute cardsAttribute) {
		String propertyName = Cards.CARDS_ATTRIBUTE_VALUE_PROPERTY_NAME_PREFIX + cardsAttribute.getPropertyIndex();
		String hql = "update Cards set " + propertyName + " = :propertyName where cardsType = :cardsType";
		getSession().createQuery(hql).setParameter("propertyName", null).setParameter("cardsType", cardsAttribute.getCardsType()).executeUpdate();
		super.delete(cardsAttribute);
	}

	// 删除的同时清除商品对应属性值
	@Override
	public void delete(String id) {
		CardsAttribute cardsAttribute = load(id);
		this.delete(cardsAttribute);
	}

	// 删除的同时清除商品对应属性值
	@Override
	public void delete(String[] ids) {
		for (String id : ids) {
			this.delete(id);
		}
	}

}