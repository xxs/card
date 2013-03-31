package net.xxs.service.impl;

import javax.annotation.Resource;

import net.xxs.dao.MemberDiscountDao;
import net.xxs.entity.MemberDiscount;
import net.xxs.service.MemberDiscountService;

import org.springframework.stereotype.Service;

/**
 * Service实现类 - 会员私有折扣率
 */

@Service("memberDiscountServiceImpl")
public class MemberDiscountServiceImpl extends BaseServiceImpl<MemberDiscount, String> implements MemberDiscountService {
	
	@Resource(name = "memberDiscountDaoImpl")
	MemberDiscountDao memberDiscountDao;

	@Resource(name = "memberDiscountDaoImpl")
	public void setBaseDao(MemberDiscountDao memberDiscountDao) {
		super.setBaseDao(memberDiscountDao);
	}

}