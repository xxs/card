package net.xxs.service.impl;

import javax.annotation.Resource;

import net.xxs.dao.OrderItemDao;
import net.xxs.entity.OrderItem;
import net.xxs.service.OrderItemService;

import org.springframework.stereotype.Service;

/**
 * Service实现类 - 订单项
 */

@Service("orderItemServiceImpl")
public class OrderItemServiceImpl extends BaseServiceImpl<OrderItem, String> implements OrderItemService {

	@Resource(name = "orderItemDaoImpl")
	public void setBaseDao(OrderItemDao orderItemDao) {
		super.setBaseDao(orderItemDao);
	}

}