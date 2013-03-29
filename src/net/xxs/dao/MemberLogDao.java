package net.xxs.dao;

import net.xxs.bean.Pager;
import net.xxs.entity.Member;
import net.xxs.entity.MemberLog;

/**
 * Dao接口 - 会员日志
 */

public interface MemberLogDao extends BaseDao<MemberLog, String> {

	public Pager getMemberLogPager(Member member,Pager pager);
}
