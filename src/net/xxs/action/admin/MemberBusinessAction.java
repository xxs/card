package net.xxs.action.admin;

import javax.annotation.Resource;

import net.xxs.entity.MemberBusiness;
import net.xxs.entity.MemberBusiness.ResultType;
import net.xxs.service.MemberBusinessService;

import org.apache.struts2.convention.annotation.ParentPackage;

/**
 * 后台Action类 - 商户
 */

@ParentPackage("admin")
public class MemberBusinessAction extends BaseAdminAction {


	private static final long serialVersionUID = 2255362894396886832L;

	private MemberBusiness memberBusiness;

	@Resource(name = "memberBusinessServiceImpl")
	private MemberBusinessService memberBusinessService;


	// 列表
	public String list() {
		pager = memberBusinessService.findPager(pager);
		return LIST;
	}
	// 列表
	public String applying() {
		pager = memberBusinessService.getMemberBusinessPager(ResultType.apply, pager);
		return LIST;
	}
	// 添加
	public String add() {
		return INPUT;
	}

	// 编辑
	public String edit() {
		memberBusiness = memberBusinessService.load(id);
		return INPUT;
	}

	public MemberBusiness getMemberBusiness() {
		return memberBusiness;
	}

	public void setMemberBusiness(MemberBusiness memberBusiness) {
		this.memberBusiness = memberBusiness;
	}
}