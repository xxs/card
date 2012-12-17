package net.xxs.service;

import java.util.List;

import net.xxs.bean.Pager;
import net.xxs.entity.Comment;
import net.xxs.entity.Goods;

/**
 * Service接口 - 评论
 */

public interface CommentService extends BaseService<Comment, String> {
	
	/**
	 * 根据Pager获取评论分页对象（包含isShow = true的对象,不包含回复）
	 *            
	 * @param pager
	 *            Pager对象
	 *            
	 * @return 评论分页对象
	 */
	public Pager getCommentPager(Pager pager);
	
	/**
	 * 根据商品、pager获取评论集合,若无评论则返回null（只包含isShow = true的对象,不包含回复）
	 * 
	 * @param goods
	 *            商品
	 * 
	 * @param pager
	 *            pger
	 * 
	 * @return 评论集合
	 * 
	 */
	public Pager getCommentPager(Pager pager, Goods goods);
	
	/**
	 * 根据商品、最大结果数获取评论集合,若无评论则返回null（只包含isShow = true的对象）
	 * 
	 * @param goods
	 *            商品,null表示无限制
	 * 
	 * @param maxResults
	 *            最大结果数,null表示无限制
	 * 
	 * @return 评论集合
	 * 
	 */
	public List<Comment> getCommentList(Goods goods, Integer maxResults);
	
}