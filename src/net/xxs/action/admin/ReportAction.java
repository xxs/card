package net.xxs.action.admin;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.xxs.bean.Report;
import net.xxs.entity.Withdraw.WithdrawStatus;
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
	private String tempBeginDate;// 开始日期
	private String tempEndDate;// 结束日期
	private Double applyWithdrawMoney;
	private Double applyWithdrawTotalMoney;
	private Double successWithdrawMoney;
	private Double successWithdrawTotalMoney;
	private Double orderMoney;
	private Double orderTotalMoney;
	private Double successOrderMoney;
	private Double successOrderTotalMoney;
	private Double onlineMoney;
	private Double onlineTotalMoney;
	private Double serverTotalMoney;
	
	
	@Resource(name = "reportServiceImpl")
	private ReportService reportService;
	
	// 报表首页
	public String info() {
		if (beginDate != null) {
			beginDate.setHours(0);
			beginDate.setMinutes(0);
			beginDate.setSeconds(0);
		}
		if (endDate != null) {
			endDate.setHours(23);
			endDate.setMinutes(59);
			endDate.setSeconds(59);
		}
		List contentlist = reportService.getReportList(beginDate, endDate);
		List applyWithdrawList = reportService.getTotalWithdrawMoney(WithdrawStatus.apply, beginDate, endDate);
		List successWithdrawList = reportService.getTotalWithdrawMoney(WithdrawStatus.success, beginDate, endDate);
		if(contentlist != null && contentlist.size() >0){
			Report report = null;
			for (int i = 0; i < contentlist.size(); i++) {
				report = new Report();
				Map map = (Map)contentlist.get(i);
//				System.out.println(map.get("saleCount").toString()+"||"+map.get("saleMoney").toString()+"||"+map.get("tongdao").toString());
				report.setSaleCount(Integer.parseInt(map.get("saleCount").toString()));
				report.setSaleMoney(map.get("saleMoney").toString());
				report.setTongdao(map.get("tongdao").toString());
				reportList.add(report);
			}
		}
		if(applyWithdrawList != null && applyWithdrawList.size() >0){
			for (int i = 0; i < applyWithdrawList.size(); i++) {
				Map map = (Map)applyWithdrawList.get(i);
				//System.out.println(map.get("money").toString()+"||"+map.get("total_money").toString());
				if(map.get("money")!=null){
					applyWithdrawMoney = Double.parseDouble(map.get("money").toString());
				}else{
					applyWithdrawMoney = 0.0;
				}
				if(map.get("total_money")!=null){
					applyWithdrawTotalMoney= Double.parseDouble(map.get("total_money").toString());
				}else{
					applyWithdrawTotalMoney = 0.0;
				}	
			}
		}
		if(successWithdrawList != null && successWithdrawList.size() >0){
			for (int i = 0; i < successWithdrawList.size(); i++) {
				Map map = (Map)successWithdrawList.get(i);
				//System.out.println(map.get("money").toString()+"||"+map.get("total_money").toString());
				if(map.get("money")!=null){
					successWithdrawMoney = Double.parseDouble(map.get("money").toString());
				}else{
					successWithdrawMoney = 0.0;
				}	
				if(map.get("total_money")!=null){
					successWithdrawTotalMoney= Double.parseDouble(map.get("total_money").toString());
				}else{
					successWithdrawTotalMoney = 0.0;
				}	
			}
		}
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		if(beginDate!=null){
			tempBeginDate = sf.format(beginDate);
		}
		if(endDate!=null){
			tempEndDate = sf.format(endDate);
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

	public Double getApplyWithdrawMoney() {
		return applyWithdrawMoney;
	}

	public void setApplyWithdrawMoney(Double applyWithdrawMoney) {
		this.applyWithdrawMoney = applyWithdrawMoney;
	}

	public Double getApplyWithdrawTotalMoney() {
		return applyWithdrawTotalMoney;
	}

	public void setApplyWithdrawTotalMoney(Double applyWithdrawTotalMoney) {
		this.applyWithdrawTotalMoney = applyWithdrawTotalMoney;
	}

	public Double getSuccessWithdrawMoney() {
		return successWithdrawMoney;
	}

	public void setSuccessWithdrawMoney(Double successWithdrawMoney) {
		this.successWithdrawMoney = successWithdrawMoney;
	}

	public Double getSuccessWithdrawTotalMoney() {
		return successWithdrawTotalMoney;
	}

	public void setSuccessWithdrawTotalMoney(Double successWithdrawTotalMoney) {
		this.successWithdrawTotalMoney = successWithdrawTotalMoney;
	}

	public Double getOrderMoney() {
		return orderMoney;
	}

	public void setOrderMoney(Double orderMoney) {
		this.orderMoney = orderMoney;
	}

	public Double getOrderTotalMoney() {
		return orderTotalMoney;
	}

	public void setOrderTotalMoney(Double orderTotalMoney) {
		this.orderTotalMoney = orderTotalMoney;
	}

	public Double getSuccessOrderMoney() {
		return successOrderMoney;
	}

	public void setSuccessOrderMoney(Double successOrderMoney) {
		this.successOrderMoney = successOrderMoney;
	}

	public Double getSuccessOrderTotalMoney() {
		return successOrderTotalMoney;
	}

	public void setSuccessOrderTotalMoney(Double successOrderTotalMoney) {
		this.successOrderTotalMoney = successOrderTotalMoney;
	}

	public Double getOnlineMoney() {
		return onlineMoney;
	}

	public void setOnlineMoney(Double onlineMoney) {
		this.onlineMoney = onlineMoney;
	}

	public Double getOnlineTotalMoney() {
		return onlineTotalMoney;
	}

	public void setOnlineTotalMoney(Double onlineTotalMoney) {
		this.onlineTotalMoney = onlineTotalMoney;
	}

	public Double getServerTotalMoney() {
		return serverTotalMoney;
	}

	public void setServerTotalMoney(Double serverTotalMoney) {
		this.serverTotalMoney = serverTotalMoney;
	}

	public String getTempBeginDate() {
		return tempBeginDate;
	}

	public void setTempBeginDate(String tempBeginDate) {
		this.tempBeginDate = tempBeginDate;
	}

	public String getTempEndDate() {
		return tempEndDate;
	}

	public void setTempEndDate(String tempEndDate) {
		this.tempEndDate = tempEndDate;
	}

}