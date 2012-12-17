package net.xxs.service.impl;

import javax.annotation.Resource;

import net.xxs.dao.DeliveryTemplateDao;
import net.xxs.entity.DeliveryTemplate;
import net.xxs.service.DeliveryTemplateService;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Service实现类 - 快递单模板
 */

@Service("deliveryTemplateServiceImpl")
public class DeliveryTemplateServiceImpl extends BaseServiceImpl<DeliveryTemplate, String> implements DeliveryTemplateService {
	
	@Resource(name = "deliveryTemplateDaoImpl")
	private DeliveryTemplateDao deliveryTemplateDao;
	
	@Resource(name = "deliveryTemplateDaoImpl")
	public void setBaseDao(DeliveryTemplateDao deliveryTemplateDao) {
		super.setBaseDao(deliveryTemplateDao);
	}
	
	@Transactional(readOnly = true)
	public DeliveryTemplate getDefaultDeliveryTemplate() {
		return deliveryTemplateDao.getDefaultDeliveryTemplate();
	}

}