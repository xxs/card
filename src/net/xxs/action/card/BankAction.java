package net.xxs.action.card;

import javax.annotation.Resource;

import net.xxs.entity.Member;
import net.xxs.entity.MemberBank;
import net.xxs.service.MemberBankService;

import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.opensymphony.xwork2.interceptor.annotations.InputConfig;

/**
 * 前台Action类 - 密码、安全问题
 */

@ParentPackage("card")
@InterceptorRefs({
	@InterceptorRef(value = "memberVerifyInterceptor"),
	@InterceptorRef(value = "cardStack")
})
public class BankAction extends BaseCardAction {

	private static final long serialVersionUID = 8691965706902473480L;
	
	private Member member;
	private MemberBank memberBank;
	
	@Resource(name = "memberBankServiceImpl")
	private MemberBankService memberBankService;
	
	// 账户列表
	public String list() {
		member = getLoginMember();
		return LIST;
	}
	// 账户
	public String edit() {
		memberBank = memberBankService.get(id);
		return LIST;
	}
	// 设置默认
	public String check() {
		member = getLoginMember();
		memberBank = memberBankService.get(id);
		memberBank.setIsDefault(true);
		memberBankService.update(memberBank);
		return LIST;
	}

	// 账户更新
	@InputConfig(resultName = "error")
	public String update() {
		memberBankService.update(memberBank);
		return SUCCESS;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}
	public MemberBank getMemberBank() {
		return memberBank;
	}
	public void setMemberBank(MemberBank memberBank) {
		this.memberBank = memberBank;
	}


}