package net.xxs.service;

import net.xxs.entity.Brand;
import net.xxs.entity.Member;
import net.xxs.entity.MemberDiscount;

/**
 * Service接口 - 会员银行卡
 */

public interface MemberDiscountService extends BaseService<MemberDiscount, String> {
	/**
	 * 判断会员的此品牌是否存在
	 * 
	 */
	public boolean isExistDiscount(Member member,Brand brand);
	
	/**
	 * 判断会员的此品牌是否存在
	 * 
	 */
	public MemberDiscount getDiscountByMemberAndBrand(Member member,Brand brand);
}