package net.xxs.service.impl;

import java.util.List;

import javax.annotation.Resource;

import net.xxs.bean.Pager;
import net.xxs.dao.CardsAttributeDao;
import net.xxs.entity.CardsAttribute;
import net.xxs.entity.CardsType;
import net.xxs.service.CardsAttributeService;

import org.hibernate.Hibernate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springmodules.cache.annotations.CacheFlush;
import org.springmodules.cache.annotations.Cacheable;

/**
 * Service实现类 - 商品属性
 */

@Service("cardsAttributeServiceImpl")
public class CardsAttributeServiceImpl extends BaseServiceImpl<CardsAttribute, String> implements CardsAttributeService {

	@Resource(name = "cardsAttributeDaoImpl")
	private CardsAttributeDao cardsAttributeDao;
	
	@Resource(name = "cardsAttributeDaoImpl")
	public void setBaseDao(CardsAttributeDao cardsAttributeDao) {
		super.setBaseDao(cardsAttributeDao);
	}
	
	@Transactional(readOnly = true)
	public Integer getUnusedPropertyIndex(CardsType cardsType) {
		return cardsAttributeDao.getUnusedPropertyIndex(cardsType);
	}
	
	@Cacheable(modelId = "cardsAttributeCaching")
	@Transactional(readOnly = true)
	public List<CardsAttribute> getCardsAttributeList(CardsType cardsType) {
		List<CardsAttribute> cardsAttributeList = cardsAttributeDao.getCardsAttributeList(cardsType);
		if (cardsAttributeList != null) {
			for (CardsAttribute cardsAttribute : cardsAttributeList) {
				Hibernate.initialize(cardsAttribute);
			}
		}
		return cardsAttributeList;
	}
	
	@Transactional(readOnly = true)
	public Pager getCardsAttributePager(CardsType cardsType, Pager pager) {
		return cardsAttributeDao.getCardsAttributePager(cardsType, pager);
	}

	@Override
	@CacheFlush(modelId = "cardsAttributeFlushing")
	public void delete(CardsAttribute cardsAttribute) {
		cardsAttributeDao.delete(cardsAttribute);
	}

	@Override
	@CacheFlush(modelId = "cardsAttributeFlushing")
	public void delete(String id) {
		cardsAttributeDao.delete(id);
	}

	@Override
	@CacheFlush(modelId = "cardsAttributeFlushing")
	public void delete(String[] ids) {
		cardsAttributeDao.delete(ids);
	}

	@Override
	@CacheFlush(modelId = "cardsAttributeFlushing")
	public String save(CardsAttribute cardsAttribute) {
		return cardsAttributeDao.save(cardsAttribute);
	}

	@Override
	@CacheFlush(modelId = "cardsAttributeFlushing")
	public void update(CardsAttribute cardsAttribute) {
		cardsAttributeDao.update(cardsAttribute);
	}

}