package net.xxs.action.card;

import javax.annotation.Resource;

import net.xxs.entity.Member;
import net.xxs.service.MemberService;
import net.xxs.service.MessageService;

import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.ParentPackage;

/**
 * 前台Action类 - 会员中心
 */

@ParentPackage("card")
@InterceptorRefs({
	@InterceptorRef(value = "memberVerifyInterceptor"),
	@InterceptorRef(value = "cardStack")
})
public class MemberCenterAction extends BaseCardAction {

	private static final long serialVersionUID = -3568504222758246021L;
	
	private Boolean isverifyname;
	private Boolean isverifyphone;
	private Boolean isverifywithdrawpwd;
	private Boolean isverifysafe;
	private Boolean isverifybank;
	private double safeperfect;
	private double personalinfo;
	
	
	@Resource(name = "memberServiceImpl")
	MemberService memberService;
	@Resource(name = "messageServiceImpl")
	MessageService messageService;
	
	// 会员中心首页
	public String index() {
		Member loginMember = getLoginMember();
		if(null != loginMember){
			isverifyname = (null == loginMember.getName()||("".equals(loginMember.getName())))?true:false;
			isverifyphone = (null == loginMember.getPhone()||("".equals(loginMember.getPhone())))?true:false;
			isverifywithdrawpwd = (null == loginMember.getWithdrawPwd()||("".equals(loginMember.getWithdrawPwd())))?true:false;
			isverifysafe = (null == loginMember.getSafeQuestion()||("".equals(loginMember.getSafeQuestion())))?true:false;
			isverifybank = loginMember.getMemberBankSet().isEmpty();
		}
		if(!isverifyname){
			safeperfect+=0.2;
		}
		if(!isverifyphone){
			safeperfect+=0.2;
		}
		if(!isverifywithdrawpwd){
			safeperfect+=0.2;
		}
		if(!isverifysafe){
			safeperfect+=0.2;
		}
		if(!isverifybank){
			safeperfect+=0.2;
		}
		if(null != loginMember.getName()&&(!"".equals(loginMember.getName()))){
			personalinfo+=0.2;
		}
		if(null != loginMember.getGender()&&(!"".equals(loginMember.getGender()))){
			personalinfo+=0.1;
		}
		if(null != loginMember.getBirth()&&(!"".equals(loginMember.getBirth()))){
			personalinfo+=0.1;
		}
		if(null != loginMember.getAddress()&&(!"".equals(loginMember.getAddress()))){
			personalinfo+=0.1;
		}
		if(null != loginMember.getZipCode()&&(!"".equals(loginMember.getZipCode()))){
			personalinfo+=0.1;
		}
		if(null != loginMember.getPhone()&&(!"".equals(loginMember.getPhone()))){
			personalinfo+=0.1;
		}
		if(null != loginMember.getMobile()&&(!"".equals(loginMember.getMobile()))){
			personalinfo+=0.1;
		}
		if(null != loginMember.getReferrer()&&(!"".equals(loginMember.getReferrer()))){
			personalinfo+=0.2;
		}
		return "index";
	}

	// 获取未读消息数量
	public Long getUnreadMessageCount() {
		return messageService.getUnreadMessageCount(getLoginMember());
	}

	public Boolean getIsverifyname() {
		return isverifyname;
	}

	public void setIsverifyname(Boolean isverifyname) {
		this.isverifyname = isverifyname;
	}

	public Boolean getIsverifyphone() {
		return isverifyphone;
	}

	public void setIsverifyphone(Boolean isverifyphone) {
		this.isverifyphone = isverifyphone;
	}

	public Boolean getIsverifywithdrawpwd() {
		return isverifywithdrawpwd;
	}

	public void setIsverifywithdrawpwd(Boolean isverifywithdrawpwd) {
		this.isverifywithdrawpwd = isverifywithdrawpwd;
	}

	public Boolean getIsverifysafe() {
		return isverifysafe;
	}

	public void setIsverifysafe(Boolean isverifysafe) {
		this.isverifysafe = isverifysafe;
	}

	public Boolean getIsverifybank() {
		return isverifybank;
	}

	public void setIsverifybank(Boolean isverifybank) {
		this.isverifybank = isverifybank;
	}

	public double getSafeperfect() {
		return safeperfect;
	}

	public void setSafeperfect(double safeperfect) {
		this.safeperfect = safeperfect;
	}

	public double getPersonalinfo() {
		return personalinfo;
	}

	public void setPersonalinfo(double personalinfo) {
		this.personalinfo = personalinfo;
	}
	
}