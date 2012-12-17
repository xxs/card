package net.xxs.dao.impl;

import java.util.List;

import net.xxs.dao.ReshipDao;
import net.xxs.entity.Reship;

import org.springframework.stereotype.Repository;

/**
 * Dao实现类 - 退货
 */

@Repository("reshipDaoImpl")
public class ReshipDaoImpl extends BaseDaoImpl<Reship, String> implements ReshipDao {
	
	@SuppressWarnings("unchecked")
	public String getLastReshipSn() {
		String hql = "from Reship as reship order by reship.createDate desc";
		List<Reship> reshipList =  getSession().createQuery(hql).setFirstResult(0).setMaxResults(1).list();
		if (reshipList != null && reshipList.size() > 0) {
			return reshipList.get(0).getReshipSn();
		} else {
			return null;
		}
	}

}