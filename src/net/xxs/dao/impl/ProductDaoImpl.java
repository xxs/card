package net.xxs.dao.impl;

import java.util.List;
import java.util.Set;

import net.xxs.dao.ProductDao;
import net.xxs.entity.DeliveryItem;
import net.xxs.entity.OrderItem;
import net.xxs.entity.Product;
import net.xxs.util.SettingUtil;

import org.springframework.stereotype.Repository;

/**
 * Dao实现类 - 货品
 */

@Repository("productDaoImpl")
public class ProductDaoImpl extends BaseDaoImpl<Product, String> implements ProductDao {
	
	public boolean isExistByProductSn(String productSn) {
		String hql = "from Product as product where lower(product.productSn) = lower(:productSn)";
		Product product = (Product) getSession().createQuery(hql).setParameter("productSn", productSn).uniqueResult();
		if (product != null) {
			return true;
		} else {
			return false;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Product> getSiblingsProductList(String productId) {
		Product product = super.load(productId);
		String hql = "from Product as product where product.goods = :goods";
		return getSession().createQuery(hql).setParameter("goods", product.getGoods()).list();
	}
	
	public Long getStoreAlertCount() {
		String hql = "select count(*) from Product as product where product.isMarketable = :isMarketable and product.store is not null and product.store - product.freezeStore <= :freezeStore";
		return (Long) getSession().createQuery(hql).setParameter("isMarketable", true).setParameter("freezeStore", SettingUtil.getSetting().getStoreAlertCount()).uniqueResult();
	}

	// 关联处理
	@Override
	public void delete(Product product) {
		Set<OrderItem> orderItemSet = product.getOrderItemSet();
		if (orderItemSet != null) {
			for (OrderItem orderItem : orderItemSet) {
				orderItem.setProduct(null);
			}
		}
		
		Set<DeliveryItem> deliveryItemSet = product.getDeliveryItemSet();
		if (deliveryItemSet != null) {
			for (DeliveryItem deliveryItem : deliveryItemSet) {
				deliveryItem.setProduct(null);
			}
		}
		
		super.delete(product);
	}

	// 关联处理
	@Override
	public void delete(String id) {
		Product product = load(id);
		this.delete(product);
	}

	// 关联处理
	@Override
	public void delete(String[] ids) {
		for (String id : ids) {
			Product product = load(id);
			this.delete(product);
		}
	}

}