package net.xxs.action.admin;

import javax.annotation.Resource;

import net.xxs.entity.Reship;
import net.xxs.service.ReshipService;

import org.apache.struts2.convention.annotation.ParentPackage;

/**
 * 后台Action类 - 退货
 */

@ParentPackage("admin")
public class ReshipAction extends BaseAdminAction {

	private static final long serialVersionUID = -571777768643219736L;

	private Reship reship;

	@Resource(name = "reshipServiceImpl")
	private ReshipService reshipService;

	// 查看
	public String view() {
		reship = reshipService.load(id);
		return VIEW;
	}

	// 列表
	public String list() {
		pager = reshipService.findPager(pager);
		return LIST;
	}

	// 删除
	public String delete() {
		try {
			reshipService.delete(ids);
		} catch (Exception e) {
			return ajax(Status.error, "删除失败,会员数据被引用!");
		}
		return ajax(Status.success, "删除成功!");
	}

	public Reship getReship() {
		return reship;
	}

	public void setReship(Reship reship) {
		this.reship = reship;
	}

}