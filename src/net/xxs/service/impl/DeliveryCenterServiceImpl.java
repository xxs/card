package net.xxs.service.impl;

import javax.annotation.Resource;

import net.xxs.dao.DeliveryCenterDao;
import net.xxs.entity.DeliveryCenter;
import net.xxs.service.DeliveryCenterService;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Service实现类 - 发货点
 */

@Service("deliveryCenterServiceImpl")
public class DeliveryCenterServiceImpl extends BaseServiceImpl<DeliveryCenter, String> implements DeliveryCenterService {
	
	@Resource(name = "deliveryCenterDaoImpl")
	private DeliveryCenterDao deliveryCenterDao;
	
	@Resource(name = "deliveryCenterDaoImpl")
	public void setBaseDao(DeliveryCenterDao deliveryCenterDao) {
		super.setBaseDao(deliveryCenterDao);
	}
	
	@Transactional(readOnly = true)
	public DeliveryCenter getDefaultDeliveryCenter() {
		return deliveryCenterDao.getDefaultDeliveryCenter();
	}

}