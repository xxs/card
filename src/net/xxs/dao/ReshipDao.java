package net.xxs.dao;

import net.xxs.entity.Reship;

/**
 * Dao接口 - 退货
 */

public interface ReshipDao extends BaseDao<Reship, String> {
	
	/**
	 * 获取最后生成的退货编号
	 * 
	 * @return 退货编号
	 */
	public String getLastReshipSn();

}