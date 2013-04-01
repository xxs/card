package net.xxs.dao.impl;

import net.xxs.dao.MemberDiscountDao;
import net.xxs.entity.Brand;
import net.xxs.entity.Member;
import net.xxs.entity.MemberDiscount;

import org.springframework.stereotype.Repository;


/**
 * Dao实现类 - 会员私有折扣率
 */

@Repository("memberDiscountDaoImpl")
public class MemberDiscountDaoImpl extends BaseDaoImpl<MemberDiscount, String> implements MemberDiscountDao {

	public MemberDiscount getDiscountByMemberAndBrand(Member member, Brand brand) {
		String hql = "from MemberDiscount as memberDiscount where memberDiscount.member = :member and memberDiscount.brand = :brand";
		return (MemberDiscount) getSession().createQuery(hql).setParameter("name", member).setParameter("brand", brand).uniqueResult();
	}
}