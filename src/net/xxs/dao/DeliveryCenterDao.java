package net.xxs.dao;

import net.xxs.entity.DeliveryCenter;

/**
 * Dao接口 - 发货点
 */

public interface DeliveryCenterDao extends BaseDao<DeliveryCenter, String> {
	
	/**
	 * 获取默认发货点,若无默认发货点,则获取最先添加的发货点
	 * 
	 */
	public DeliveryCenter getDefaultDeliveryCenter();

}