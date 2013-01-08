package net.xxs.dao;

import net.xxs.bean.Pager;
import net.xxs.entity.MemberBusiness;
import net.xxs.entity.MemberBusiness.ResultType;

/**
 * Dao接口 - 商户
 */

public interface MemberBusinessDao extends BaseDao<MemberBusiness, String> {
	
	public Long getUnprocessedMemberBusinessApplyCount();
	
	public Long getUnprocessedMemberBusinessCount();
	
	public Pager getMemberBusinessPager(ResultType resultType,Pager pager);
}