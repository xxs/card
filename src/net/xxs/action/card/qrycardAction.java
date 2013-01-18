package net.xxs.action.card;

import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.ParentPackage;

/**
 * 前台Action类 - api远程卖卡接口
 */

@ParentPackage("api")
@InterceptorRefs({
	@InterceptorRef(value = "memberVerifyInterceptor"),
	@InterceptorRef(value = "cardStack")
})
public class qrycardAction extends BaseCardAction {

	private static final long serialVersionUID = -7516107723213363852L;

}