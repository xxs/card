package net.xxs.action.card;

import javax.annotation.Resource;

import net.xxs.entity.MemberLog;
import net.xxs.service.MemberLogService;

import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.ParentPackage;

/**
 * 后台Action类 - 会员日志
 */

@ParentPackage("card")
@InterceptorRefs({
	@InterceptorRef(value = "memberVerifyInterceptor")
})
public class MemberLogAction extends BaseCardAction {


	private static final long serialVersionUID = -8629629288840834761L;

	private MemberLog memberLog;

	@Resource(name = "memberLogServiceImpl") 
	private MemberLogService memberLogService;
	
	// 列表
	public String list() {
		pager = memberLogService.getMemberLogPager(getLoginMember(),pager);
		return LIST;
	}

	public MemberLog getMemberLog() {
		return memberLog;
	}

	public void setMemberLog(MemberLog memberLog) {
		this.memberLog = memberLog;
	}


}