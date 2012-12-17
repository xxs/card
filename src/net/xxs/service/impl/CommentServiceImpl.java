package net.xxs.service.impl;

import java.util.List;

import javax.annotation.Resource;

import net.xxs.bean.Pager;
import net.xxs.dao.CommentDao;
import net.xxs.entity.Comment;
import net.xxs.entity.Goods;
import net.xxs.service.CommentService;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Service实现类 - 评论
 */

@Service("commentServiceImpl")
public class CommentServiceImpl extends BaseServiceImpl<Comment, String> implements CommentService {
	
	@Resource(name = "commentDaoImpl")
	private CommentDao commentDao;
	
	@Resource(name = "commentDaoImpl")
	public void setBaseDao(CommentDao commentDao) {
		super.setBaseDao(commentDao);
	}
	
	@Transactional(readOnly = true)
	public Pager getCommentPager(Pager pager) {
		return commentDao.getCommentPager(pager);
	}
	
	@Transactional(readOnly = true)
	public Pager getCommentPager(Pager pager, Goods goods) {
		return commentDao.getCommentPager(pager, goods);
	}
	
	@Transactional(readOnly = true)
	public List<Comment> getCommentList(Goods goods, Integer maxResults) {
		return commentDao.getCommentList(goods, maxResults);
	}

}