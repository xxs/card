package net.xxs.service.impl;

import javax.annotation.Resource;

import net.xxs.dao.CartItemDao;
import net.xxs.entity.CartItem;
import net.xxs.service.CartItemService;

import org.springframework.stereotype.Service;

/**
 * Service实现类 - 购物车项
 */

@Service("cartItemServiceImpl")
public class CartItemServiceImpl extends BaseServiceImpl<CartItem, String> implements CartItemService {

	@Resource(name = "cartItemDaoImpl")
	public void setBaseDao(CartItemDao cartItemDao) {
		super.setBaseDao(cartItemDao);
	}

}