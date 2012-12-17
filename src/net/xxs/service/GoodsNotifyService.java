package net.xxs.service;

import net.xxs.bean.Pager;
import net.xxs.entity.GoodsNotify;
import net.xxs.entity.Member;

/**
 * Service接口 - 到货通知
 */

public interface GoodsNotifyService extends BaseService<GoodsNotify, String> {

	/**
	 * 根据Member、Pager获取到货通知分页对象
	 * 
	 * @param member
	 *            Member对象
	 *            
	 * @return 到货通知分页对象
	 */
	public Pager findPager(Member member, Pager pager);
	
	/**
	 * 获取未处理缺货登记数
	 *            
	 * @return 未处理缺货登记数
	 */
	public Long getUnprocessedGoodsNotifyCount();
	
}