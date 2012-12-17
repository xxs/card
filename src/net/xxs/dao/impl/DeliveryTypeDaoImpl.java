package net.xxs.dao.impl;

import java.util.Set;

import net.xxs.dao.DeliveryTypeDao;
import net.xxs.entity.DeliveryType;
import net.xxs.entity.Order;
import net.xxs.entity.Reship;
import net.xxs.entity.Shipping;

import org.springframework.stereotype.Repository;

/**
 * Dao实现类 - 配送方式
 */

@Repository("deliveryTypeDaoImpl")
public class DeliveryTypeDaoImpl extends BaseDaoImpl<DeliveryType, String> implements DeliveryTypeDao {

	public DeliveryType getDefaultDeliveryType() {
		String hql = "from DeliveryType as deliveryType where deliveryType.isDefault = :isDefault";
		return (DeliveryType) getSession().createQuery(hql).setParameter("isDefault", true).setMaxResults(1).uniqueResult();
	}
	
	// 关联处理
	@Override
	public void delete(DeliveryType deliveryType) {
		Set<Order> orderSet = deliveryType.getOrderSet();
		if (orderSet != null) {
			for (Order order : orderSet) {
				order.setDeliveryType(null);
			}
		}
		
		Set<Shipping> shippingSet = deliveryType.getShippingSet();
		if (shippingSet != null) {
			for (Shipping shipping : shippingSet) {
				shipping.setDeliveryType(null);
			}
		}
		
		Set<Reship> reshipSet = deliveryType.getReshipSet();
		if (reshipSet != null) {
			for (Reship reship : reshipSet) {
				reship.setDeliveryType(null);
			}
		}
		
		super.delete(deliveryType);
	}

	// 关联处理
	@Override
	public void delete(String id) {
		DeliveryType deliveryType = super.load(id);
		this.delete(deliveryType);
	}

	// 关联处理
	@Override
	public void delete(String[] ids) {
		for (String id : ids) {
			DeliveryType deliveryType = super.load(id);
			this.delete(deliveryType);
		}
	}

}