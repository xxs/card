package net.xxs.dao;

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
 * Dao接口 - 商品
 */

public interface CardsDao extends BaseDao<Cards, String> {
	
	/**
	 * 判断商品编号是否存在（不区分大小写）
	 * 
	 * @param cardsSn
	 *            商品编号
	 */
	public boolean isExistByCardsSn(String cardsSn);
	
	/**
	 * 根据商品分类、商品类型、是否包含子分类商品、最大结果数获取商品集合（只包含isMarketable=true的对象）
	 * 
	 * @param cardsCategory
	 *            商品分类,null表示无限制
	 *            
	 * @param type
	 *            商品类型,null表示无限制
	 *            
	 * @param isContainChildren
	 *            是否包含子分类商品
	 * 
	 * @param maxResults
	 *            最大结果数,null表示无限制
	 * 
	 * @return 此分类下的商品集合
	 */
	public List<Cards> getCardsList(CardsCategory cardsCategory, String type, boolean isContainChildren, Integer maxResults);
	
	/**
	 * 根据商品分类、起始日期、结束日期、起始结果数、最大结果数获取商品集合（只包含isMarketable=true的对象,包含子分类商品）
	 * 
	 * @param cardsCategory
	 *            商品分类,null表示无限制
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
	 * @return 此分类下的所有商品集合
	 */
	public List<Cards> getCardsList(CardsCategory cardsCategory, Date beginDate, Date endDate, Integer firstResult, Integer maxResults);
	
	/**
	 * 根据CardsCategory和Pager对象,获取此分类下的商品分页对象（只包含isMarketable=true的对象,包含子分类商品）
	 * 
	 * @param cardsCategory
	 *            商品分类
	 *            
	 * @param pager
	 *            分页对象
	 * 
	 * @return Pager
	 */
	public Pager getCardsPager(CardsCategory cardsCategory, Pager pager);
	
	/**
	 * 根据商品分类、商品品牌、商品属性Map、Pager,获取此分类下的商品分页对象（只包含isMarketable=true的对象,包含子分类商品）
	 * 
	 * @param cardsCategory
	 *            商品分类,null表示无限制
	 *            
	 * @param brand
	 *            商品品牌,null表示无限制
	 *    
	 * @param cardsAttributeMap
	 *            商品属性Map,null表示无限制
	 *            
	 * @param pager
	 *            分页对象
	 * 
	 * @return Pager
	 */
	public Pager getCardsPager(CardsCategory cardsCategory, Brand brand, Map<CardsAttribute, String> cardsAttributeMap, Pager pager);
	
	/**
	 * 根据Member、Pager获取收藏商品分页对象
	 * 
	 * @param member
	 *            Member对象
	 *            
	 * @return 收藏商品分页对象
	 */
	public Pager getFavoriteCardsPager(Member member, Pager pager);
	
	/**
	 * 获取已上架商品数
	 *            
	 * @return 已上架商品数
	 */
	public Long getMarketableCardsCount();
	
	/**
	 * 获取已下架商品数
	 *            
	 * @return 已下架商品数
	 */
	public Long getUnMarketableCardsCount();

}