package net.xxs.dao;

import java.util.Date;
import java.util.List;

import net.xxs.entity.Deposit.DepositType;
import net.xxs.entity.Order.OrderStatus;
import net.xxs.entity.Withdraw.WithdrawStatus;

/**
 * Dao接口 - 统计报告报表
 */

public interface ReportDao  {
	public List getReportList(Date beginDate, Date endDate);
	public String getTotalOrderMoney(OrderStatus orderStatus,Date beginDate, Date endDate);
	public String getTotalDepositMoney(DepositType depositType,Date beginDate, Date endDate);
	public String getTotalWithdrawMoney(WithdrawStatus withdrawStatus,Date beginDate, Date endDate);
}