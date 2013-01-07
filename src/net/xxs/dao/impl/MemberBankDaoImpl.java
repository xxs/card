package net.xxs.dao.impl;

import java.util.List;

import net.xxs.dao.MemberBankDao;
import net.xxs.entity.MemberBank;

import org.springframework.stereotype.Repository;


/**
 * Dao实现类 - 会员银行卡信息
 */

@Repository("memberBankDaoImpl")
public class MemberBankDaoImpl extends BaseDaoImpl<MemberBank, String> implements MemberBankDao {
	
	// 保存时若对象isDefault=true,则设置其它对象isDefault值为false
	@Override
	@SuppressWarnings("unchecked")
	public String save(MemberBank memberBank) {
		if (memberBank.getIsDefault()) {
			String hql = "from MemberBank as memberBank where memberBank.isDefault = :isDefault";
			List<MemberBank> memberBankList = getSession().createQuery(hql).setParameter("isDefault", true).list();
			if (memberBankList != null) {
				for (MemberBank r : memberBankList) {
					r.setIsDefault(false);
				}
			}
		}
		return super.save(memberBank);
	}

	// 更新时若对象isDefault=true,则设置其它对象isDefault值为false
	@Override
	@SuppressWarnings("unchecked")
	public void update(MemberBank memberBank) {
		if (memberBank.getIsDefault()) {
			String hql = "from MemberBank as memberBank where memberBank.isDefault = :isDefault and memberBank != :memberBank";
			List<MemberBank> memberBankList = getSession().createQuery(hql).setParameter("isDefault", true).setParameter("memberBank", memberBank).list();
			if (memberBankList != null) {
				for (MemberBank r : memberBankList) {
					r.setIsDefault(false);
				}
			}
		}
		super.update(memberBank);
	}

}