package net.xxs.dao.impl;

import java.util.Date;
import java.util.List;

import net.xxs.bean.Report;
import net.xxs.dao.ReportDao;
import net.xxs.entity.Deposit.DepositType;
import net.xxs.entity.Order.OrderStatus;
import net.xxs.entity.Withdraw.WithdrawStatus;

import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Repository;

/**
 * Dao实现类 - 统计报告
 */

@Repository("reportDaoImpl")
public class ReportDaoImpl extends BaseDaoImpl<Report, String> implements ReportDao {

	@SuppressWarnings("rawtypes")
	public List getReportList(Date beginDate, Date endDate) {
		String sql = "select pp.`name` tongdao,count(oo.id) saleCount,sum(oo.amount) saleMoney from xx_order oo,xx_payment_config pp where oo.payment_config_id=pp.id";
		return this.getSession().createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
	}

	public String getTotalOrderMoney(OrderStatus orderStatus, Date beginDate,
			Date endDate) {
		return null;
	}

	public String getTotalDepositMoney(DepositType depositType, Date beginDate,
			Date endDate) {
		return null;
	}

	public String getTotalWithdrawMoney(WithdrawStatus withdrawStatus,
			Date beginDate, Date endDate) {
		return null;
	}

}