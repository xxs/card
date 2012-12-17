package net.xxs.dao.impl;

import net.xxs.bean.Pager;
import net.xxs.dao.DepositDao;
import net.xxs.entity.Deposit;
import net.xxs.entity.Member;

import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

/**
 * Dao实现类 - 预存款记录
 */

@Repository("depositDaoImpl")
public class DepositDaoImpl extends BaseDaoImpl<Deposit, String> implements DepositDao {

	public Pager getDepositPager(Member member, Pager pager) {
		return super.findPager(pager, Restrictions.eq("member", member));
	}
	
}