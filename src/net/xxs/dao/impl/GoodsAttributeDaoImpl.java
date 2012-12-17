package net.xxs.dao.impl;

import java.util.ArrayList;
import java.util.List;

import net.xxs.bean.Pager;
import net.xxs.dao.GoodsAttributeDao;
import net.xxs.entity.Goods;
import net.xxs.entity.GoodsAttribute;
import net.xxs.entity.GoodsType;

import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

/**
 * Dao实现类 - 商品属性
 */

@Repository("goodsAttributeDaoImpl")
public class GoodsAttributeDaoImpl extends BaseDaoImpl<GoodsAttribute, String> implements GoodsAttributeDao {
	
	@SuppressWarnings("unchecked")
	public Integer getUnusedPropertyIndex(GoodsType goodsType) {
		String hql = "from GoodsAttribute as goodsAttribute where goodsAttribute.goodsType = :goodsType";
		List<GoodsAttribute> goodsAttributeList = getSession().createQuery(hql).setParameter("goodsType", goodsType).list();
		if (goodsAttributeList != null && goodsAttributeList.size() >= Goods.GOODS_ATTRIBUTE_VALUE_PROPERTY_COUNT) {
			return null;
		}
		List<Integer> usedPropertyIndexList = new ArrayList<Integer>();
		for (GoodsAttribute goodsAttribute : goodsAttributeList) {
			usedPropertyIndexList.add(goodsAttribute.getPropertyIndex());
		}
		for (int i = 0; i < Goods.GOODS_ATTRIBUTE_VALUE_PROPERTY_COUNT; i ++) {
			if (!usedPropertyIndexList.contains(new Integer(i))) {
				return i;
			}
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public List<GoodsAttribute> getGoodsAttributeList(GoodsType goodsType) {
		String hql = "from GoodsAttribute as goodsAttribute where goodsAttribute.goodsType = :goodsType order by goodsAttribute.orderList asc";
		return getSession().createQuery(hql).setParameter("goodsType", goodsType).list();
	}
	
	public Pager getGoodsAttributePager(GoodsType goodsType, Pager pager) {
		return findPager(pager, Restrictions.eq("goodsType", goodsType));
	}
	
	// 删除的同时清除商品对应属性值
	@Override
	public void delete(GoodsAttribute goodsAttribute) {
		String propertyName = Goods.GOODS_ATTRIBUTE_VALUE_PROPERTY_NAME_PREFIX + goodsAttribute.getPropertyIndex();
		String hql = "update Goods set " + propertyName + " = :propertyName where goodsType = :goodsType";
		getSession().createQuery(hql).setParameter("propertyName", null).setParameter("goodsType", goodsAttribute.getGoodsType()).executeUpdate();
		super.delete(goodsAttribute);
	}

	// 删除的同时清除商品对应属性值
	@Override
	public void delete(String id) {
		GoodsAttribute goodsAttribute = load(id);
		this.delete(goodsAttribute);
	}

	// 删除的同时清除商品对应属性值
	@Override
	public void delete(String[] ids) {
		for (String id : ids) {
			this.delete(id);
		}
	}

}