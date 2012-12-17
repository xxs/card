package net.xxs.dao.impl;

import java.util.Set;

import net.xxs.dao.BrandDao;
import net.xxs.entity.Brand;
import net.xxs.entity.Goods;
import net.xxs.entity.GoodsType;

import org.springframework.stereotype.Repository;

/**
 * Dao实现类 - 品牌
 */

@Repository("brandDaoImpl")
public class BrandDaoImpl extends BaseDaoImpl<Brand, String> implements BrandDao {
	
	// 关联处理
	@Override
	public void delete(Brand brand) {
		Set<Goods> goodsSet = brand.getGoodsSet();
		if (goodsSet != null) {
			for (Goods goods : goodsSet) {
				goods.setBrand(null);
			}
		}
		
		Set<GoodsType> goodsTypeSet = brand.getGoodsTypeSet();
		if (goodsTypeSet != null) {
			for (GoodsType goodsType : goodsTypeSet) {
				goodsType.getBrandSet().remove(brand);
			}
		}
		
		super.delete(brand);
	}

	// 关联处理
	@Override
	public void delete(String id) {
		Brand brand = load(id);
		this.delete(brand);
	}

	// 关联处理
	@Override
	public void delete(String[] ids) {
		for (String id : ids) {
			Brand brand = load(id);
			this.delete(brand);
		}
	}
	
}