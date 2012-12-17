package net.xxs.dao.impl;

import java.util.Set;

import net.xxs.dao.GoodsTypeDao;
import net.xxs.entity.Goods;
import net.xxs.entity.GoodsType;

import org.springframework.stereotype.Repository;

/**
 * Dao实现类 - 商品类型
 */

@Repository("goodsTypeDaoImpl")
public class GoodsTypeDaoImpl extends BaseDaoImpl<GoodsType, String> implements GoodsTypeDao {
	
	// 关联处理
	@Override
	public void delete(GoodsType goodsType) {
		Set<Goods> goodsSet = goodsType.getGoodsSet();
		int i = 0;
		for (Goods goods : goodsSet) {
			goods.setGoodsType(null);
			goods.setGoodsAttributeValueToNull();
			if(i % 20 == 0) {
				flush();
				clear();
			}
			i ++;
		}
		super.delete(goodsType);
	}

	// 关联处理
	@Override
	public void delete(String id) {
		GoodsType goodsType = super.load(id);
		this.delete(goodsType);
	}

	// 关联处理
	@Override
	public void delete(String[] ids) {
		for (String id : ids) {
			GoodsType goodsType = super.load(id);
			this.delete(goodsType);
		}
	}

}