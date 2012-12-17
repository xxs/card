package net.xxs.service.impl;

import javax.annotation.Resource;

import net.xxs.dao.DeliveryCorpDao;
import net.xxs.entity.DeliveryCorp;
import net.xxs.service.DeliveryCorpService;

import org.springframework.stereotype.Service;

/**
 * Service实现类 - 物流公司
 */

@Service("deliveryCorpServiceImpl")
public class DeliveryCorpServiceImpl extends BaseServiceImpl<DeliveryCorp, String> implements DeliveryCorpService {

	@Resource(name = "deliveryCorpDaoImpl")
	public void setBaseDao(DeliveryCorpDao deliveryCorpDao) {
		super.setBaseDao(deliveryCorpDao);
	}

}