package net.xxs.service.impl;

import javax.annotation.Resource;

import net.xxs.dao.MemberBusinessDao;
import net.xxs.entity.MemberBusiness;
import net.xxs.service.MemberBusinessService;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Service实现类 - 商户
 */

@Service("memberBusinessServiceImpl")
public class MemberBusinessServiceImpl extends BaseServiceImpl<MemberBusiness, String> implements MemberBusinessService {
	
	@Resource(name = "memberBusinessDaoImpl")
	MemberBusinessDao memberBusinessDao;

	@Resource(name = "memberBusinessDaoImpl")
	public void setBaseDao(MemberBusinessDao memberBusinessDao) {
		super.setBaseDao(memberBusinessDao);
	}
	
	@Transactional(readOnly = true)
	public Long getUnprocessedMemberBusinessApplyCount() {
		return memberBusinessDao.getUnprocessedMemberBusinessApplyCount();
	}
	
	@Transactional(readOnly = true)
	public Long getUnprocessedMemberBusinessCount() {
		return memberBusinessDao.getUnprocessedMemberBusinessCount();
	}
}