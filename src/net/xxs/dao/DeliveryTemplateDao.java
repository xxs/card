package net.xxs.dao;

import net.xxs.entity.DeliveryTemplate;

/**
 * Dao接口 - 快递单模板
 */

public interface DeliveryTemplateDao extends BaseDao<DeliveryTemplate, String> {
	
	/**
	 * 获取默认快递单模板,若无默认快递单模板,则获取最先添加的快递单模板
	 * 
	 */
	public DeliveryTemplate getDefaultDeliveryTemplate();

}