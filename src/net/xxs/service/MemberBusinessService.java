package net.xxs.service;

import net.xxs.bean.Pager;
import net.xxs.entity.MemberBusiness;
import net.xxs.entity.MemberBusiness.ResultType;

/**
 * Service接口 - 商户
 */

public interface MemberBusinessService extends BaseService<MemberBusiness, String> {
	
	public Long getUnprocessedMemberBusinessApplyCount();
	
	public Long getUnprocessedMemberBusinessCount();

	public Pager getMemberBusinessPager(ResultType resultType,Pager pager);
}