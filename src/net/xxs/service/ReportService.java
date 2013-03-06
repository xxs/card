package net.xxs.service;

import java.util.Date;
import java.util.List;

import net.xxs.bean.Report;
import net.xxs.entity.Deposit.DepositType;
import net.xxs.entity.Order.OrderStatus;
import net.xxs.entity.Withdraw.WithdrawStatus;


/**
 * Service接口 - 统计报表
 */

public interface ReportService {

	public List<Report> getReportList(Date beginDate, Date endDate);
	public List getTotalOrderMoney(OrderStatus orderStatus,Date beginDate, Date endDate);
	public List getTotalDepositMoney(DepositType depositType,Date beginDate, Date endDate);
	public List getTotalWithdrawMoney(WithdrawStatus withdrawStatus,Date beginDate, Date endDate);
}