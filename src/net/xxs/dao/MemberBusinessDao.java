package net.xxs.dao;

import net.xxs.entity.MemberBusiness;

/**
 * Dao接口 - 商户
 */

public interface MemberBusinessDao extends BaseDao<MemberBusiness, String> {
	
	public Long getUnprocessedMemberBusinessApplyCount();
	
	public Long getUnprocessedMemberBusinessCount();
}