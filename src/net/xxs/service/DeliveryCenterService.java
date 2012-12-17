package net.xxs.service;

import net.xxs.entity.DeliveryCenter;

/**
 * Service接口 - 发货点
 */

public interface DeliveryCenterService extends BaseService<DeliveryCenter, String> {
	
	/**
	 * 获取默认发货点,若无默认发货点,则获取最先添加的发货点
	 * 
	 */
	public DeliveryCenter getDefaultDeliveryCenter();

}