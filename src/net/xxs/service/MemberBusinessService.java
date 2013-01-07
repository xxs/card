package net.xxs.service;

import net.xxs.entity.MemberBusiness;

/**
 * Service接口 - 商户
 */

public interface MemberBusinessService extends BaseService<MemberBusiness, String> {
	
	public Long getUnprocessedMemberBusinessApplyCount();
	
	public Long getUnprocessedMemberBusinessCount();

}