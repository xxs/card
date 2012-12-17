package net.xxs.action.admin;

import java.util.Date;

import javax.annotation.Resource;

import net.xxs.entity.GoodsNotify;
import net.xxs.service.GoodsNotifyService;
import net.xxs.service.MailService;

import org.apache.struts2.convention.annotation.ParentPackage;

/**
 * 后台Action类 - 到货通知
 */

@ParentPackage("admin")
public class GoodsNotifyAction extends BaseAdminAction {

	private static final long serialVersionUID = 9134988941709810166L;

	@Resource(name = "goodsNotifyServiceImpl")
	private GoodsNotifyService goodsNotifyService;
	@Resource(name = "mailServiceImpl")
	private MailService mailService;
	
	// 列表
	public String list() {
		pager = goodsNotifyService.findPager(pager);
		return LIST;
	}

	// 删除
	public String delete() {
		goodsNotifyService.delete(ids);
		return ajax(Status.success, "删除成功!");
	}
	
	// 发送
	public String send() {
		for (String id : ids) {
			GoodsNotify goodsNotify = goodsNotifyService.load(id);
			goodsNotify.setSendDate(new Date());
			goodsNotify.setIsSent(true);
			goodsNotifyService.update(goodsNotify);
			mailService.sendGoodsNotifyMail(goodsNotify);
		}
		return ajax(Status.success, "到货通知发送成功!");
	}

}