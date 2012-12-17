package net.xxs.action.admin;

import java.math.BigDecimal;

import javax.annotation.Resource;

import net.xxs.entity.Deposit;
import net.xxs.entity.Deposit.DepositType;
import net.xxs.entity.Member;
import net.xxs.entity.Withdraw;
import net.xxs.entity.Withdraw.WithdrawStatus;
import net.xxs.service.DepositService;
import net.xxs.service.MemberService;
import net.xxs.service.WithdrawService;

import org.apache.struts2.convention.annotation.ParentPackage;

/**
 * 后台Action类 - 会员提现
 */

@ParentPackage("admin")
public class WithdrawAction extends BaseAdminAction {

	private static final long serialVersionUID = 1426838593832738550L;

	private Withdraw withdraw;
	
	@Resource(name = "withdrawServiceImpl")
	private WithdrawService withdrawService;
	@Resource(name = "memberServiceImpl")
	private MemberService memberService;
	@Resource(name = "depositServiceImpl")
	private DepositService depositService;
	
	//  提现单列表
	public String list() {
		System.out.println("zou admin list......");
		pager = withdrawService.findPager(pager);
		return LIST;
	}
	// 提现单处理
	public String process() {
		withdraw = withdrawService.load(id);
		return "process";
	}
	// 提现通过
	public String successProcess() {
		withdraw = withdrawService.load(id);
		if (withdraw.getWithdrawStatus() == WithdrawStatus.success) {
			return ajax(Status.warn, "此单已通过!");
		} else if (withdraw.getWithdrawStatus() == WithdrawStatus.lose) {
			return ajax(Status.error, "此单已作废!");
		} else {
			//修改会员预存款操作
			Member member = withdraw.getMember();
			BigDecimal newDeposit =  member.getDeposit().subtract(withdraw.getMoney());
			if(Double.parseDouble(newDeposit.toString())<0){
				return ajax(Status.error, "用户预存款余额不足，不能提现!");
			}
			member.setDeposit(newDeposit);
			memberService.update(member);
			
			Deposit deposit = new Deposit();
			deposit.setDepositType(DepositType.memberWithdraw);
			deposit.setCredit(new BigDecimal(0));
			deposit.setDebit(withdraw.getMoney());
			deposit.setLossrate(withdraw.getLossrate());//保存交易时的手续费率
			deposit.setBalance(newDeposit);
			deposit.setMember(member);
			depositService.save(deposit);
			
			withdraw.setWithdrawStatus(WithdrawStatus.success);
			withdrawService.update(withdraw);
			return ajax(Status.success, "您的操作已成功!");
		}
	}
	// 提现作废
	public String loseProcess() {
		withdraw = withdrawService.load(id);
		if (withdraw.getWithdrawStatus() == WithdrawStatus.success) {
			return ajax(Status.warn, "此单已通过!");
		} else if (withdraw.getWithdrawStatus() == WithdrawStatus.lose) {
			return ajax(Status.error, "此单已作废!");
		} else {
			withdraw.setWithdrawStatus(WithdrawStatus.lose);
			withdrawService.update(withdraw);
			return ajax(Status.success, "您的操作已成功!");
		}
	}
	public Withdraw getWithdraw() {
		return withdraw;
	}

	public void setWithdraw(Withdraw withdraw) {
		this.withdraw = withdraw;
	}
	
}