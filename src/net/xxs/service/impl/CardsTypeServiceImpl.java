package net.xxs.service.impl;

import javax.annotation.Resource;

import net.xxs.dao.CardsTypeDao;
import net.xxs.entity.CardsType;
import net.xxs.service.CardsTypeService;

import org.springframework.stereotype.Service;

/**
 * Service实现类 - 充值卡类型
 */

@Service("cardsTypeServiceImpl")
public class CardsTypeServiceImpl extends BaseServiceImpl<CardsType, String> implements CardsTypeService {

	@Resource(name = "cardsTypeDaoImpl")
	public void setBaseDao(CardsTypeDao cardsTypeDao) {
		super.setBaseDao(cardsTypeDao);
	}

}