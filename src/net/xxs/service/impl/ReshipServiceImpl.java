package net.xxs.service.impl;

import javax.annotation.Resource;

import net.xxs.dao.ReshipDao;
import net.xxs.entity.Reship;
import net.xxs.service.ReshipService;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Service实现类 - 退货
 */

@Service("reshipServiceImpl")
public class ReshipServiceImpl extends BaseServiceImpl<Reship, String> implements ReshipService {
	
	@Resource(name = "reshipDaoImpl")
	private ReshipDao reshipDao;

	@Resource(name = "reshipDaoImpl")
	public void setBaseDao(ReshipDao reshipDao) {
		super.setBaseDao(reshipDao);
	}
	
	@Transactional(readOnly = true)
	public String getLastReshipSn() {
		return reshipDao.getLastReshipSn();
	}

}