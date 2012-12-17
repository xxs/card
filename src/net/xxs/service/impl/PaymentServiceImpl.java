package net.xxs.service.impl;

import javax.annotation.Resource;

import net.xxs.dao.PaymentDao;
import net.xxs.entity.Payment;
import net.xxs.service.PaymentService;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Service实现类 - 支付
 */

@Service("paymentServiceImpl")
public class PaymentServiceImpl extends BaseServiceImpl<Payment, String> implements PaymentService {
	
	@Resource(name = "paymentDaoImpl")
	private PaymentDao paymentDao;

	@Resource(name = "paymentDaoImpl")
	public void setBaseDao(PaymentDao paymentDao) {
		super.setBaseDao(paymentDao);
	}
	
	@Transactional(readOnly = true)
	public String getLastPaymentSn() {
		return paymentDao.getLastPaymentSn();
	}
	
	@Transactional(readOnly = true)
	public Payment getPaymentByPaymentSn(String paymentSn) {
		return paymentDao.getPaymentByPaymentSn(paymentSn);
	}

}