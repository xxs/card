package net.xxs.dao;

import net.xxs.bean.Pager;
import net.xxs.entity.LeaveMessage;

/**
 * Dao接口 - 在线留言
 */

public interface LeaveMessageDao extends BaseDao<LeaveMessage, String> {
	
	/**
	 * 根据Pager获取在线留言分页对象（不包含回复）
	 *            
	 * @param pager
	 *            Pager对象
	 * 
	 * @param isContainUnReply
	 *            是否包含未回复在线留言
	 *            
	 * @return 在线留言分页对象
	 */
	public Pager getLeaveMessagePager(Pager pager, boolean isContainUnReply);
	
}