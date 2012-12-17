package net.xxs.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import net.xxs.dao.GoodsCategoryDao;
import net.xxs.entity.Goods;
import net.xxs.entity.GoodsCategory;
import net.xxs.service.GoodsCategoryService;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Hibernate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springmodules.cache.annotations.CacheFlush;
import org.springmodules.cache.annotations.Cacheable;

/**
 * Service实现类 - 商品分类
 */

@Service("goodsCategoryServiceImpl")
public class GoodsCategoryServiceImpl extends BaseServiceImpl<GoodsCategory, String> implements GoodsCategoryService {

	@Resource(name = "goodsCategoryDaoImpl")
	private GoodsCategoryDao goodsCategoryDao;
	
	@Resource(name = "goodsCategoryDaoImpl")
	public void setBaseDao(GoodsCategoryDao goodsCategoryDao) {
		super.setBaseDao(goodsCategoryDao);
	}
	
	@Transactional(readOnly = true)
	public boolean isExistBySign(String sign) {
		return goodsCategoryDao.isExistBySign(sign);
	}
	
	@Transactional(readOnly = true)
	public boolean isUniqueBySign(String oldSign, String newSign) {
		if (StringUtils.equalsIgnoreCase(oldSign, newSign)) {
			return true;
		} else {
			if (goodsCategoryDao.isExistBySign(newSign)) {
				return false;
			} else {
				return true;
			}
		}
	}
	
	@Transactional(readOnly = true)
	public GoodsCategory getGoodsCategoryBySign(String sign) {
		return goodsCategoryDao.getGoodsCategoryBySign(sign);
	}
	
	@Cacheable(modelId = "goodsCategoryCaching")
	@Transactional(readOnly = true)
	public List<GoodsCategory> getGoodsCategoryTree() {
		return goodsCategoryDao.getGoodsCategoryTree();
	}
	
	@Cacheable(modelId = "goodsCategoryCaching")
	public List<GoodsCategory> getGoodsCategoryTreeList() {
		List<GoodsCategory> allGoodsCategoryList = this.getAllList();
		return recursivGoodsCategoryTreeList(allGoodsCategoryList, null, null);
	}
	
	// 递归父类排序分类树
	private List<GoodsCategory> recursivGoodsCategoryTreeList(List<GoodsCategory> allGoodsCategoryList, GoodsCategory p, List<GoodsCategory> temp) {
		if (temp == null) {
			temp = new ArrayList<GoodsCategory>();
		}
		for (GoodsCategory goodsCategory : allGoodsCategoryList) {
			GoodsCategory parent = goodsCategory.getParent();
			if ((p == null && parent == null) || (goodsCategory != null && parent == p)) {
				temp.add(goodsCategory);
				if (goodsCategory.getChildren() != null && goodsCategory.getChildren().size() > 0) {
					recursivGoodsCategoryTreeList(allGoodsCategoryList, goodsCategory, temp);
				}
			}
		}
		return temp;
	}
	
	@Cacheable(modelId = "goodsCategoryCaching")
	@Transactional(readOnly = true)
	public List<GoodsCategory> getRootGoodsCategoryList(Integer maxResults) {
		List<GoodsCategory> rootGoodsCategoryList = goodsCategoryDao.getRootGoodsCategoryList(maxResults);
		if (rootGoodsCategoryList != null) {
			for (GoodsCategory rootGoodsCategory : rootGoodsCategoryList) {
				if (!Hibernate.isInitialized(rootGoodsCategory)) {
					Hibernate.initialize(rootGoodsCategory);
				}
			}
		}
		return rootGoodsCategoryList;
	}
	
	@Cacheable(modelId = "goodsCategoryCaching")
	@Transactional(readOnly = true)
	public List<GoodsCategory> getParentGoodsCategoryList(GoodsCategory goodsCategory, boolean isContainParent, Integer maxResults) {
		List<GoodsCategory> parentGoodsCategoryList = goodsCategoryDao.getParentGoodsCategoryList(goodsCategory, isContainParent, maxResults);
		if (parentGoodsCategoryList != null) {
			for (GoodsCategory parentGoodsCategory : parentGoodsCategoryList) {
				if (!Hibernate.isInitialized(parentGoodsCategory)) {
					Hibernate.initialize(parentGoodsCategory);
				}
			}
		}
		return parentGoodsCategoryList;
	}
	
	public List<GoodsCategory> getParentGoodsCategoryList(Goods goods, boolean isContainParent, Integer maxResults) {
		GoodsCategory goodsCategory = goods.getGoodsCategory();
		List<GoodsCategory> parentGoodsCategoryList = new ArrayList<GoodsCategory>();
		List<GoodsCategory> goodsCategoryList = this.getParentGoodsCategoryList(goodsCategory, isContainParent, maxResults);
		if (goodsCategoryList != null) {
			parentGoodsCategoryList.addAll(goodsCategoryList);
		}
		parentGoodsCategoryList.add(goodsCategory);
		return parentGoodsCategoryList;
	}
	
	@Cacheable(modelId = "goodsCategoryCaching")
	@Transactional(readOnly = true)
	public List<GoodsCategory> getChildrenGoodsCategoryList(GoodsCategory goodsCategory, boolean isContainChildren, Integer maxResults) {
		List<GoodsCategory> childrenGoodsCategoryList = goodsCategoryDao.getChildrenGoodsCategoryList(goodsCategory, isContainChildren, maxResults);
		if (childrenGoodsCategoryList != null) {
			for (GoodsCategory childrenGoodsCategory : childrenGoodsCategoryList) {
				if (!Hibernate.isInitialized(childrenGoodsCategory)) {
					Hibernate.initialize(childrenGoodsCategory);
				}
			}
		}
		return childrenGoodsCategoryList;
	}
	
	@Cacheable(modelId = "goodsCategoryCaching")
	public List<GoodsCategory> getGoodsCategoryPathList(GoodsCategory goodsCategory) {
		List<GoodsCategory> goodsCategoryPathList = new ArrayList<GoodsCategory>();
		List<GoodsCategory> parentGoodsCategoryList = this.getParentGoodsCategoryList(goodsCategory, true, null);
		if (parentGoodsCategoryList != null) {
			goodsCategoryPathList.addAll(parentGoodsCategoryList);
		}
		goodsCategoryPathList.add(goodsCategory);
		return goodsCategoryPathList;
	}

	@Override
	@CacheFlush(modelId = "goodsCategoryFlushing")
	public void delete(GoodsCategory goodsCategory) {
		goodsCategoryDao.delete(goodsCategory);
	}

	@Override
	@CacheFlush(modelId = "goodsCategoryFlushing")
	public void delete(String id) {
		goodsCategoryDao.delete(id);
	}

	@Override
	@CacheFlush(modelId = "goodsCategoryFlushing")
	public void delete(String[] ids) {
		goodsCategoryDao.delete(ids);
	}

	@Override
	@CacheFlush(modelId = "goodsCategoryFlushing")
	public String save(GoodsCategory goodsCategory) {
		return goodsCategoryDao.save(goodsCategory);
	}

	@Override
	@CacheFlush(modelId = "goodsCategoryFlushing")
	public void update(GoodsCategory goodsCategory) {
		goodsCategoryDao.update(goodsCategory);
	}

}