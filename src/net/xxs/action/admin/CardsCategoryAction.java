package net.xxs.action.admin;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import net.xxs.entity.Cards;
import net.xxs.entity.CardsCategory;
import net.xxs.entity.CardsType;
import net.xxs.service.CacheService;
import net.xxs.service.CardsCategoryService;
import net.xxs.service.CardsTypeService;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.beans.BeanUtils;

import com.opensymphony.xwork2.interceptor.annotations.InputConfig;
import com.opensymphony.xwork2.validator.annotations.IntRangeFieldValidator;
import com.opensymphony.xwork2.validator.annotations.RegexFieldValidator;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;

/**
 * 后台Action类 - 商品分类
 */

@ParentPackage("admin")
public class CardsCategoryAction extends BaseAdminAction {

	private static final long serialVersionUID = 3066159260207583127L;
	
	private String parentId;
	private CardsCategory cardsCategory;

	@Resource(name = "cardsCategoryServiceImpl")
	private CardsCategoryService cardsCategoryService;
	@Resource(name = "cardsTypeServiceImpl")
	private CardsTypeService cardsTypeService;
	@Resource(name = "cacheServiceImpl")
	private CacheService cacheService;
	
	// 是否已存在标识 ajax验证
	public String checkSign() {
		String oldSign = getParameter("oldValue");
		String newSign = cardsCategory.getSign();
		if (cardsCategoryService.isUniqueBySign(oldSign, newSign)) {
			return ajax("true");
		} else {
			return ajax("false");
		}
	}

	// 添加
	public String add() {
		return INPUT;
	}

	// 编辑
	public String edit() {
		cardsCategory = cardsCategoryService.load(id);
		return INPUT;
	}

	// 列表
	public String list() {
		return LIST;
	}

	// 删除
	public String delete() {
		CardsCategory cardsCategory = cardsCategoryService.load(id);
		Set<CardsCategory> childrenCardsCategorySet = cardsCategory.getChildren();
		redirectUrl = "cards_category!list.action";
		if (childrenCardsCategorySet != null && childrenCardsCategorySet.size() > 0) {
			addActionError("此商品分类存在下级分类,删除失败!");
			return ERROR;
		}
		Set<Cards> cardsSet = cardsCategory.getCardsSet();
		if (cardsSet != null && cardsSet.size() > 0) {
			addActionError("此商品分类下存在商品,删除失败!");
			return ERROR;
		}
		cardsCategoryService.delete(id);
		logInfo = "删除商品分类: " + cardsCategory.getName();
		
		cacheService.flushCardsListPageCache(getRequest());
		
		return SUCCESS;
	}

	// 保存
	@Validations(
		requiredStrings = { 
			@RequiredStringValidator(fieldName = "cardsCategory.name", message = "分类名称不允许为空!"),
			@RequiredStringValidator(fieldName = "cardsCategory.sign", message = "标识不允许为空!")
		},
		intRangeFields = {
			@IntRangeFieldValidator(fieldName = "cardsCategory.orderList", min = "0", message = "排序必须为零或正整数!")
		},
		regexFields = { 
			@RegexFieldValidator(fieldName = "cardsCategory.sign", expression = "^\\w+$", message = "标识只允许包含英文、数字和下划线!") 
		}
	)
	@InputConfig(resultName = "error")
	public String save() {
		if (cardsCategoryService.isExistBySign(cardsCategory.getSign())) {
			addActionError("标识已存在!");
			return ERROR;
		}
		if (StringUtils.isNotEmpty(parentId)) {
			CardsCategory parent = cardsCategoryService.load(parentId);
			cardsCategory.setParent(parent);
		} else {
			cardsCategory.setParent(null);
		}
		if (StringUtils.isEmpty(cardsCategory.getCardsType().getId())) {
			cardsCategory.setCardsType(null);
		}
		cardsCategoryService.save(cardsCategory);
		logInfo = "添加商品分类: " + cardsCategory.getName();
		
		cacheService.flushCardsListPageCache(getRequest());
		
		redirectUrl = "cards_category!list.action";
		return SUCCESS;
	}

	// 更新
	@Validations(
		requiredStrings = { 
			@RequiredStringValidator(fieldName = "cardsCategory.name", message = "分类名称不允许为空!"),
			@RequiredStringValidator(fieldName = "cardsCategory.sign", message = "标识不允许为空!")
		},
		intRangeFields = {
			@IntRangeFieldValidator(fieldName = "cardsCategory.orderList", min = "0", message = "排序必须为零或正整数!")
		},
		regexFields = { 
			@RegexFieldValidator(fieldName = "cardsCategory.sign", expression = "^\\w+$", message = "标识只允许包含英文、数字和下划线!") 
		}
	)
	@InputConfig(resultName = "error")
	public String update() {
		CardsCategory persistent = cardsCategoryService.load(id);
		if (!cardsCategoryService.isUniqueBySign(persistent.getSign(), cardsCategory.getSign())) {
			addActionError("标识已存在!");
			return ERROR;
		}
		if (StringUtils.isEmpty(cardsCategory.getCardsType().getId())) {
			cardsCategory.setCardsType(null);
		}
		BeanUtils.copyProperties(cardsCategory, persistent, new String[]{"id", "createDate", "modifyDate", "path", "parent", "children", "cardsSet"});
		cardsCategoryService.update(persistent);
		logInfo = "更新商品分类: " + cardsCategory.getName();
		
		cacheService.flushCardsListPageCache(getRequest());
		
		redirectUrl = "cards_category!list.action";
		return SUCCESS;
	}
	
	// 获取商品分类树
	public List<CardsCategory> getCardsCategoryTreeList() {
		return cardsCategoryService.getCardsCategoryTreeList();
	}
	
	// 获取所有商品类型集合
	public List<CardsType> getAllCardsTypeList() {
		return cardsTypeService.getAllList();
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public CardsCategory getCardsCategory() {
		return cardsCategory;
	}

	public void setCardsCategory(CardsCategory cardsCategory) {
		this.cardsCategory = cardsCategory;
	}

}