package net.xxs.action.shop;

import java.util.HashSet;
import java.util.Set;

import javax.annotation.Resource;

import net.xxs.entity.Goods;
import net.xxs.entity.Member;
import net.xxs.service.GoodsService;
import net.xxs.service.MemberService;

import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.opensymphony.xwork2.interceptor.annotations.InputConfig;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;

/**
 * 前台Action类 - 收藏夹
 */

@ParentPackage("shop")
@InterceptorRefs({
	@InterceptorRef(value = "memberVerifyInterceptor"),
	@InterceptorRef(value = "shopStack")
})
public class FavoriteAction extends BaseShopAction {

	private static final long serialVersionUID = 6297956848773319710L;
	
	private static final Integer pageSize = 10;// 商品收藏每页显示数
	
	private Goods goods;

	@Resource(name = "memberServiceImpl")
	private MemberService memberService;
	@Resource(name = "goodsServiceImpl")
	private GoodsService goodsService;

	// 商品收藏列表
	public String list() {
		Member loginMember = getLoginMember();
		pager.setPageSize(pageSize);
		pager = goodsService.getFavoriteGoodsPager(loginMember, pager);
		return LIST;
	}

	// 添加收藏商品
	@Validations(
		requiredStrings = {
			@RequiredStringValidator(fieldName = "id", message = "参数错误!")
		}
	)
	@InputConfig(resultName = "ajaxError")
	public String ajaxAdd() {
		goods = goodsService.load(id);
		if (!goods.getIsMarketable()) {
			return ajax(Status.error, "此商品已下架!");
		}
		Member loginMember = getLoginMember();
		Set<Goods> favoriteGoodsSet = (loginMember.getFavoriteGoodsSet() == null ? new HashSet<Goods>() : loginMember.getFavoriteGoodsSet());
		if (favoriteGoodsSet.contains(goods)) {
			return ajax(Status.warn, "您已经收藏过此商品!");
		} else {
			favoriteGoodsSet.add(goods);
			memberService.update(loginMember);
			return ajax(Status.success, "商品收藏成功!");
		}
	}

	// 删除收藏商品
	@Validations(
		requiredStrings = {
			@RequiredStringValidator(fieldName = "id", message = "参数错误!")
		}
	)
	@InputConfig(resultName = "ajaxError")
	public String ajaxDelete() {
		goods = goodsService.load(id);
		Member loginMember = getLoginMember();
		Set<Goods> favoriteGoodsSet = loginMember.getFavoriteGoodsSet();
		if (!favoriteGoodsSet.contains(goods)) {
			return ajax(Status.error, "参数错误!");
		}
		favoriteGoodsSet.remove(goods);
		memberService.update(loginMember);
		return ajax(Status.success, "删除成功!");
	}

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

}