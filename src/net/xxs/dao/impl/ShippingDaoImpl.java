package net.xxs.dao.impl;

import java.util.List;

import net.xxs.dao.ShippingDao;
import net.xxs.entity.Shipping;

import org.springframework.stereotype.Repository;

/**
 * Dao实现类 - 发货
 */

@Repository("shippingDaoImpl")
public class ShippingDaoImpl extends BaseDaoImpl<Shipping, String> implements ShippingDao {
	
	@SuppressWarnings("unchecked")
	public String getLastShippingSn() {
		String hql = "from Shipping as shipping order by shipping.createDate desc";
		List<Shipping> shippingList =  getSession().createQuery(hql).setFirstResult(0).setMaxResults(1).list();
		if (shippingList != null && shippingList.size() > 0) {
			return shippingList.get(0).getShippingSn();
		} else {
			return null;
		}
	}

}