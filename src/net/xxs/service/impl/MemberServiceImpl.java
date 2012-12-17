package net.xxs.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import net.xxs.dao.MemberDao;
import net.xxs.dao.OrderDao;
import net.xxs.entity.Goods;
import net.xxs.entity.Member;
import net.xxs.entity.Order;
import net.xxs.entity.Order.OrderStatus;
import net.xxs.service.MemberService;
import net.xxs.util.CommonUtil;
import net.xxs.util.StringUtil;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Service实现类 - 会员
 */

@Service("memberServiceImpl")
public class MemberServiceImpl extends BaseServiceImpl<Member, String> implements MemberService {

	@Resource(name = "memberDaoImpl")
	private MemberDao memberDao;
	@Resource(name = "orderDaoImpl")
	private OrderDao orderDao;

	@Resource(name = "memberDaoImpl")
	public void setBaseDao(MemberDao memberDao) {
		super.setBaseDao(memberDao);
	}
	
	@Transactional(readOnly = true)
	public boolean isExistByUsername(String username) {
		return memberDao.isExistByUsername(username);
	}
	@Transactional(readOnly = true)
	public boolean isExistByReferrer(String referrer) {
		return memberDao.isExistByReferrer(referrer);
	}
	@Transactional(readOnly = true)
	public Member getMemberByUsername(String username) {
		return memberDao.getMemberByUsername(username);
	}
	
	public boolean verifyMember(String username, String password) {
		Member member = getMemberByUsername(username);
		if (member != null && member.getPassword().equals(StringUtil.md5(password))) {
			return true;
		} else {
			return false;
		}
	}
	
	public String buildPasswordRecoverKey() {
		return System.currentTimeMillis() + Member.PASSWORD_RECOVER_KEY_SEPARATOR + CommonUtil.getUUID() + StringUtil.md5(String.valueOf(Math.random() * 1000000000));
	}
	
	public Date getPasswordRecoverKeyBuildDate(String passwordRecoverKey) {
		long time = Long.valueOf(StringUtils.substringBefore(passwordRecoverKey, Member.PASSWORD_RECOVER_KEY_SEPARATOR));
		return new Date(time);
	}
	
	@Transactional(readOnly = true)
	public boolean isPurchased(Member member, Goods goods) {
		List<Order> orderList = orderDao.getOrderList(member, OrderStatus.completed);
		for (Order order : orderList) {
			List<String> goodsIdList = order.getGoodsIdList();
			if (goodsIdList != null) {
				for (String goodsId : goodsIdList) {
					if (StringUtils.equals(goods.getId(), goodsId)) {
						return true;
					}
				}
			}
			
		}
		return false;
	}

}