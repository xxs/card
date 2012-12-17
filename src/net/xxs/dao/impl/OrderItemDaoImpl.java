package net.xxs.dao.impl;

import net.xxs.dao.OrderItemDao;
import net.xxs.entity.OrderItem;

import org.springframework.stereotype.Repository;

/**
 * Dao实现类 - 订单项
 */

@Repository("orderItemDaoImpl")
public class OrderItemDaoImpl extends BaseDaoImpl<OrderItem, String> implements OrderItemDao {

}