package net.xxs.dao.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import net.xxs.bean.Pager;
import net.xxs.dao.CardsDao;
import net.xxs.entity.Brand;
import net.xxs.entity.Cards;
import net.xxs.entity.CardsAttribute;
import net.xxs.entity.CardsCategory;
import net.xxs.entity.Member;
import net.xxs.entity.OrderItem;
import net.xxs.entity.Product;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

/**
 * Dao实现类 - 商品
 */

@Repository("cardsDaoImpl")
public class CardsDaoImpl extends BaseDaoImpl<Cards, String> implements CardsDao {
	
	public boolean isExistByCardsSn(String cardsSn) {
		String hql = "from Cards as cards where lower(cards.cardsSn) = lower(:cardsSn)";
		Cards cards = (Cards) getSession().createQuery(hql).setParameter("cardsSn", cardsSn).uniqueResult();
		if (cards != null) {
			return true;
		} else {
			return false;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Cards> getCardsList(CardsCategory cardsCategory, String type, boolean isContainChildren, Integer maxResults) {
		Query query = null;
		if (cardsCategory != null) {
			if (StringUtils.equalsIgnoreCase(type, "best")) {
				if (isContainChildren) {
					String hql = "from Cards as cards where cards.isMarketable = :isMarketable and cards.isBest = :isBest and cards.cardsCategory.path like :path order by cards.createDate desc";
					query = getSession().createQuery(hql);
					query.setParameter("isMarketable", true).setParameter("isBest", true).setParameter("path", cardsCategory.getPath() + "%");
				} else {
					String hql = "from Cards as cards where cards.isMarketable = :isMarketable and cards.cardsCategory = :cardsCategory and cards.isBest = :isBest order by cards.createDate desc";
					query = getSession().createQuery(hql);
					query.setParameter("isMarketable", true).setParameter("cardsCategory", cardsCategory).setParameter("isBest", true);
				}
			} else if (StringUtils.equalsIgnoreCase(type, "new")) {
				if (isContainChildren) {
					String hql = "from Cards as cards where cards.isMarketable = :isMarketable and cards.isNew = :isNew and cards.cardsCategory.path like :path order by cards.createDate desc";
					query = getSession().createQuery(hql);
					query.setParameter("isMarketable", true).setParameter("isNew", true).setParameter("path", cardsCategory.getPath() + "%");
				} else {
					String hql = "from Cards as cards where cards.isMarketable = :isMarketable and cards.cardsCategory = :cardsCategory and cards.isNew = :isNew order by cards.createDate desc";
					query = getSession().createQuery(hql);
					query.setParameter("isMarketable", true).setParameter("cardsCategory", cardsCategory).setParameter("isNew", true);
				}
			} else if (StringUtils.equalsIgnoreCase(type, "hot")) {
				if (isContainChildren) {
					String hql = "from Cards as cards where cards.isMarketable = :isMarketable and cards.isHot = :isHot and cards.cardsCategory.path like :path order by cards.createDate desc";
					query = getSession().createQuery(hql);
					query.setParameter("isMarketable", true).setParameter("isHot", true).setParameter("path", cardsCategory.getPath() + "%");
				} else {
					String hql = "from Cards as cards where cards.isMarketable = :isMarketable and cards.cardsCategory = :cardsCategory and cards.isHot = :isHot order by cards.createDate desc";
					query = getSession().createQuery(hql);
					query.setParameter("isMarketable", true).setParameter("cardsCategory", cardsCategory).setParameter("isHot", true);
				}
			} else {
				if (isContainChildren) {
					String hql = "from Cards as cards where cards.isMarketable = :isMarketable and cards.cardsCategory.path like :path order by cards.createDate desc";
					query = getSession().createQuery(hql);
					query.setParameter("isMarketable", true).setParameter("path", cardsCategory.getPath() + "%");
				} else {
					String hql = "from Cards as cards where cards.isMarketable = :isMarketable and cards.cardsCategory = :cardsCategory order by cards.createDate desc";
					query = getSession().createQuery(hql);
					query.setParameter("isMarketable", true).setParameter("cardsCategory", cardsCategory);
				}
			}
		} else {
			if (StringUtils.equalsIgnoreCase(type, "best")) {
				String hql = "from Cards as cards where cards.isMarketable = :isMarketable and cards.isBest = :isBest order by cards.createDate desc";
				query = getSession().createQuery(hql);
				query.setParameter("isMarketable", true).setParameter("isBest", true);
			} else if (StringUtils.equalsIgnoreCase(type, "new")) {
				String hql = "from Cards as cards where cards.isMarketable = :isMarketable and cards.isNew = :isNew order by cards.createDate desc";
				query = getSession().createQuery(hql);
				query.setParameter("isMarketable", true).setParameter("isNew", true);
			} else if (StringUtils.equalsIgnoreCase(type, "hot")) {
				String hql = "from Cards as cards where cards.isMarketable = :isMarketable and cards.isHot = :isHot order by cards.createDate desc";
				query = getSession().createQuery(hql);
				query.setParameter("isMarketable", true).setParameter("isHot", true);
			} else {
				String hql = "from Cards as cards where cards.isMarketable = :isMarketable order by cards.createDate desc";
				query = getSession().createQuery(hql);
				query.setParameter("isMarketable", true);
			}
		}
		if (maxResults != null) {
			query.setMaxResults(maxResults);
		}
		return query.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Cards> getCardsList(CardsCategory cardsCategory, Date beginDate, Date endDate, Integer firstResult, Integer maxResults) {
		Query query = null;
		if (cardsCategory != null) {
			if (beginDate != null && endDate == null) {
				String hql = "from Cards as cards where cards.isMarketable = :isMarketable and cards.cardsCategory.path like :path and cards.createDate > :beginDate order by cards.createDate desc";
				query = getSession().createQuery(hql);
				query.setParameter("isMarketable", true).setParameter("path", cardsCategory.getPath() + "%").setParameter("beginDate", beginDate);
			} else if (endDate != null && beginDate == null) {
				String hql = "from Cards as cards where cards.isMarketable = :isMarketable and cards.cardsCategory.path like :path and cards.createDate < :endDate order by cards.createDate desc";
				query = getSession().createQuery(hql);
				query.setParameter("isMarketable", true).setParameter("path", cardsCategory.getPath() + "%").setParameter("endDate", endDate);
			} else if (endDate != null && beginDate != null) {
				String hql = "from Cards as cards where cards.isMarketable = :isMarketable and cards.cardsCategory.path like :path and cards.createDate > :beginDate and cards.createDate < :endDate order by cards.createDate desc";
				query = getSession().createQuery(hql);
				query.setParameter("isMarketable", true).setParameter("path", cardsCategory.getPath() + "%").setParameter("beginDate", beginDate).setParameter("endDate", endDate);
			} else {
				String hql = "from Cards as cards where cards.isMarketable = :isMarketable and cards.cardsCategory.path like :path order by cards.createDate desc";
				query = getSession().createQuery(hql);
				query.setParameter("isMarketable", true).setParameter("path", cardsCategory.getPath() + "%");
			}
		} else {
			if (beginDate != null && endDate == null) {
				String hql = "from Cards as cards where cards.isMarketable = :isMarketable and cards.createDate > :beginDate order by cards.createDate desc";
				query = getSession().createQuery(hql);
				query.setParameter("isMarketable", true).setParameter("beginDate", beginDate);
			} else if (endDate != null && beginDate == null) {
				String hql = "from Cards as cards where cards.isMarketable = :isMarketable and cards.createDate < :endDate order by cards.createDate desc";
				query = getSession().createQuery(hql);
				query.setParameter("isMarketable", true).setParameter("endDate", endDate);
			} else if (endDate != null && beginDate != null) {
				String hql = "from Cards as cards where cards.isMarketable = :isMarketable and cards.createDate > :beginDate and cards.createDate < :endDate order by cards.createDate desc";
				query = getSession().createQuery(hql);
				query.setParameter("isMarketable", true).setParameter("beginDate", beginDate).setParameter("endDate", endDate);
			} else {
				String hql = "from Cards as cards where cards.isMarketable = :isMarketable order by cards.createDate desc";
				query = getSession().createQuery(hql);
				query.setParameter("isMarketable", true);
			}
		}
		if (firstResult != null) {
			query.setFirstResult(firstResult);
		}
		if (maxResults != null) {
			query.setMaxResults(maxResults);
		}
		return query.list();
	}
	
	public Pager getCardsPager(CardsCategory cardsCategory, Pager pager) {
		Criteria criteria = getSession().createCriteria(Cards.class);
		criteria.createAlias("cardsCategory", "cardsCategory");
		criteria.add(Restrictions.eq("isMarketable", true));
		criteria.add(Restrictions.or(Restrictions.eq("cardsCategory", cardsCategory), Restrictions.like("cardsCategory.path", cardsCategory.getPath() + "%")));
		return super.findPager(pager, criteria);
	}
	
	public Pager getCardsPager(CardsCategory cardsCategory, Brand brand, Map<CardsAttribute, String> cardsAttributeMap, Pager pager) {
		Criteria criteria = getSession().createCriteria(Cards.class);
		criteria.createAlias("cardsCategory", "cardsCategory");
		criteria.add(Restrictions.eq("isMarketable", true));
		if (cardsCategory != null) {
			criteria.add(Restrictions.or(Restrictions.eq("cardsCategory", cardsCategory), Restrictions.like("cardsCategory.path", cardsCategory.getPath() + "%")));
		}
		if (brand != null) {
			criteria.add(Restrictions.eq("brand", brand));
		}
		if (cardsAttributeMap != null) {
			for (CardsAttribute cardsAttribute : cardsAttributeMap.keySet()) {
				String cardsAttributeValue = cardsAttributeMap.get(cardsAttribute);
				if (StringUtils.isNotEmpty(cardsAttributeValue)) {
					criteria.add(Restrictions.eq(Cards.CARDS_ATTRIBUTE_VALUE_PROPERTY_NAME_PREFIX + cardsAttribute.getPropertyIndex(), cardsAttributeValue));
				}
			}
		}
		return super.findPager(pager, criteria);
	}

	public Pager getFavoriteCardsPager(Member member, Pager pager) {
		Criteria criteria = getSession().createCriteria(Cards.class);
		criteria.createAlias("favoriteMemberSet", "favoriteMemberSet");
		criteria.add(Restrictions.eq("favoriteMemberSet.id", member.getId()));
		return super.findPager(pager, criteria);
	}
	
	public Long getMarketableCardsCount() {
		String hql = "select count(*) from Cards as cards where cards.isMarketable = :isMarketable";
		return (Long) getSession().createQuery(hql).setParameter("isMarketable", true).uniqueResult();
	}
	
	public Long getUnMarketableCardsCount() {
		String hql = "select count(*) from Cards as cards where cards.isMarketable = :isMarketable";
		return (Long) getSession().createQuery(hql).setParameter("isMarketable", false).uniqueResult();
	}
	
	// 关联处理
	@Override
	public void delete(Cards cards) {
		Set<Product> productSet = cards.getProductSet();
		for (Product product : productSet) {
			Set<OrderItem> orderItemSet = product.getOrderItemSet();
			if (orderItemSet != null) {
				for (OrderItem orderItem : orderItemSet) {
					orderItem.setProduct(null);
				}
			}
		}
		super.delete(cards);
	}

	// 关联处理
	@Override
	public void delete(String id) {
		Cards cards = load(id);
		this.delete(cards);
	}

	// 关联处理
	@Override
	public void delete(String[] ids) {
		for (String id : ids) {
			Cards cards = load(id);
			this.delete(cards);
		}
	}

}