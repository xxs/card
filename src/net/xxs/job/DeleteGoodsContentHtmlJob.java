package net.xxs.job;

import java.util.Map;

import net.xxs.service.HtmlService;
import net.xxs.util.SpringUtil;

import org.quartz.Job;
import org.quartz.JobExecutionContext;

/**
 * Service接口 - 删除商品内容HTML任务
 */

public class DeleteGoodsContentHtmlJob implements Job {
	
	public static final String JOB_NAME = "deleteGoodsContentHtmlJob";// 任务名称
	public static final String TRIGGER_NAME = "deleteGoodsContentHtmlTrigger";// Trigger名称
	public static final String GROUP_NAME = "deleteGoodsContentHtmlGroup";// Group名称

	public void execute(JobExecutionContext context) {
		HtmlService htmlService = (HtmlService) SpringUtil.getBean("quartzHtmlServiceImpl");
		Map<?, ?> jobDataMap = context.getJobDetail().getJobDataMap();
		String htmlPath = (String) jobDataMap.get("htmlPath");
		htmlService.deleteGoodsContentHtml(htmlPath);
	}

}