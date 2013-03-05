package net.xxs.service;

import java.util.Date;
import java.util.List;

import net.xxs.bean.Report;


/**
 * Service接口 - 统计报表
 */

public interface ReportService {

	public List<Report> getReportList(Date beginDate, Date endDate);
}