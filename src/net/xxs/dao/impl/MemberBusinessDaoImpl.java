package net.xxs.dao.impl;

import net.xxs.dao.MemberBusinessDao;
import net.xxs.entity.MemberBusiness;
import net.xxs.entity.MemberBusiness.ResultType;

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
	
}