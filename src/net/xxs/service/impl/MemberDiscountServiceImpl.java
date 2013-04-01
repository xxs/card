package net.xxs.service.impl;

import javax.annotation.Resource;

import net.xxs.dao.MemberDiscountDao;
import net.xxs.entity.Brand;
import net.xxs.entity.Member;
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

	public boolean isExistDiscount(Member member, Brand brand) {
		MemberDiscount memberDiscount= memberDiscountDao.getDiscountByMemberAndBrand(member, brand);
		if (memberDiscount != null) {
			return true;
		} else {
			return false;
		}
	}

	public MemberDiscount getDiscountByMemberAndBrand(Member member, Brand brand) {
		return memberDiscountDao.getDiscountByMemberAndBrand(member, brand);
	}
}