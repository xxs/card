package net.xxs.dao.impl;

import net.xxs.dao.CartItemDao;
import net.xxs.entity.CartItem;

import org.springframework.stereotype.Repository;

/**
 * Dao实现类 - 购物车项
 */

@Repository("cartItemDaoImpl")
public class CartItemDaoImpl extends BaseDaoImpl<CartItem, String> implements CartItemDao {

	// 若保存对象的member、product属性值相同,则只更新已有对象的quantity属性值
	@Override
	public String save(CartItem cartItem) {
		String hql = "from CartItem as cartItem where cartItem.member = :member and cartItem.product = :product";
		CartItem persistent = (CartItem) getSession().createQuery(hql).setParameter("member", cartItem.getMember()).setParameter("product", cartItem.getProduct()).uniqueResult();
		if (persistent == null) {
			return super.save(cartItem);
		} else {
			persistent.setQuantity(persistent.getQuantity() + cartItem.getQuantity());
			super.update(persistent);
			return persistent.getId();
		}
	}

}