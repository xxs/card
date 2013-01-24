package net.xxs.action.api;

import net.xxs.action.card.BaseCardAction;

import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.ParentPackage;

/**
 * 前台Action类 - api远程查询接口
 */

@ParentPackage("api")
@InterceptorRefs({
	@InterceptorRef(value = "apiStack")
})
public class regcardAction extends BaseCardAction {

	private static final long serialVersionUID = 6232859913698282083L;

	public String execute() throws Exception {
		System.out.println("执行了销卡操作");
		return null;
	}

}