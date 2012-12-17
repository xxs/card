package net.xxs.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import net.xxs.dao.AreaDao;
import net.xxs.entity.Area;
import net.xxs.service.AreaService;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Hibernate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springmodules.cache.annotations.CacheFlush;
import org.springmodules.cache.annotations.Cacheable;

/**
 * Service实现类 - 地区
 */

@Service("areaServiceImpl")
public class AreaServiceImpl extends BaseServiceImpl<Area, String> implements AreaService {
	
	@Resource(name = "areaDaoImpl")
	private AreaDao areaDao;

	@Resource(name = "areaDaoImpl")
	public void setBaseDao(AreaDao areaDao) {
		super.setBaseDao(areaDao);
	}
	
	@Cacheable(modelId = "areaCaching")
	@Transactional(readOnly = true)
	public List<Area> getAreaList(String id) {
		List<Area> areaList = new ArrayList<Area>();
		if (StringUtils.isNotEmpty(id)) {
			Area area = areaDao.load(id);
			Set<Area> children = area.getChildren();
			if (children != null) {
				areaList = new ArrayList<Area>(children);
			}
		} else {
			areaList = areaDao.getRootAreaList();
		}
		if (areaList != null) {
			for (Area area : areaList) {
				if (!Hibernate.isInitialized(area)) {
					Hibernate.initialize(area);
				}
			}
		}
		return areaList;
	}

	@Transactional(readOnly = true)
	public List<Area> getRootAreaList() {
		return areaDao.getRootAreaList();
	}
	
	@Transactional(readOnly = true)
	public List<Area> getParentAreaList(Area area) {
		return areaDao.getParentAreaList(area);
	}
	
	@Transactional(readOnly = true)
	public List<Area> getChildrenAreaList(Area area) {
		return areaDao.getChildrenAreaList(area);
	}

	@Override
	@CacheFlush(modelId = "areaFlushing")
	public void delete(Area area) {
		areaDao.delete(area);
	}

	@Override
	@CacheFlush(modelId = "areaFlushing")
	public void delete(String id) {
		areaDao.delete(id);
	}

	@Override
	@CacheFlush(modelId = "areaFlushing")
	public void delete(String[] ids) {
		areaDao.delete(ids);
	}

	@Override
	@CacheFlush(modelId = "areaFlushing")
	public String save(Area area) {
		return areaDao.save(area);
	}

	@Override
	@CacheFlush(modelId = "areaFlushing")
	public void update(Area area) {
		areaDao.update(area);
	}

}