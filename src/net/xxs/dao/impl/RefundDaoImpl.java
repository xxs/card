package net.xxs.dao.impl;

import java.util.List;

import net.xxs.dao.RefundDao;
import net.xxs.entity.Refund;

import org.springframework.stereotype.Repository;

/**
 * Dao实现类 - 退款
 */

@Repository("refundDaoImpl")
public class RefundDaoImpl extends BaseDaoImpl<Refund, String> implements RefundDao {
	
	@SuppressWarnings("unchecked")
	public String getLastRefundSn() {
		String hql = "from Refund as refund order by refund.createDate desc";
		List<Refund> refundList =  getSession().createQuery(hql).setFirstResult(0).setMaxResults(1).list();
		if (refundList != null && refundList.size() > 0) {
			return refundList.get(0).getRefundSn();
		} else {
			return null;
		}
	}
	
	public Refund getRefundByRefundSn(String refundSn) {
		String hql = "from Refund as refund where refund.refundSn = :refundSn";
		return (Refund) getSession().createQuery(hql).setParameter("refundSn", refundSn).uniqueResult();
	}

}