package net.xxs.action.admin;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.xxs.bean.Report;
import net.xxs.service.ReportService;

import org.apache.struts2.convention.annotation.ParentPackage;

/**
 * 后台Action类 - 统计报告
 */

@ParentPackage("admin")
public class ReportAction extends BaseAdminAction {

	private static final long serialVersionUID = 3855836683579135709L;
	
	private List<Report> reportList = new ArrayList<Report>();
	private Date beginDate;// 开始日期
	private Date endDate;// 结束日期
	@Resource(name = "reportServiceImpl")
	private ReportService reportService;
	
	// 报表首页
	public String info() {
		List list = reportService.getReportList(beginDate, endDate);
//		System.out.println(list.size());
		if(list != null && list.size() >0){
			Report report = new Report();
			for (int i = 0; i < list.size(); i++) {
				Map map = (Map)list.get(i);
//				System.out.println(map.get("saleCount").toString()+"||"+map.get("saleMoney").toString()+"||"+map.get("tongdao").toString());
				report.setSaleCount(Integer.parseInt(map.get("saleCount").toString()));
				report.setSaleMoney(map.get("saleMoney").toString());
				report.setTongdao(map.get("tongdao").toString());
				reportList.add(report);
			}
		}
		return "index";
	}

	public List<Report> getReportList() {
		return reportList;
	}

	public void setReportList(List<Report> reportList) {
		this.reportList = reportList;
	}

	public Date getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

}