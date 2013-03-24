package net.xxs.action.card;

import javax.annotation.Resource;

import net.xxs.entity.Member;
import net.xxs.service.MemberService;
import net.xxs.util.StringUtil;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.opensymphony.xwork2.interceptor.annotations.InputConfig;
import com.opensymphony.xwork2.validator.annotations.StringLengthFieldValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;

/**
 * 前台Action类 - 密码、安全问题
 */

@ParentPackage("card")
@InterceptorRefs({
	@InterceptorRef(value = "memberVerifyInterceptor"),
	@InterceptorRef(value = "cardStack")
})
public class PasswordAction extends BaseCardAction {

	private static final long serialVersionUID = 6887411316513565001L;
	
	private Member member;
	private String oldPassword;
	private String oldSafeAnswer;
	
	@Resource(name = "memberServiceImpl")
	private MemberService memberService;
	
	// 密码修改
	public String edit() {
		member = getLoginMember();
		return INPUT;
	}
	// 密码密保
	public String safe() {
		member = getLoginMember();
		return "question";
	}
	// 提现密码
	public String withdrawPwd() {
		member = getLoginMember();
		return "withdraw_pwd";
	}

	// 登陆密码更新
	@Validations(
		stringLengthFields = {
			@StringLengthFieldValidator(fieldName = "member.password", minLength = "4", maxLength = "20", message = "新登陆密码长度必须在${minLength}到${maxLength}之间!") 
		}
	)
	@InputConfig(resultName = "error")
	public String update() {
		Member persistent = getLoginMember();
		if (StringUtils.isNotEmpty(oldPassword) && StringUtils.isNotEmpty(member.getPassword())) {
			String oldPasswordMd5 = StringUtil.md5(oldPassword);
			if (!StringUtils.equals(persistent.getPassword(), oldPasswordMd5)) {
				addActionError("旧密码不正确!");
				return ERROR;
			}
			String newPasswordMd5 = StringUtil.md5(member.getPassword());
			persistent.setPassword(newPasswordMd5);
		}
		memberService.update(persistent);
		return SUCCESS;
	}
	// 提现密码更新
	@Validations(
		stringLengthFields = {
			@StringLengthFieldValidator(fieldName = "member.withdrawPwd", minLength = "4", maxLength = "20", message = "新提现密码长度必须在${minLength}到${maxLength}之间!") 
		}
	)
	@InputConfig(resultName = "error")
	public String updateWithdrawPwd() {
		Member persistent = getLoginMember();
		if (StringUtils.isNotEmpty(oldPassword) && StringUtils.isNotEmpty(member.getWithdrawPwd())) {
			String oldPasswordMd5 = StringUtil.md5(oldPassword);
			if (!StringUtils.equals(persistent.getWithdrawPwd(), oldPasswordMd5)) {
				addActionError("旧提现密码不正确!");
				return ERROR;
			}
			String newPasswordMd5 = StringUtil.md5(member.getWithdrawPwd());
			if (StringUtils.equals(persistent.getPassword(), newPasswordMd5)) {
				addActionError("提现密码不能与登录密码相同!");
				return ERROR;
			}
			persistent.setWithdrawPwd(newPasswordMd5);
		}
		if(StringUtils.isEmpty(oldPassword) && StringUtils.isEmpty(persistent.getWithdrawPwd())){
			String newPasswordMd5 = StringUtil.md5(member.getWithdrawPwd());
			if (StringUtils.equals(persistent.getPassword(), newPasswordMd5)) {
				addActionError("提现密码不能与登录密码相同!");
				return ERROR;
			}
			persistent.setWithdrawPwd(newPasswordMd5);
		}
		memberService.update(persistent);
		redirectUrl = "password!withdrawPwd.action";
		return SUCCESS;
	}
	// 密保更新
	@InputConfig(resultName = "error")
	public String updateSafeQuestion() {
		Member persistent = getLoginMember();
		if(StringUtils.isNotEmpty(persistent.getSafeQuestion())){
			if(StringUtils.equals(persistent.getSafeAnswer(),oldSafeAnswer)){
				if (StringUtils.isNotEmpty(member.getSafeQuestion()) && StringUtils.isNotEmpty(member.getSafeAnswer())) {
					persistent.setSafeQuestion(member.getSafeQuestion());
					persistent.setSafeAnswer(member.getSafeAnswer());
				}
			}else{
				addActionError("旧密保答案验证失败!");
				return ERROR;
			}
		}else{
			persistent.setSafeQuestion(member.getSafeQuestion());
			persistent.setSafeAnswer(member.getSafeAnswer());
		}
		memberService.update(persistent);
		redirectUrl = "password!safe.action";
		return SUCCESS;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}
	public String getOldSafeAnswer() {
		return oldSafeAnswer;
	}
	public void setOldSafeAnswer(String oldSafeAnswer) {
		this.oldSafeAnswer = oldSafeAnswer;
	}

}