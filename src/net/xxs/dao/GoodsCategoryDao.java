package net.xxs.dao;

import java.util.List;

import net.xxs.entity.GoodsCategory;

/**
 * Dao接口 - 商品分类
 */

public interface GoodsCategoryDao extends BaseDao<GoodsCategory, String> {
	
	/**
	 * 判断标识是否存在（不区分大小写）
	 * 
	 * @param sign
	 *            标识
	 * 
	 */
	public boolean isExistBySign(String sign);
	
	/**
	 * 根据标识获取文章分类
	 * 
	 * @param sign
	 *            标识
	 * 
	 */
	public GoodsCategory getGoodsCategoryBySign(String sign);
	
	/**
	 * 获取商品分类树集合
	 * 
	 * @return 商品分类树集合
	 * 
	 */
	public List<GoodsCategory> getGoodsCategoryTree();
	
	/**
	 * 获取顶级商品分类集合
	 * 
	 * @param maxResults
	 *            最大结果数,null表示无限制
	 * 
	 * @return 顶级商品分类集合
	 * 
	 */
	public List<GoodsCategory> getRootGoodsCategoryList(Integer maxResults);
	
	/**
	 * 根据GoodsCategory对象获取所有父类集合,若无父类则返回null
	 * 
	 * @param goodsCategory
	 *            goodsCategory
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
	public List<GoodsCategory> getParentGoodsCategoryList(GoodsCategory goodsCategory, boolean isContainParent, Integer maxResults);
	
	/**
	 * 根据GoodsCategory对象获取所有子类集合,若无子类则返回null
	 * 
	 * @param goodsCategory
	 *            goodsCategory
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
	public List<GoodsCategory> getChildrenGoodsCategoryList(GoodsCategory goodsCategory, boolean isContainChildren, Integer maxResults);
	
}