package net.xxs.dao.impl;

import net.xxs.dao.DeliveryItemDao;
import net.xxs.entity.DeliveryItem;

import org.springframework.stereotype.Repository;

/**
 * Dao实现类 - 发货项
 */

@Repository("deliveryItemDaoImpl")
public class DeliveryItemDaoImpl extends BaseDaoImpl<DeliveryItem, String> implements DeliveryItemDao {

}