package net.xxs.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import net.xxs.bean.Pager;
import net.xxs.entity.Brand;
import net.xxs.entity.Cards;
import net.xxs.entity.CardsAttribute;
import net.xxs.entity.CardsCategory;
import net.xxs.entity.Member;

/**
 * Service接口 - 充值卡
 */

public interface CardsService extends BaseService<Cards, String> {
	
	/**
	 * 判断充值卡编号是否存在（不区分大小写）
	 * 
	 * @param cardsSn
	 *            充值卡编号
	 */
	public boolean isExistByCardsSn(String cardsSn);
	
	/**
	 * 判断充值卡编号是否唯一（不区分大小写）
	 * 
	 * @param oldCardsSn
	 *            旧充值卡编号
	 *            
	 * @param newCardsSn
	 *            新充值卡编号
	 * 
	 */
	public boolean isUniqueByCardsSn(String oldCardsSn, String newCardsSn);
	
	/**
	 * 根据充值卡分类、充值卡类型、是否包含子分类充值卡、最大结果数获取充值卡集合（只包含isMarketable=true的对象）
	 * 
	 * @param cardsCategory
	 *            充值卡分类,null表示无限制
	 *            
	 * @param type
	 *            充值卡类型,null表示无限制
	 *            
	 * @param isContainChildren
	 *            是否包含子分类充值卡
	 * 
	 * @param maxResults
	 *            最大结果数,null表示无限制
	 * 
	 * @return 此分类下的充值卡集合
	 */
	public List<Cards> getCardsList(CardsCategory cardsCategory, String type, boolean isContainChildren, Integer maxResults);
	
	/**
	 * 根据充值卡分类、起始日期、结束日期、起始结果数、最大结果数获取充值卡集合（只包含isMarketable=true的对象,包含子分类充值卡）
	 * 
	 * @param cardsCategory
	 *            充值卡分类,null表示无限制
	 *            
	 * @param beginDate
	 *            起始日期,null表示无限制
	 *            
	 * @param endDate
	 *            结束日期,null表示无限制
	 *            
	 * @param firstResult
	 *            起始结果数,null表示无限制
	 *            
	 * @param maxResults
	 *            最大结果数,null表示无限制
	 * 
	 * @return 此分类下的所有充值卡集合
	 */
	public List<Cards> getCardsList(CardsCategory cardsCategory, Date beginDate, Date endDate, Integer firstResult, Integer maxResults);
	
	/**
	 * 根据充值卡分类和Pager对象,获取此分类下的充值卡分页对象（只包含isMarketable=true的对象,包含子分类充值卡）
	 * 
	 * @param cardsCategory
	 *            充值卡分类
	 *            
	 * @param pager
	 *            分页对象
	 * 
	 * @return Pager
	 */
	public Pager getCardsPager(CardsCategory cardsCategory, Pager pager);
	
	/**
	 * 根据充值卡分类、充值卡品牌、充值卡属性Map、Pager,获取此分类下的充值卡分页对象（只包含isMarketable=true的对象,包含子分类充值卡）
	 * 
	 * @param cardsCategory
	 *            充值卡分类,null表示无限制
	 *            
	 * @param brand
	 *            充值卡品牌,null表示无限制
	 *    
	 * @param cardsAttributeMap
	 *            充值卡属性Map,null表示无限制
	 *            
	 * @param pager
	 *            分页对象
	 * 
	 * @return Pager
	 */
	public Pager getCardsPager(CardsCategory cardsCategory, Brand brand, Map<CardsAttribute, String> cardsAttributeMap, Pager pager);
	
	/**
	 * 根据分页对象搜索文章
	 * 
	 * @param pager
	 *            分页对象
	 * 
	 * @return 分页对象
	 */
	public Pager search(Pager pager);
	
	/**
	 * 根据Member、Pager获取收藏充值卡分页对象
	 * 
	 * @param member
	 *            Member对象
	 *            
	 * @return 收藏充值卡分页对象
	 */
	public Pager getFavoriteCardsPager(Member member, Pager pager);
	
	/**
	 * 获取已上架充值卡数
	 *            
	 * @return 已上架充值卡数
	 */
	public Long getMarketableCardsCount();
	
	/**
	 * 获取已下架充值卡数
	 *            
	 * @return 已下架充值卡数
	 */
	public Long getUnMarketableCardsCount();

}