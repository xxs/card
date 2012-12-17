package net.xxs.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import net.xxs.dao.CardsCategoryDao;
import net.xxs.entity.Cards;
import net.xxs.entity.CardsCategory;
import net.xxs.service.CardsCategoryService;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Hibernate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springmodules.cache.annotations.CacheFlush;
import org.springmodules.cache.annotations.Cacheable;

/**
 * Service实现类 - 充值卡分类
 */

@Service("cardsCategoryServiceImpl")
public class CardsCategoryServiceImpl extends BaseServiceImpl<CardsCategory, String> implements CardsCategoryService {

	@Resource(name = "cardsCategoryDaoImpl")
	private CardsCategoryDao cardsCategoryDao;
	
	@Resource(name = "cardsCategoryDaoImpl")
	public void setBaseDao(CardsCategoryDao cardsCategoryDao) {
		super.setBaseDao(cardsCategoryDao);
	}
	
	@Transactional(readOnly = true)
	public boolean isExistBySign(String sign) {
		return cardsCategoryDao.isExistBySign(sign);
	}
	
	@Transactional(readOnly = true)
	public boolean isUniqueBySign(String oldSign, String newSign) {
		if (StringUtils.equalsIgnoreCase(oldSign, newSign)) {
			return true;
		} else {
			if (cardsCategoryDao.isExistBySign(newSign)) {
				return false;
			} else {
				return true;
			}
		}
	}
	
	@Transactional(readOnly = true)
	public CardsCategory getCardsCategoryBySign(String sign) {
		return cardsCategoryDao.getCardsCategoryBySign(sign);
	}
	
	@Cacheable(modelId = "cardsCategoryCaching")
	@Transactional(readOnly = true)
	public List<CardsCategory> getCardsCategoryTree() {
		return cardsCategoryDao.getCardsCategoryTree();
	}
	
	@Cacheable(modelId = "cardsCategoryCaching")
	public List<CardsCategory> getCardsCategoryTreeList() {
		List<CardsCategory> allCardsCategoryList = this.getAllList();
		return recursivCardsCategoryTreeList(allCardsCategoryList, null, null);
	}
	
	// 递归父类排序分类树
	private List<CardsCategory> recursivCardsCategoryTreeList(List<CardsCategory> allCardsCategoryList, CardsCategory p, List<CardsCategory> temp) {
		if (temp == null) {
			temp = new ArrayList<CardsCategory>();
		}
		for (CardsCategory cardsCategory : allCardsCategoryList) {
			CardsCategory parent = cardsCategory.getParent();
			if ((p == null && parent == null) || (cardsCategory != null && parent == p)) {
				temp.add(cardsCategory);
				if (cardsCategory.getChildren() != null && cardsCategory.getChildren().size() > 0) {
					recursivCardsCategoryTreeList(allCardsCategoryList, cardsCategory, temp);
				}
			}
		}
		return temp;
	}
	
	@Cacheable(modelId = "cardsCategoryCaching")
	@Transactional(readOnly = true)
	public List<CardsCategory> getRootCardsCategoryList(Integer maxResults) {
		List<CardsCategory> rootCardsCategoryList = cardsCategoryDao.getRootCardsCategoryList(maxResults);
		if (rootCardsCategoryList != null) {
			for (CardsCategory rootCardsCategory : rootCardsCategoryList) {
				if (!Hibernate.isInitialized(rootCardsCategory)) {
					Hibernate.initialize(rootCardsCategory);
				}
			}
		}
		return rootCardsCategoryList;
	}
	
	@Cacheable(modelId = "cardsCategoryCaching")
	@Transactional(readOnly = true)
	public List<CardsCategory> getParentCardsCategoryList(CardsCategory cardsCategory, boolean isContainParent, Integer maxResults) {
		List<CardsCategory> parentCardsCategoryList = cardsCategoryDao.getParentCardsCategoryList(cardsCategory, isContainParent, maxResults);
		if (parentCardsCategoryList != null) {
			for (CardsCategory parentCardsCategory : parentCardsCategoryList) {
				if (!Hibernate.isInitialized(parentCardsCategory)) {
					Hibernate.initialize(parentCardsCategory);
				}
			}
		}
		return parentCardsCategoryList;
	}
	
	public List<CardsCategory> getParentCardsCategoryList(Cards cards, boolean isContainParent, Integer maxResults) {
		CardsCategory cardsCategory = cards.getCardsCategory();
		List<CardsCategory> parentCardsCategoryList = new ArrayList<CardsCategory>();
		List<CardsCategory> cardsCategoryList = this.getParentCardsCategoryList(cardsCategory, isContainParent, maxResults);
		if (cardsCategoryList != null) {
			parentCardsCategoryList.addAll(cardsCategoryList);
		}
		parentCardsCategoryList.add(cardsCategory);
		return parentCardsCategoryList;
	}
	
	@Cacheable(modelId = "cardsCategoryCaching")
	@Transactional(readOnly = true)
	public List<CardsCategory> getChildrenCardsCategoryList(CardsCategory cardsCategory, boolean isContainChildren, Integer maxResults) {
		List<CardsCategory> childrenCardsCategoryList = cardsCategoryDao.getChildrenCardsCategoryList(cardsCategory, isContainChildren, maxResults);
		if (childrenCardsCategoryList != null) {
			for (CardsCategory childrenCardsCategory : childrenCardsCategoryList) {
				if (!Hibernate.isInitialized(childrenCardsCategory)) {
					Hibernate.initialize(childrenCardsCategory);
				}
			}
		}
		return childrenCardsCategoryList;
	}
	
	@Cacheable(modelId = "cardsCategoryCaching")
	public List<CardsCategory> getCardsCategoryPathList(CardsCategory cardsCategory) {
		List<CardsCategory> cardsCategoryPathList = new ArrayList<CardsCategory>();
		List<CardsCategory> parentCardsCategoryList = this.getParentCardsCategoryList(cardsCategory, true, null);
		if (parentCardsCategoryList != null) {
			cardsCategoryPathList.addAll(parentCardsCategoryList);
		}
		cardsCategoryPathList.add(cardsCategory);
		return cardsCategoryPathList;
	}

	@Override
	@CacheFlush(modelId = "cardsCategoryFlushing")
	public void delete(CardsCategory cardsCategory) {
		cardsCategoryDao.delete(cardsCategory);
	}

	@Override
	@CacheFlush(modelId = "cardsCategoryFlushing")
	public void delete(String id) {
		cardsCategoryDao.delete(id);
	}

	@Override
	@CacheFlush(modelId = "cardsCategoryFlushing")
	public void delete(String[] ids) {
		cardsCategoryDao.delete(ids);
	}

	@Override
	@CacheFlush(modelId = "cardsCategoryFlushing")
	public String save(CardsCategory cardsCategory) {
		return cardsCategoryDao.save(cardsCategory);
	}

	@Override
	@CacheFlush(modelId = "cardsCategoryFlushing")
	public void update(CardsCategory cardsCategory) {
		cardsCategoryDao.update(cardsCategory);
	}

}