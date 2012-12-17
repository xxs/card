package net.xxs.action.shop;

import net.xxs.entity.Member;

import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.ParentPackage;

/**
 * 前台Action类 - 推广链接
 */

@ParentPackage("shop")
@InterceptorRefs({
	@InterceptorRef(value = "memberVerifyInterceptor"),
	@InterceptorRef(value = "shopStack")
})
public class PromotionAction extends BaseShopAction {

	private static final long serialVersionUID = -26661865759574779L;
	
	private Member member;
	
	// 推广链接页面
	public String execute() throws Exception {
		System.out.println("跳转推广链接页面");
		member = getLoginMember();
		return "link";
	}
	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

}