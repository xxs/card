package net.xxs.dao.impl;

import net.xxs.dao.MemberDiscountDao;
import net.xxs.entity.MemberDiscount;

import org.springframework.stereotype.Repository;


/**
 * Dao实现类 - 会员私有折扣率
 */

@Repository("memberDiscountDaoImpl")
public class MemberDiscountDaoImpl extends BaseDaoImpl<MemberDiscount, String> implements MemberDiscountDao {
	
}