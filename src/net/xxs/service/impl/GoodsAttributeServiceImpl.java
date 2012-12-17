package net.xxs.service.impl;

import java.util.List;

import javax.annotation.Resource;

import net.xxs.bean.Pager;
import net.xxs.dao.GoodsAttributeDao;
import net.xxs.entity.GoodsAttribute;
import net.xxs.entity.GoodsType;
import net.xxs.service.GoodsAttributeService;

import org.hibernate.Hibernate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springmodules.cache.annotations.CacheFlush;
import org.springmodules.cache.annotations.Cacheable;

/**
 * Service实现类 - 商品属性
 */

@Service("goodsAttributeServiceImpl")
public class GoodsAttributeServiceImpl extends BaseServiceImpl<GoodsAttribute, String> implements GoodsAttributeService {

	@Resource(name = "goodsAttributeDaoImpl")
	private GoodsAttributeDao goodsAttributeDao;
	
	@Resource(name = "goodsAttributeDaoImpl")
	public void setBaseDao(GoodsAttributeDao goodsAttributeDao) {
		super.setBaseDao(goodsAttributeDao);
	}
	
	@Transactional(readOnly = true)
	public Integer getUnusedPropertyIndex(GoodsType goodsType) {
		return goodsAttributeDao.getUnusedPropertyIndex(goodsType);
	}
	
	@Cacheable(modelId = "goodsAttributeCaching")
	@Transactional(readOnly = true)
	public List<GoodsAttribute> getGoodsAttributeList(GoodsType goodsType) {
		List<GoodsAttribute> goodsAttributeList = goodsAttributeDao.getGoodsAttributeList(goodsType);
		if (goodsAttributeList != null) {
			for (GoodsAttribute goodsAttribute : goodsAttributeList) {
				Hibernate.initialize(goodsAttribute);
			}
		}
		return goodsAttributeList;
	}
	
	@Transactional(readOnly = true)
	public Pager getGoodsAttributePager(GoodsType goodsType, Pager pager) {
		return goodsAttributeDao.getGoodsAttributePager(goodsType, pager);
	}

	@Override
	@CacheFlush(modelId = "goodsAttributeFlushing")
	public void delete(GoodsAttribute goodsAttribute) {
		goodsAttributeDao.delete(goodsAttribute);
	}

	@Override
	@CacheFlush(modelId = "goodsAttributeFlushing")
	public void delete(String id) {
		goodsAttributeDao.delete(id);
	}

	@Override
	@CacheFlush(modelId = "goodsAttributeFlushing")
	public void delete(String[] ids) {
		goodsAttributeDao.delete(ids);
	}

	@Override
	@CacheFlush(modelId = "goodsAttributeFlushing")
	public String save(GoodsAttribute goodsAttribute) {
		return goodsAttributeDao.save(goodsAttribute);
	}

	@Override
	@CacheFlush(modelId = "goodsAttributeFlushing")
	public void update(GoodsAttribute goodsAttribute) {
		goodsAttributeDao.update(goodsAttribute);
	}

}