package net.xxs.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import net.xxs.bean.Report;
import net.xxs.dao.ReportDao;
import net.xxs.entity.Deposit.DepositType;
import net.xxs.entity.Order.OrderStatus;
import net.xxs.entity.Withdraw.WithdrawStatus;
import net.xxs.service.ReportService;

import org.springframework.stereotype.Service;

/**
 * Service实现类 - 品牌
 */

@Service("reportServiceImpl")
public class ReportServiceImpl implements ReportService {

	@Resource(name = "reportDaoImpl")
	private ReportDao reportDao;
	
	@SuppressWarnings("unchecked")
	public List<Report> getReportList(Date beginDate, Date endDate) {
		return reportDao.getReportList(beginDate,endDate);
	}

	public List getTotalOrderMoney(OrderStatus orderStatus, Date beginDate,
			Date endDate) {
		return reportDao.getTotalOrderMoney(orderStatus, beginDate, endDate);
	}

	public List getTotalDepositMoney(DepositType depositType, Date beginDate,
			Date endDate) {
		return reportDao.getTotalDepositMoney(depositType, beginDate, endDate);
	}

	public List getTotalWithdrawMoney(WithdrawStatus withdrawStatus,
			Date beginDate, Date endDate) {
		return reportDao.getTotalWithdrawMoney(withdrawStatus, beginDate, endDate);
	}


}