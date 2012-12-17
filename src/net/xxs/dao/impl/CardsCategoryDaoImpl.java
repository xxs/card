package net.xxs.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import net.xxs.dao.CardsCategoryDao;
import net.xxs.entity.CardsCategory;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

/**
 * Dao实现类 - 商品分类
 */

@Repository("cardsCategoryDaoImpl")
public class CardsCategoryDaoImpl extends BaseDaoImpl<CardsCategory, String> implements CardsCategoryDao {
	
	public boolean isExistBySign(String sign) {
		String hql = "from CardsCategory as cardsCategory where lower(cardsCategory.sign) = lower(:sign)";
		CardsCategory cardsCategory = (CardsCategory) getSession().createQuery(hql).setParameter("sign", sign).uniqueResult();
		if (cardsCategory != null) {
			return true;
		} else {
			return false;
		}
	}
	
	public CardsCategory getCardsCategoryBySign(String sign) {
		String hql = "from CardsCategory as cardsCategory where lower(cardsCategory.sign) = lower(:sign)";
		CardsCategory cardsCategory = (CardsCategory) getSession().createQuery(hql).setParameter("sign", sign).uniqueResult();
		return cardsCategory;
	}
	
	@SuppressWarnings("unchecked")
	public List<CardsCategory> getCardsCategoryTree() {
		String hql = "from CardsCategory as cardsCategory where cardsCategory.parent is null order by cardsCategory.orderList asc";
		List<CardsCategory> cardsCategoryTreeList = getSession().createQuery(hql).list();
		initializeCardsCategoryList(cardsCategoryTreeList);
		return cardsCategoryTreeList;
	}
	
	// 递归实例化商品分类对象
	private void initializeCardsCategoryList(List<CardsCategory> cardsCategoryList) {
		for (CardsCategory cardsCategory : cardsCategoryList) {
			Set<CardsCategory> children = cardsCategory.getChildren();
			if (children != null && children.size() > 0) {
				if (!Hibernate.isInitialized(children)) {
					Hibernate.initialize(children);
				}
				initializeCardsCategoryList(new ArrayList<CardsCategory>(children));
			}
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<CardsCategory> getRootCardsCategoryList(Integer maxResults) {
		String hql = "from CardsCategory as cardsCategory where cardsCategory.parent is null order by cardsCategory.orderList asc";
		Query query = getSession().createQuery(hql);
		if (maxResults != null) {
			query.setMaxResults(maxResults);
		}
		return query.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<CardsCategory> getParentCardsCategoryList(CardsCategory cardsCategory, boolean isContainParent, Integer maxResults) {
		Query query = null;
		if (cardsCategory != null) {
			if (isContainParent) {
				if (cardsCategory.getParent() == null) {
					return null;
				}
				String parentPath = StringUtils.substringBeforeLast(cardsCategory.getPath(), CardsCategory.PATH_SEPARATOR);
				String[] ids = parentPath.split(CardsCategory.PATH_SEPARATOR);
				String hql = "from CardsCategory as cardsCategory where cardsCategory.id in(:ids) order by cardsCategory.grade asc, cardsCategory.orderList asc";
				query = getSession().createQuery(hql);
				query.setParameterList("ids", ids);
			} else {
				List<CardsCategory> parentCardsCategoryList = null;
				CardsCategory parent = cardsCategory.getParent();
				if (maxResults > 0 && parent != null) {
					parentCardsCategoryList = new ArrayList<CardsCategory>();
					parentCardsCategoryList.add(parent);
				}
				return parentCardsCategoryList;
			}
		} else {
			String hql = "from CardsCategory as cardsCategory order by cardsCategory.grade asc, cardsCategory.orderList asc";
			query = getSession().createQuery(hql);
		}
		if (maxResults != null) {
			query.setMaxResults(maxResults);
		}
		return query.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<CardsCategory> getChildrenCardsCategoryList(CardsCategory cardsCategory, boolean isContainChildren, Integer maxResults) {
		Query query = null;
		if (cardsCategory != null) {
			if (isContainChildren) {
				String hql = "from CardsCategory as cardsCategory where cardsCategory.path like :path order by cardsCategory.grade asc, cardsCategory.orderList asc";
				query = getSession().createQuery(hql);
				query.setParameter("path", cardsCategory.getPath() + CardsCategory.PATH_SEPARATOR + "%");
			} else {
				String hql = "from CardsCategory as cardsCategory where cardsCategory.parent = :cardsCategory order by cardsCategory.grade asc, cardsCategory.orderList asc";
				query = getSession().createQuery(hql);
				query.setParameter("cardsCategory", cardsCategory);
			}
		} else {
			String hql = "from CardsCategory as cardsCategory order by cardsCategory.grade asc, cardsCategory.orderList asc";
			query = getSession().createQuery(hql);
		}
		if (maxResults != null) {
			query.setMaxResults(maxResults);
		}
		return query.list();
	}
	
	// 自动设置path、grade
	@Override
	public String save(CardsCategory cardsCategory) {
		cardsCategory.setPath(cardsCategory.getName());
		cardsCategory.setGrade(0);
		super.save(cardsCategory);
		fillCardsCategory(cardsCategory);
		super.update(cardsCategory);
		return cardsCategory.getId();
	}
	
	// 自动设置path、grade
	@Override
	public void update(CardsCategory cardsCategory) {
		fillCardsCategory(cardsCategory);
		super.update(cardsCategory);
		List<CardsCategory> childrenCardsCategoryList = getChildrenCardsCategoryList(cardsCategory, true, null);
		if (childrenCardsCategoryList != null) {
			for (int i = 0; i < childrenCardsCategoryList.size(); i ++) {
				CardsCategory childrenCategory = childrenCardsCategoryList.get(i);
				fillCardsCategory(childrenCategory);
				super.update(childrenCategory);
				if(i % 20 == 0) {
					flush();
					clear();
				}
			}
		}
	}
	
	private void fillCardsCategory(CardsCategory cardsCategory) {
		CardsCategory parent = cardsCategory.getParent();
		if (parent == null) {
			cardsCategory.setPath(cardsCategory.getId());
		} else {
			cardsCategory.setPath(parent.getPath() + CardsCategory.PATH_SEPARATOR + cardsCategory.getId());
		}
		cardsCategory.setGrade(cardsCategory.getPath().split(CardsCategory.PATH_SEPARATOR).length - 1);
	}

}