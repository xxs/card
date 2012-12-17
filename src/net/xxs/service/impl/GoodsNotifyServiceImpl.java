package net.xxs.service.impl;

import javax.annotation.Resource;

import net.xxs.bean.Pager;
import net.xxs.dao.GoodsNotifyDao;
import net.xxs.entity.GoodsNotify;
import net.xxs.entity.Member;
import net.xxs.service.GoodsNotifyService;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Service实现类 - 到货通知
 */

@Service("goodsNotifyServiceImpl")
public class GoodsNotifyServiceImpl extends BaseServiceImpl<GoodsNotify, String> implements GoodsNotifyService {

	@Resource(name = "goodsNotifyDaoImpl")
	private GoodsNotifyDao goodsNotifyDao;

	@Resource(name = "goodsNotifyDaoImpl")
	public void setBaseDao(GoodsNotifyDao goodsNotifyDao) {
		super.setBaseDao(goodsNotifyDao);
	}
	
	@Transactional(readOnly = true)
	public Pager findPager(Member member, Pager pager) {
		return goodsNotifyDao.findPager(member, pager);
	}
	
	@Transactional(readOnly = true)
	public Long getUnprocessedGoodsNotifyCount() {
		return goodsNotifyDao.getUnprocessedGoodsNotifyCount();
	}

}