package net.xxs.action.shop;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.xxs.entity.Area;
import net.xxs.service.AreaService;
import net.xxs.util.JsonUtil;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.opensymphony.xwork2.interceptor.annotations.InputConfig;

/**
 * 后台Action类 - 地区
 */

@ParentPackage("shop")
public class AreaAction extends BaseShopAction {

	private static final long serialVersionUID = 1321099291073671591L;

	@Resource(name = "areaServiceImpl")
	private AreaService areaService;

	// 根据ID获取地区
	@InputConfig(resultName = "ajaxError")
	public String ajaxArea() {
		List<Area> areaList = areaService.getAreaList(id);
		List<Map<String, String>> optionList = new ArrayList<Map<String, String>>();
		for (Area area : areaList) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("title", area.getName());
			map.put("value", area.getId());
			optionList.add(map);
		}
		return ajax(JsonUtil.toJson(optionList));
	}

}