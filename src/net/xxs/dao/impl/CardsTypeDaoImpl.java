package net.xxs.dao.impl;

import java.util.Set;

import net.xxs.dao.CardsTypeDao;
import net.xxs.entity.Cards;
import net.xxs.entity.CardsType;

import org.springframework.stereotype.Repository;

/**
 * Dao实现类 - 商品类型
 */

@Repository("cardsTypeDaoImpl")
public class CardsTypeDaoImpl extends BaseDaoImpl<CardsType, String> implements CardsTypeDao {
	
	// 关联处理
	@Override
	public void delete(CardsType cardsType) {
		Set<Cards> cardsSet = cardsType.getCardsSet();
		int i = 0;
		for (Cards cards : cardsSet) {
			cards.setCardsType(null);
			cards.setCardsAttributeValueToNull();
			if(i % 20 == 0) {
				flush();
				clear();
			}
			i ++;
		}
		super.delete(cardsType);
	}

	// 关联处理
	@Override
	public void delete(String id) {
		CardsType cardsType = super.load(id);
		this.delete(cardsType);
	}

	// 关联处理
	@Override
	public void delete(String[] ids) {
		for (String id : ids) {
			CardsType cardsType = super.load(id);
			this.delete(cardsType);
		}
	}

}