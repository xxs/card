package net.xxs.dao.impl;

import net.xxs.bean.Pager;
import net.xxs.dao.MemberBusinessDao;
import net.xxs.entity.MemberBusiness;
import net.xxs.entity.Withdraw;
import net.xxs.entity.MemberBusiness.ResultType;
import net.xxs.entity.Withdraw.WithdrawStatus;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;


/**
 * Dao实现类 - 商户
 */

@Repository("memberBusinessDaoImpl")
public class MemberBusinessDaoImpl extends BaseDaoImpl<MemberBusiness, String> implements MemberBusinessDao {

	public Long getUnprocessedMemberBusinessApplyCount() {
		String hql = "select count(*) from MemberBusiness as memberBusiness where memberBusiness.resultType = :resultType";
		return (Long) getSession().createQuery(hql).setParameter("resultType", ResultType.apply).uniqueResult();
	}

	public Long getUnprocessedMemberBusinessCount() {
		String hql = "select count(*) from MemberBusiness as memberBusiness where memberBusiness.resultType = :resultType";
		return (Long) getSession().createQuery(hql).setParameter("resultType", ResultType.success).uniqueResult();
	}
	public Pager getMemberBusinessPager(ResultType resultType,Pager pager) {
		Criteria criteria = getSession().createCriteria(MemberBusiness.class);
		if (resultType != null) {
			criteria.add(Restrictions.eq("resultType", resultType));
		}
		return super.findPager(pager, criteria);
	}
}