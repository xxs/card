package net.xxs.service;

import java.util.List;

import net.xxs.entity.Cards;
import net.xxs.entity.CardsCategory;

/**
 * Service接口 - 充值卡分类
 */

public interface CardsCategoryService extends BaseService<CardsCategory, String> {
	
	/**
	 * 判断标识是否存在（不区分大小写）
	 * 
	 * @param sign
	 *            标识
	 * 
	 */
	public boolean isExistBySign(String sign);
	
	/**
	 * 判断标识是否唯一（不区分大小写）
	 * 
	 * @param sign
	 *            旧标识
	 *            
	 * @param newSign
	 *            新标识
	 * 
	 */
	public boolean isUniqueBySign(String oldSign, String newSign);
	
	/**
	 * 根据标识获取CardsCategory对象
	 * 
	 * @param sign
	 *            sign
	 * 
	 */
	public CardsCategory getCardsCategoryBySign(String sign);
	
	/**
	 * 获取充值卡分类树集合
	 * 
	 * @return 充值卡分类树集合
	 * 
	 */
	public List<CardsCategory> getCardsCategoryTree();
	
	/**
	 * 获取充值卡分类树集合;
	 * 
	 * @return 充值卡分类树集合
	 * 
	 */
	public List<CardsCategory> getCardsCategoryTreeList();
	
	/**
	 * 获取顶级充值卡分类集合
	 * 
	 * @param maxResults
	 *            最大结果数,null表示无限制
	 * 
	 * @return 顶级充值卡分类集合
	 * 
	 */
	public List<CardsCategory> getRootCardsCategoryList(Integer maxResults);
	
	/**
	 * 根据CardsCategory对象获取所有子类集合,若无子类则返回null
	 * 
	 * @param cardsCategory
	 *            cardsCategory
	 *            
	 * @param isContainChildren
	 *            是否包含所有子分类
	 * 
	 * @param maxResults
	 *            最大结果数,null表示无限制
	 * 
	 * @return 子类集合
	 * 
	 */
	public List<CardsCategory> getChildrenCardsCategoryList(CardsCategory cardsCategory, boolean isContainChildren, Integer maxResults);
	
	/**
	 * 根据CardsCategory对象获取所有父类集合,若无父类则返回null
	 * 
	 * @param cardsCategory
	 *            cardsCategory
	 *            
	 * @param isContainParent
	 *            是否包含所有父分类
	 * 
	 * @param maxResults
	 *            最大结果数,null表示无限制
	 * 
	 * @return 父类集合
	 * 
	 */
	public List<CardsCategory> getParentCardsCategoryList(CardsCategory cardsCategory, boolean isContainParent, Integer maxResults);
	
	/**
	 * 根据Cards对象获取所有父类集合,若无父类则返回null
	 * 
	 * @param cards
	 *            cards
	 *            
	 * @param isContainParent
	 *            是否包含所有父分类
	 * 
	 * @param maxResults
	 *            最大结果数,null表示无限制
	 * 
	 * @return 父类集合
	 * 
	 */
	public List<CardsCategory> getParentCardsCategoryList(Cards cards, boolean isContainParent, Integer maxResults);
	
	/**
	 * 根据CardsCategory对象获取路径集合
	 * 
	 * @param cardsCategory
	 *            cardsCategory
	 * 
	 * @return CardsCategory路径集合
	 * 
	 */
	public List<CardsCategory> getCardsCategoryPathList(CardsCategory cardsCategory);
	
}