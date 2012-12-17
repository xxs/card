package net.xxs.service.impl;

import javax.annotation.Resource;

import net.xxs.dao.ReceiverDao;
import net.xxs.entity.Receiver;
import net.xxs.service.ReceiverService;

import org.springframework.stereotype.Service;

/**
 * Service实现类 - 收货地址
 */

@Service("receiverServiceImpl")
public class ReceiverServiceImpl extends BaseServiceImpl<Receiver, String> implements ReceiverService {

	@Resource(name = "receiverDaoImpl")
	public void setBaseDao(ReceiverDao receiverDao) {
		super.setBaseDao(receiverDao);
	}

}