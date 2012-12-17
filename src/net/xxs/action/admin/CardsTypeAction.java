package net.xxs.action.admin;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.persistence.Transient;

import net.xxs.bean.CardsParameter;
import net.xxs.entity.Brand;
import net.xxs.entity.CardsAttribute;
import net.xxs.entity.CardsType;
import net.xxs.entity.CardsAttribute.AttributeType;
import net.xxs.service.BrandService;
import net.xxs.service.CacheService;
import net.xxs.service.CardsAttributeService;
import net.xxs.service.CardsTypeService;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.beans.BeanUtils;

import com.opensymphony.xwork2.interceptor.annotations.InputConfig;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;

/**
 * 后台Action类 - 商品类型
 */

@ParentPackage("admin")
public class CardsTypeAction extends BaseAdminAction {

	private static final long serialVersionUID = 8895838200173152426L;

	private CardsType cardsType;
	private List<Brand> brandList;
	private List<CardsAttribute> cardsAttributeList;
	private List<CardsParameter> cardsParameterList;

	@Resource(name = "cardsTypeServiceImpl")
	private CardsTypeService cardsTypeService;
	@Resource(name = "brandServiceImpl")
	private BrandService brandService;
	@Resource(name = "cardsAttributeServiceImpl")
	private CardsAttributeService cardsAttributeService;
	@Resource(name = "cacheServiceImpl")
	private CacheService cacheService;

	// 添加
	public String add() {
		return INPUT;
	}

	// 编辑
	public String edit() {
		cardsType = cardsTypeService.load(id);
		return INPUT;
	}

	// 列表
	public String list() {
		pager = cardsTypeService.findPager(pager);
		return LIST;
	}

	// 删除
	public String delete() {
		cardsTypeService.delete(ids);
		return ajax(Status.success, "删除成功!");
	}

	// 保存
	@Validations(
		requiredStrings = { 
			@RequiredStringValidator(fieldName = "cardsType.name", message = "类型名称不允许为空!") 
		}
	)
	@InputConfig(resultName = "error")
	public String save() {
		if (brandList != null) {
			cardsType.setBrandSet(new HashSet<Brand>(brandList));
		} else {
			cardsType.setBrandSet(null);
		}
		
		if (cardsParameterList != null) {
			for (Iterator<CardsParameter> iterator = cardsParameterList.iterator(); iterator.hasNext();) {
				CardsParameter cardsParameter = iterator.next();
				if (cardsParameter == null || StringUtils.isEmpty(cardsParameter.getName())) {
					iterator.remove();
				}
			}
		}
		cardsType.setCardsParameterList(cardsParameterList);
		cardsTypeService.save(cardsType);
		if (cardsAttributeList != null) {
			for (CardsAttribute cardsAttribute : cardsAttributeList) {
				if (StringUtils.isEmpty(cardsAttribute.getName()) || cardsAttribute.getAttributeType() == null || (cardsAttribute.getAttributeType() == AttributeType.filter && StringUtils.isEmpty(cardsAttribute.getOptionText()))) {
					continue;
				}
				Integer unusedPropertyIndex = cardsAttributeService.getUnusedPropertyIndex(cardsType);
				if (unusedPropertyIndex != null) {
					cardsAttribute.setCardsType(cardsType);
					cardsAttribute.setPropertyIndex(unusedPropertyIndex);
					cardsAttributeService.save(cardsAttribute);
				}
			}
		}
		cacheService.flushCardsListPageCache(getRequest());
		redirectUrl = "cards_type!list.action";
		return SUCCESS;
	}

	// 更新
	@InputConfig(resultName = "error")
	public String update() {
		if (brandList != null) {
			cardsType.setBrandSet(new HashSet<Brand>(brandList));
		} else {
			cardsType.setBrandSet(null);
		}
		
		if (cardsParameterList != null) {
			for (Iterator<CardsParameter> iterator = cardsParameterList.iterator(); iterator.hasNext();) {
				CardsParameter cardsParameter = iterator.next();
				if (cardsParameter == null || StringUtils.isEmpty(cardsParameter.getName())) {
					iterator.remove();
				}
			}
		}
		cardsType.setCardsParameterList(cardsParameterList);
		
		CardsType persistent = cardsTypeService.load(id);
		if (cardsAttributeList != null) {
			Set<CardsAttribute> persistentCardsAttributeSet = persistent.getCardsAttributeSet();
			for (CardsAttribute persistentCardsAttribute : persistentCardsAttributeSet) {
				if (!cardsAttributeList.contains(persistentCardsAttribute)) {
					cardsAttributeService.delete(persistentCardsAttribute);
				}
			}
			for (CardsAttribute cardsAttribute : cardsAttributeList) {
				if (cardsAttribute == null || StringUtils.isEmpty(cardsAttribute.getName()) || cardsAttribute.getAttributeType() == null || (cardsAttribute.getAttributeType() == AttributeType.filter && StringUtils.isEmpty(cardsAttribute.getOptionText()))) {
					continue;
				}
				if (StringUtils.isNotEmpty(cardsAttribute.getId())) {
					CardsAttribute persistentCardsAttribute = cardsAttributeService.load(cardsAttribute.getId());
					BeanUtils.copyProperties(cardsAttribute, persistentCardsAttribute, new String[] {"id", "createDate", "modifyDate", "cardsType", "propertyIndex"});
					cardsAttributeService.update(persistentCardsAttribute);
				} else {
					Integer unusedPropertyIndex = cardsAttributeService.getUnusedPropertyIndex(persistent);
					if (unusedPropertyIndex != null) {
						cardsAttribute.setCardsType(persistent);
						cardsAttribute.setPropertyIndex(unusedPropertyIndex);
						cardsAttributeService.save(cardsAttribute);
					}
				}
			}
		} else {
			Set<CardsAttribute> persistentCardsAttributeSet = persistent.getCardsAttributeSet();
			for (CardsAttribute persistentCardsAttribute : persistentCardsAttributeSet) {
				cardsAttributeService.delete(persistentCardsAttribute);
			}
		}
		BeanUtils.copyProperties(cardsType, persistent, new String[] {"id", "createDate", "modifyDate", "cardsAttributeSet", "cardsSet"});
		cardsTypeService.update(persistent);
		cacheService.flushCardsListPageCache(getRequest());
		redirectUrl = "cards_type!list.action";
		return SUCCESS;
	}
	
	// 获取商品属性类型集合
	@Transient
	public List<AttributeType> getAttributeTypeList() {
		return Arrays.asList(AttributeType.values());
	}
	
	// 获取所有商品品牌集合
	@Transient
	public List<Brand> getAllBrandList() {
		return brandService.getAllList();
	}

	public CardsType getCardsType() {
		return cardsType;
	}

	public void setCardsType(CardsType cardsType) {
		this.cardsType = cardsType;
	}

	public List<Brand> getBrandList() {
		return brandList;
	}

	public void setBrandList(List<Brand> brandList) {
		this.brandList = brandList;
	}

	public List<CardsAttribute> getCardsAttributeList() {
		return cardsAttributeList;
	}

	public void setCardsAttributeList(List<CardsAttribute> cardsAttributeList) {
		this.cardsAttributeList = cardsAttributeList;
	}

	public List<CardsParameter> getCardsParameterList() {
		return cardsParameterList;
	}

	public void setCardsParameterList(List<CardsParameter> cardsParameterList) {
		this.cardsParameterList = cardsParameterList;
	}

}