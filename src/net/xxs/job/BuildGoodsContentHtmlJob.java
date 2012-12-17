package net.xxs.job;

import java.util.Map;

import net.xxs.service.HtmlService;
import net.xxs.util.SpringUtil;

import org.quartz.Job;
import org.quartz.JobExecutionContext;

/**
 * Service接口 - 生成商品内容HTML任务
 */

public class BuildGoodsContentHtmlJob implements Job {
	
	public static final String JOB_NAME = "buildGoodsContentHtmlJob";// 任务名称
	public static final String TRIGGER_NAME = "buildGoodsContentHtmlTrigger";// Trigger名称
	public static final String GROUP_NAME = "buildGoodsContentHtmlGroup";// Group名称

	public void execute(JobExecutionContext context) {
		HtmlService htmlService = (HtmlService) SpringUtil.getBean("quartzHtmlServiceImpl");
		Map<?, ?> jobDataMap = context.getJobDetail().getJobDataMap();
		String id = (String) jobDataMap.get("id");
		if (id != null) {
			htmlService.buildGoodsContentHtml(id);
		} else {
			htmlService.buildGoodsContentHtml();
		}
	}

}