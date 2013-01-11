package net.xxs.dao.impl;

import net.xxs.bean.Pager;
import net.xxs.dao.MemberBusinessDao;
import net.xxs.entity.MemberBusiness;
import net.xxs.entity.MemberBusiness.ResultType;

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

	public boolean isExistByBusinessName(String businessname) {
		String hql = "from MemberBusiness as memberBusiness where lower(memberBusiness.businessName) = lower(:businessname)";
		MemberBusiness memberBusiness = (MemberBusiness) getSession().createQuery(hql).setParameter("businessname", businessname).uniqueResult();
		if (memberBusiness != null) {
			return true;
		} else {
			return false;
		}
	}

	public boolean isExistByBusinessNumber(String businessNumber) {
		String hql = "from MemberBusiness as memberBusiness where lower(memberBusiness.businessNumber) = lower(:businessNumber)";
		MemberBusiness memberBusiness = (MemberBusiness) getSession().createQuery(hql).setParameter("businessNumber", businessNumber).uniqueResult();
		if (memberBusiness != null) {
			return true;
		} else {
			return false;
		}
	}

	public boolean isExistByUrl(String url) {
		String hql = "from MemberBusiness as memberBusiness where lower(memberBusiness.url) = lower(:url)";
		MemberBusiness memberBusiness = (MemberBusiness) getSession().createQuery(hql).setParameter("url", url).uniqueResult();
		if (memberBusiness != null) {
			return true;
		} else {
			return false;
		}
	}

	public boolean isExistByIcp(String icp) {
		String hql = "from MemberBusiness as memberBusiness where lower(memberBusiness.icp) = lower(:icp)";
		MemberBusiness memberBusiness = (MemberBusiness) getSession().createQuery(hql).setParameter("icp", icp).uniqueResult();
		if (memberBusiness != null) {
			return true;
		} else {
			return false;
		}
	}
}