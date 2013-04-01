package net.xxs.dao;

import net.xxs.entity.Brand;
import net.xxs.entity.Member;
import net.xxs.entity.MemberDiscount;

/**
 * Dao接口 - 会员银行卡
 */

public interface MemberDiscountDao extends BaseDao<MemberDiscount, String> {
	/**
	 * 判断会员的此品牌是否存在
	 * 
	 */
	public MemberDiscount getDiscountByMemberAndBrand(Member member,Brand brand);
}