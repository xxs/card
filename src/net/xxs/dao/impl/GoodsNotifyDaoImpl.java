package net.xxs.dao.impl;

import net.xxs.bean.Pager;
import net.xxs.dao.GoodsNotifyDao;
import net.xxs.entity.GoodsNotify;
import net.xxs.entity.Member;

import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

/**
 * Dao实现类 - 到货通知
 */

@Repository("goodsNotifyDaoImpl")
public class GoodsNotifyDaoImpl extends BaseDaoImpl<GoodsNotify, String> implements GoodsNotifyDao {
	
	public Pager findPager(Member member, Pager pager) {
		return super.findPager(pager, Restrictions.eq("member", member));
	}
	
	public Long getUnprocessedGoodsNotifyCount() {
		String hql = "select count(*) from GoodsNotify as goodsNotify where goodsNotify.isSent = :isSent";
		return (Long) getSession().createQuery(hql).setParameter("isSent", false).uniqueResult();
	}

}