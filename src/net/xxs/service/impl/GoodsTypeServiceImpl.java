package net.xxs.service.impl;

import javax.annotation.Resource;

import net.xxs.dao.GoodsTypeDao;
import net.xxs.entity.GoodsType;
import net.xxs.service.GoodsTypeService;

import org.springframework.stereotype.Service;

/**
 * Service实现类 - 商品类型
 */

@Service("goodsTypeServiceImpl")
public class GoodsTypeServiceImpl extends BaseServiceImpl<GoodsType, String> implements GoodsTypeService {

	@Resource(name = "goodsTypeDaoImpl")
	public void setBaseDao(GoodsTypeDao goodsTypeDao) {
		super.setBaseDao(goodsTypeDao);
	}

}