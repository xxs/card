package net.xxs.service;

import net.xxs.bean.SpecificationValue;
import net.xxs.entity.Specification;

/**
 * Service接口 - 商品规格
 */

public interface SpecificationService extends BaseService<Specification, String> {
	
	/**
	 * 根据商品规格ID、商品规格值ID获取规格值
	 * 
	 * @param specificationId
	 *            商品规格ID
	 *            
	 * @param specificationValueId
	 *            商品规格值ID
	 *            
	 * @return 商品规格值
	 */
	public SpecificationValue getSpecificationValue(String specificationId, String specificationValueId);

}