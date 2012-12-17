package net.xxs.service.impl;

import java.util.List;

import javax.annotation.Resource;

import net.xxs.dao.DeliveryTypeDao;
import net.xxs.entity.DeliveryType;
import net.xxs.service.DeliveryTypeService;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springmodules.cache.annotations.CacheFlush;
import org.springmodules.cache.annotations.Cacheable;

/**
 * Service实现类 - 配送方式
 */

@Service("deliveryTypeServiceImpl")
public class DeliveryTypeServiceImpl extends BaseServiceImpl<DeliveryType, String> implements DeliveryTypeService {

	@Resource(name = "deliveryTypeDaoImpl")
	DeliveryTypeDao deliveryTypeDao;
	
	@Resource(name = "deliveryTypeDaoImpl")
	public void setBaseDao(DeliveryTypeDao deliveryTypeDao) {
		super.setBaseDao(deliveryTypeDao);
	}
	
	@Override
	@Cacheable(modelId = "deliveryTypeCaching")
	@Transactional(readOnly = true)
	public List<DeliveryType> getAllList() {
		return deliveryTypeDao.getAllList();
	}

	@Override
	@CacheFlush(modelId = "deliveryTypeFlushing")
	public void delete(DeliveryType deliveryType) {
		deliveryTypeDao.delete(deliveryType);
	}

	@Override
	@CacheFlush(modelId = "deliveryTypeFlushing")
	public void delete(String id) {
		deliveryTypeDao.delete(id);
	}

	@Override
	@CacheFlush(modelId = "deliveryTypeFlushing")
	public void delete(String[] ids) {
		deliveryTypeDao.delete(ids);
	}

	@Override
	@CacheFlush(modelId = "deliveryTypeFlushing")
	public String save(DeliveryType deliveryType) {
		return deliveryTypeDao.save(deliveryType);
	}

	@Override
	@CacheFlush(modelId = "deliveryTypeFlushing")
	public void update(DeliveryType deliveryType) {
		deliveryTypeDao.update(deliveryType);
	}

}