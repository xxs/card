package net.xxs.service.impl;

import javax.annotation.Resource;

import net.xxs.dao.DeliveryItemDao;
import net.xxs.entity.DeliveryItem;
import net.xxs.service.DeliveryItemService;

import org.springframework.stereotype.Service;

/**
 * Service实现类 - 发货项
 */

@Service("deliveryItemServiceImpl")
public class DeliveryItemServiceImpl extends BaseServiceImpl<DeliveryItem, String> implements DeliveryItemService {

	@Resource(name = "deliveryItemDaoImpl")
	public void setBaseDao(DeliveryItemDao deliveryItemDao) {
		super.setBaseDao(deliveryItemDao);
	}

}