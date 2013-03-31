package net.xxs.action.admin;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import net.xxs.entity.Brand;
import net.xxs.entity.Member;
import net.xxs.entity.MemberDiscount;
import net.xxs.service.BrandService;
import net.xxs.service.MemberDiscountService;
import net.xxs.service.MemberService;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.beans.BeanUtils;

import com.opensymphony.xwork2.interceptor.annotations.InputConfig;
import com.opensymphony.xwork2.validator.annotations.RequiredFieldValidator;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;

/**
 * 后台Action类 - 会员私有折扣率
 */

@ParentPackage("admin")
public class MemberDiscountAction extends BaseAdminAction {


	private static final long serialVersionUID = 519516833354950453L;

	private MemberDiscount memberDiscount;
	private List<Brand> brandList = new ArrayList<Brand>();
	
	@Resource(name = "memberDiscountServiceImpl")
	private MemberDiscountService memberDiscountService;
	@Resource(name = "memberServiceImpl")
	private MemberService memberService;
	@Resource(name = "brandServiceImpl")
	private BrandService brandService;

	// 是否已存在 username ajax验证
	public String checkUsername() {
		String username = memberDiscount.getMember().getUsername();
		if (!memberService.isExistByUsername(username)) {
			return ajax("false");
		} else {
			return ajax("true");
		}
	}
	// 列表
	public String list() {
		pager = memberDiscountService.findPager(pager);
		return LIST;
	}

	// 添加
	public String add() {
		brandList = getAllBrandList();
		return INPUT;
	}
	// 保存
	@Validations(
		requiredStrings = { 
			@RequiredStringValidator(fieldName = "memberDiscount.member.username", message = "会员名不允许为空!"),
			@RequiredStringValidator(fieldName = "memberDiscount.brand.id", message = "卡种品牌不允许为空!")
		},
		requiredFields = {
			@RequiredFieldValidator(fieldName = "memberDiscount.discount", message = "折扣率不允许为空!")
		}
	)
	@InputConfig(resultName = "error")
	public String save() {
		if (!memberService.isExistByUsername(memberDiscount.getMember().getUsername())) {
			addActionError("会员名不存在!");
			return ERROR;
		}
		Member member = memberService.getMemberByUsername(memberDiscount.getMember().getUsername());
		Brand brand =  brandService.get(memberDiscount.getBrand().getId());
		memberDiscount.setMember(member);
		memberDiscount.setBrand(brand);
		memberDiscountService.save(memberDiscount);
		redirectUrl = "member_discount!list.action";
		return SUCCESS;
	}
	// 编辑
	public String edit() {
		brandList = getAllBrandList();
		memberDiscount = memberDiscountService.load(id);
		return INPUT;
	}
	// 更新
	@Validations(
		requiredFields = {
			@RequiredFieldValidator(fieldName = "memberDiscount.discount", message = "折扣率不允许为空!")
		}
	)
	
	@InputConfig(resultName = "error")
	public String update() {
		MemberDiscount persistent = memberDiscountService.get(id);
		BeanUtils.copyProperties(memberDiscount, persistent, new String[] {"id", "createDate", "modifyDate", "member","brand"});
		memberDiscountService.update(persistent);
		redirectUrl = "member_discount!list.action";
		return SUCCESS;
	}
	
	// 获取所有卡种类型
	public List<Brand> getAllBrandList() {
		return brandService.getAllList();
	}
	
	public MemberDiscount getMemberDiscount() {
		return memberDiscount;
	}

	public void setMemberDiscount(MemberDiscount memberDiscount) {
		this.memberDiscount = memberDiscount;
	}
	public List<Brand> getBrandList() {
		return brandList;
	}
	public void setBrandList(List<Brand> brandList) {
		this.brandList = brandList;
	}
	
}