package net.xxs.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import net.xxs.bean.Pager;
import net.xxs.dao.MemberLogDao;
import net.xxs.entity.Member;
import net.xxs.entity.MemberLog;
import net.xxs.entity.Order;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

/**
 * Dao实现类 - 会员日志
 */

@Repository("memberLogDaoImpl")
public class MemberLogDaoImpl extends BaseDaoImpl<MemberLog, String> implements MemberLogDao {

	public Pager getMemberLogPager(Member member,Pager pager) {
		List <Criterion> lists = new ArrayList<Criterion>();
		if(member!=null){
			lists.add(Restrictions.eq("operator", member.getUsername()));
		}
		Criterion [] c = (Criterion []) lists.toArray(new Criterion[lists.size()]);
		return super.findPager(pager,c);
	}
}