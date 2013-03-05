package net.xxs.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import net.xxs.bean.Report;
import net.xxs.dao.ReportDao;
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


}