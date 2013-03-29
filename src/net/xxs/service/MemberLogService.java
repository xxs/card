package net.xxs.service;

import net.xxs.bean.Pager;
import net.xxs.entity.Member;
import net.xxs.entity.MemberLog;

/**
 * Service接口 - 会员日志
 */

public interface MemberLogService extends BaseService<MemberLog, String>{
	
	public Pager getMemberLogPager(Member member,Pager pager);
}