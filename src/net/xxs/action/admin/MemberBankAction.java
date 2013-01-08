package net.xxs.action.admin;

import javax.annotation.Resource;

import net.xxs.entity.MemberBank;
import net.xxs.service.MemberBankService;

import org.apache.struts2.convention.annotation.ParentPackage;

/**
 * 后台Action类 - 银行卡
 */

@ParentPackage("admin")
public class MemberBankAction extends BaseAdminAction {

	private static final long serialVersionUID = -5451875129461788865L;

	private MemberBank memberBank;

	@Resource(name = "memberBankServiceImpl")
	private MemberBankService memberBankService;


	// 列表
	public String list() {
		pager = memberBankService.findPager(pager);
		return LIST;
	}

	// 添加
	public String add() {
		return INPUT;
	}

	// 编辑
	public String edit() {
		memberBank = memberBankService.load(id);
		return INPUT;
	}

	public MemberBank getMemberBank() {
		return memberBank;
	}

	public void setMemberBank(MemberBank memberBank) {
		this.memberBank = memberBank;
	}
}