package net.xxs.service.impl;

import javax.annotation.Resource;

import net.xxs.dao.ShippingDao;
import net.xxs.entity.Shipping;
import net.xxs.service.ShippingService;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Service实现类 - 发货
 */

@Service("shippingServiceImpl")
public class ShippingServiceImpl extends BaseServiceImpl<Shipping, String> implements ShippingService {
	
	@Resource(name = "shippingDaoImpl")
	private ShippingDao shippingDao;

	@Resource(name = "shippingDaoImpl")
	public void setBaseDao(ShippingDao shippingDao) {
		super.setBaseDao(shippingDao);
	}
	
	@Transactional(readOnly = true)
	public String getLastShippingSn() {
		return shippingDao.getLastShippingSn();
	}

}