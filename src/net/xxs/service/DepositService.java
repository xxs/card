package net.xxs.service;

import net.xxs.bean.Pager;
import net.xxs.entity.Deposit;
import net.xxs.entity.Member;

/**
 * Service接口 - 预存款记录
 */

public interface DepositService extends BaseService<Deposit, String> {
	
	
	/**
	 * 根据Member、Pager获取充值记录分页对象
	 * 
	 * @param member
	 *            Member对象
	 *            
	 * @param pager
	 *            Pager对象
	 *            
	 * @return 充值记录分页对象
	 */
	public Pager getDepositPager(Member member, Pager pager);
	
}