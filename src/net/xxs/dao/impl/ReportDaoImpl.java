package net.xxs.dao.impl;

import java.util.Date;
import java.util.List;

import net.xxs.bean.Report;
import net.xxs.dao.ReportDao;
import net.xxs.entity.Deposit.DepositType;
import net.xxs.entity.Order.OrderStatus;
import net.xxs.entity.Withdraw.WithdrawStatus;

import org.hibernate.Query;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Repository;

/**
 * Dao实现类 - 统计报告
 */

@Repository("reportDaoImpl")
public class ReportDaoImpl extends BaseDaoImpl<Report, String> implements ReportDao {

	@SuppressWarnings("rawtypes")
	public List getReportList(Date beginDate, Date endDate) {
		String sql = "select oo.payment_config_name tongdao,count(oo.id) saleCount,sum(oo.amount) saleMoney from xx_order oo where 1=1 ";
		if(beginDate != null){
			sql += " and oo.create_date  >= :beginDate";
		}
		if(beginDate != null){
			sql += " and oo.create_date <= :endDate";
		}
		sql += " GROUP BY tongdao";
		Query query = this.getSession().createSQLQuery(sql);
		if(beginDate != null){
			query.setParameter("beginDate", beginDate);
		}
		if(beginDate != null){
			query.setParameter("endDate", endDate);
		}
		return query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
	}
	@SuppressWarnings("rawtypes")
	public List getTotalOrderMoney(OrderStatus orderStatus, Date beginDate,
			Date endDate) {
		String sql = "select sum(oo.amount) amount,sum(oo.paid_amount) paid_amount,sum(oo.paid_amount*oo.card_discount) new_amount from xx_order oo where 1=1 ";
		if(orderStatus != null){
			sql += " and oo.order_status = :order_status";
		}
		if(beginDate != null){
			sql += " and oo.create_date  >= :beginDate";
		}
		if(beginDate != null){
			sql += " and oo.create_date <= :endDate";
		}
		Query query = this.getSession().createSQLQuery(sql);
		if(orderStatus != null){
			query.setParameter("order_status", orderStatus.ordinal());
		}
		if(beginDate != null){
			query.setParameter("beginDate", beginDate);
		}
		if(beginDate != null){
			query.setParameter("endDate", endDate);
		}
		return query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
	}
	@SuppressWarnings("rawtypes")
	public List getTotalDepositMoney(DepositType depositType, Date beginDate,Date endDate) {
		
		return null;
	}

	@SuppressWarnings("rawtypes")
	public List getTotalWithdrawMoney(WithdrawStatus withdrawStatus,
			Date beginDate, Date endDate) {
		String sql = "select sum(ww.money) money,sum(ww.total_money) total_money from xx_withdraw ww where 1=1  ";
		if(withdrawStatus != null){
			sql += " and ww.withdraw_status = :withdrawStatus";
		}
		if(beginDate != null){
			sql += " and ww.create_date  >= :beginDate";
		}
		if(beginDate != null){
			sql += " and ww.create_date <= :endDate";
		}
		Query query = this.getSession().createSQLQuery(sql);
		if(withdrawStatus != null){
			query.setParameter("withdrawStatus", withdrawStatus.ordinal());
		}
		if(beginDate != null){
			sql += " and ww.create_date  >= :beginDate";
			query.setParameter("beginDate", beginDate);
		}
		if(beginDate != null){
			sql += " and ww.create_date <= :endDate";
			query.setParameter("endDate", endDate);
		}
		return query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
	}

}