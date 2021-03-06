package net.xxs.service.impl;

import javax.annotation.Resource;

import net.xxs.bean.Pager;
import net.xxs.dao.MemberLogDao;
import net.xxs.dao.MemberRankDao;
import net.xxs.entity.Member;
import net.xxs.entity.MemberLog;
import net.xxs.service.MemberLogService;

import org.springframework.stereotype.Service;

/**
 * Service实现类 - 日志
 */

@Service("memberLogServiceImpl")
public class MemberLogServiceImpl extends BaseServiceImpl<MemberLog, String> implements MemberLogService {

	@Resource(name = "memberLogDaoImpl")
	MemberLogDao memberLogDao;
	
	@Resource(name = "memberLogDaoImpl")
	public void setBaseDao(MemberLogDao memberLogDao) {
		super.setBaseDao(memberLogDao);
	}

	public Pager getMemberLogPager(Member member, Pager pager) {
		return memberLogDao.getMemberLogPager(member, pager);
	}

}