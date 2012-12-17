package net.xxs.action.shop;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;

import net.xxs.entity.Withdraw;
import net.xxs.entity.Withdraw.WithdrawStatus;
import net.xxs.service.WithdrawService;
import net.xxs.util.SerialNumberUtil;

import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.opensymphony.xwork2.interceptor.annotations.InputConfig;

/**
 * 前台Action类 - 会员提现
 */

@ParentPackage("shop")
@InterceptorRefs({
	@InterceptorRef(value = "memberVerifyInterceptor"),
	@InterceptorRef(value = "shopStack")
})
public class WithdrawAction extends BaseShopAction {

	private static final long serialVersionUID = 7391785904288731356L;
	private Withdraw withdraw;
	private List<Withdraw> withdrawList;
	
	@Resource(name = "withdrawServiceImpl")
	private WithdrawService withdrawService;
	
	// 预存款列表
	public String list() {
		System.out.println("zou list......");
		pager = withdrawService.getWithdeawPager(getLoginMember(), pager);
		withdrawList = withdrawService.getApplyWithdrawList(getLoginMember());
		System.out.println(withdrawList.size());
		return LIST;
	}
	
	// 保存
	@InputConfig(resultName = "error")
	public String save() {
		withdrawList = withdrawService.getApplyWithdrawList(getLoginMember());
		if(null != withdrawList&&withdrawList.size()>0){
			addActionError("已有提现单在申请中！请等待管理员审核后再增加新提现！");
			return ERROR;
		}
//		if (StringUtils.isEmpty(withdraw.getPhone()) && StringUtils.isEmpty(receiver.getMobile())) {
//			addActionError("联系电话、联系手机必须填写其中一项!");
//			return ERROR;
//		}
//		Member loginMember = getLoginMember();
//		Set<Receiver> receiverSet = loginMember.getReceiverSet();
//		if (receiverSet != null && Receiver.MAX_RECEIVER_COUNT != null && receiverSet.size() >= Receiver.MAX_RECEIVER_COUNT) {
//			addActionError("只允许添加最多" + Receiver.MAX_RECEIVER_COUNT + "项收货地址!");
//			return ERROR;
//		}
//		Area area = areaService.get(areaId);
//		if (area == null) {
//			addActionError("请选择收货地址!");
//			return ERROR;
//		}
		withdraw.setWithdrawSn(SerialNumberUtil.buildWithdrawSn());
		withdraw.setMoney(withdraw.getMoney());
		withdraw.setTotalMoney(withdraw.getMoney().multiply(BigDecimal.valueOf(getLoginMember().getMemberRank().getLossrate())));
		withdraw.setMessage("会员自主提现");
		withdraw.setRememo(null);
		withdraw.setWithdrawStatus(WithdrawStatus.apply);
		withdraw.setLossrate(BigDecimal.valueOf(getLoginMember().getMemberRank().getLossrate()));
		withdraw.setMember(getLoginMember());
		withdraw.setMemo(withdraw.getMemo());
		withdrawService.save(withdraw);
		redirectUrl = "withdraw!list.action";
		return SUCCESS;
	}

	public Withdraw getWithdraw() {
		return withdraw;
	}

	public void setWithdraw(Withdraw withdraw) {
		this.withdraw = withdraw;
	}

	public List<Withdraw> getWithdrawList() {
		return withdrawList;
	}

	public void setWithdrawList(List<Withdraw> withdrawList) {
		this.withdrawList = withdrawList;
	}
}