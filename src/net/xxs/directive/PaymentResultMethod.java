package net.xxs.directive;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import freemarker.template.SimpleScalar;
import freemarker.template.TemplateMethodModel;
import freemarker.template.TemplateModelException;

@Component("paymentResultMethod")
public class PaymentResultMethod implements TemplateMethodModel {
	
	public static final String TAG_NAME = "resultText";

	@SuppressWarnings("static-access")
	public static String resultText(String resultcode) {
		Map<String,String> resultMap  = new HashMap<String, String>();
		resultMap.put("yeepaynull","状态暂无");
		resultMap.put("yeepay1","支付成功");
		resultMap.put("yeepay-1","支付失败");    
		resultMap.put("yeepayforzynull","状态暂无");
		resultMap.put("yeepayforzy-1","签名较验失败或未知错误");
		resultMap.put("yeepayforzy0","销卡成功，订单成功");
		resultMap.put("yeepayforzy1","销卡成功，订单失败");
		resultMap.put("yeepayforzy2","卡密成功处理过或者提交卡号过于频繁");
		resultMap.put("yeepayforzy5","卡数量过多，目前最多支持10张卡");
		resultMap.put("yeepayforzy7","卡号卡密或卡面额不符合规则");
		resultMap.put("yeepayforzy11","订单号重复");
		resultMap.put("yeepayforzy66","支付金额有误");
		resultMap.put("yeepayforzy95","支付方式未开通");
		resultMap.put("yeepayforzy112","业务状态不可用，未开通此类卡业务");
		resultMap.put("yeepayforzy8001","卡面额组填写错误");
		resultMap.put("yeepayforzy8002","卡号密码为空或者数量不相等（使用组合支付时） ");
		resultMap.put("yeepayforzy1002","本张卡密提交过于频繁，请稍后再试");
		resultMap.put("yeepayforzy1003","不支持的卡类型");
		resultMap.put("yeepayforzy1004","密码错误或充值卡无效");
		resultMap.put("yeepayforzy1006","充值卡无效");
		resultMap.put("yeepayforzy1007","卡内余额不足");
		resultMap.put("yeepayforzy1008","余额卡过期（有效期1个月）");
		resultMap.put("yeepayforzy1010","此卡正在处理中");
		resultMap.put("yeepayforzy10000","未知错误");
		resultMap.put("yeepayforzy2005","此卡已使用");
		resultMap.put("yeepayforzy2006","卡密在系统处理中");
		resultMap.put("yeepayforzy2007","该卡为假卡");
		resultMap.put("yeepayforzy2008","该卡中正在维护");
		resultMap.put("yeepayforzy2009","浙江省移动维护");
		resultMap.put("yeepayforzy2019","江苏省移动维护");
		resultMap.put("yeepayforzy2011","福建省移动维护");
		resultMap.put("yeepayforzy2012","辽宁省移动维护");
		resultMap.put("yeepayforzy2013","该卡已被锁定");
		resultMap.put("yeepayforzy2014","系统繁忙，请稍后再试");
		resultMap.put("yeepayforzy3001","卡不存在");
		resultMap.put("yeepayforzy3002","卡已使用过");
		resultMap.put("yeepayforzy3003","可以作废");
		resultMap.put("yeepayforzy3004","卡已冻结");
		resultMap.put("yeepayforzy3005","卡未激活");
		resultMap.put("yeepayforzy3006","密码不正确");
		resultMap.put("yeepayforzy3007","卡正在处理中");
		resultMap.put("yeepayforzy3101","系统错误");
		resultMap.put("yeepayforzy3102","卡已过期");
		resultMap.put("ofpaynull","状态暂无");
		resultMap.put("ofpay2000","支付成功");
		resultMap.put("ofpay2001","数据接收成功");
		resultMap.put("ofpay2002","不支持该卡类或者该面值的卡");
		resultMap.put("ofpay2003","签名验证失败");
		resultMap.put("ofpay2004","订单内容重复");
		resultMap.put("ofpay2005","该卡密已经有被使用过的记录");
		resultMap.put("ofpay2006","订单号已经存在");
		resultMap.put("ofpay2007","数据非法");
		resultMap.put("ofpay2008","用户非法");
		resultMap.put("ofpay2009","暂时停止该类卡或者该面值的卡交易");
		resultMap.put("ofpay2010","充值卡无效");
		resultMap.put("ofpay2011","支付成功，实际面值{0}元");
		resultMap.put("ofpay2012","网络出错");
		resultMap.put("ofpay2013","系统繁忙");
		resultMap.put("ofpay2014","不存在该笔订单");
		resultMap.put("ofpay2015","未知请求");
		resultMap.put("ofpay2016","密码错误");
		resultMap.put("ofpay2017","匹配订单失败");
		resultMap.put("ofpay2018","余额不足");
		resultMap.put("ofpay2999","其他错误");
		resultMap.put("szfpay101","md5 验证失败");
		resultMap.put("szfpay102","订单号重复");
		resultMap.put("szfpay103","恶意用户");
		resultMap.put("szfpay104","序列号，密码简单验证失败");
		resultMap.put("szfpay105","密码正在处理中");
		resultMap.put("szfpay106","系统繁忙，暂停提交");
		resultMap.put("szfpay107","多次支付时卡内余额不足");
		resultMap.put("szfpay109","des 解密失败");
		resultMap.put("szfpay501","插入数据库失败");
		resultMap.put("szfpay502","插入数据库失败");
		resultMap.put("szfpay200","请求成功");
		resultMap.put("szfpay201","证书验证失败");
		resultMap.put("szfpay902","商户参数不全");
		resultMap.put("szfpay903","商户ID 不存在");
		resultMap.put("szfpay904","商户没有激活");
		resultMap.put("szfpay905","商户没有使用该接口的权限");
		resultMap.put("szfpay906","商户没有设置密钥（privateKey）");
		resultMap.put("szfpay907","商户没有设置DES 密钥");
		resultMap.put("szfpay908","该笔订单已经处理完成");
		resultMap.put("szfpay909","该笔订单不符合重复支付的条件");
		resultMap.put("szfpay910","服务器返回地址，不符合规范");
		resultMap.put("szfpay911","订单号，不符合规范");
		resultMap.put("szfpay912","非法订单");
		resultMap.put("szfpay913","该地方卡暂时不支持");
		resultMap.put("szfpay914","支付金额非法");
		resultMap.put("szfpay915","卡面额非法");
		resultMap.put("szfpay916","商户不支持该充值卡的支付");
		resultMap.put("szfpay917","参数格式不正确");
		resultMap.put("szfpay0","网络连接失败");
		return resultMap.get(resultcode);
	}

	@SuppressWarnings("unchecked")
	public Object exec(List arguments) throws TemplateModelException {
		if (arguments.size() == 1) {
			String str = arguments.get(0).toString();
			return new SimpleScalar(resultText(str));
		} else if (arguments.size() == 2) {
			if("".equals(arguments.get(1).toString())||arguments.get(1).toString().isEmpty()){
				arguments.set(1, "null");
			}
			String str = arguments.get(0).toString()+arguments.get(1).toString();
//			System.out.println("字符串为："+str);
			return new SimpleScalar(resultText(str));
		}else {
			throw new TemplateModelException("Wrong arguments");
		}
	}
}