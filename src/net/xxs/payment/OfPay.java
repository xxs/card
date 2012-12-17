package net.xxs.payment;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.xxs.bean.Setting.CurrencyType;
import net.xxs.entity.PaymentConfig;
import net.xxs.util.SettingUtil;

import org.apache.commons.lang.StringUtils;

import com.yeepay.DigestUtil;

/**
 * 殴飞  收卡接口
 */

public class OfPay extends BasePaymentProduct {

	public static final String PAYMENT_URL ="http://card.pay.ofpay.com/rcvcard.do";// 正式支付请求URL
	public static final String QUERY_URL ="http://card.pay.ofpay.com/querycard.do";// 正式查询请求URL
	public static final String RETURN_URL = ":8080/shop/payment!payreturn.action";// 回调处理URL
	public static final String NOTIFY_URL = ":8080/shop/payment!paynotify.action";// 消息通知URL
	public static final String SHOW_URL = "/";// 商品显示URL

	// 支持货币种类
	public static final CurrencyType[] currencyType = { CurrencyType.CNY };

	@Override
	public String getPaymentUrl() {
		return PAYMENT_URL;
	}

	@Override
	public String getPaymentSn(HttpServletRequest httpServletRequest) {
		if (httpServletRequest == null) {
			return null;
		}
		String r6Order = httpServletRequest.getParameter("r6_Order");
		if (StringUtils.isEmpty(r6Order)) {
			return null;
		}
		return r6Order;
	}

	@Override
	public BigDecimal getPaymentAmount(HttpServletRequest httpServletRequest) {
		if (httpServletRequest == null) {
			return null;
		}
		String r3Amt = httpServletRequest.getParameter("p3_Amt");
		if (StringUtils.isEmpty(r3Amt)) {
			return null;
		}
		return new BigDecimal(r3Amt);
	}

	public boolean isPaySuccess(HttpServletRequest httpServletRequest) {
		if (httpServletRequest == null) {
			return false;
		}
		String result = httpServletRequest.getParameter("result");
		if (StringUtils.equals(result, "2000")||StringUtils.equals(result, "2011")) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public Map<String, String> getParameterMap(PaymentConfig paymentConfig,
			String paymentSn, BigDecimal paymentAmount,
			HttpServletRequest httpServletRequest) {
		String p0_Cmd = "ChargeCardDirect"; // 业务类型（非银行卡专业版支付请求固定值“ChargeCardDirect”）
		String p1_MerId = paymentConfig.getBargainorId(); // 商户编号
		String p2_Order = paymentSn;// 商户订单号
		String p3_Amt = "0.1";// 支付金额（单位：元）
		String p4_verifyAmt = "true";// 是否校验金额 （值：true校验金额; false不校验金额）
		String p5_Pid = paymentSn;// 商品名称(选填项)
		String p6_Pcat = "";// 商品种类(选填项)
		String p7_Pdesc = paymentSn;// 商品描述(选填项)
		String p8_Url = SettingUtil.getSetting().getShopUrl() + RETURN_URL
				+ "?paymentsn=" + paymentSn;// 回调处理URL
		String pa_MP = "";// 扩展信息(选填项)
		String pa7_cardAmt = "0.1";// 面额组合
		String pa8_cardNo = "FE5005100168";// 卡号组合
		String pa9_cardPwd = "227386847613318";// 秘钥组合
		String pd_FrpId = "TIANHONG";// 通道编码
		String pr_NeedResponse = "1";// 应答机制
		String pz_userId = "";// 会员ID（payment中的member可以查询到）
		String pz1_userRegTime = "";// 会员注册时间（payment中的member可以查询到）
		String keyValue = paymentConfig.getBargainorKey();// 密钥

		// 生成hmac，保证交易信息不被篡改,关于hmac详见《易宝支付非银行卡支付专业版接口文档 v3.0》
		String hmac = "";
		hmac = DigestUtil.getHmac(new String[] { p0_Cmd, p1_MerId, p2_Order,
				p3_Amt, p4_verifyAmt, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, pa_MP,
				pa7_cardAmt, pa8_cardNo, pa9_cardPwd, pd_FrpId,
				pr_NeedResponse, pz_userId, pz1_userRegTime }, keyValue);

		// 参数处理
		Map<String, String> parameterMap = new HashMap<String, String>();
		parameterMap.put("p0_Cmd", p0_Cmd);
		parameterMap.put("p1_MerId", p1_MerId);
		parameterMap.put("p2_Order", p2_Order);
		parameterMap.put("p3_Amt", p3_Amt);
		parameterMap.put("p4_verifyAmt", p4_verifyAmt);
		parameterMap.put("p5_Pid", p5_Pid);
		parameterMap.put("p6_Pcat", p6_Pcat);
		parameterMap.put("p7_Pdesc", p7_Pdesc);
		parameterMap.put("p8_Url", p8_Url);
		parameterMap.put("pa_MP", pa_MP);
		parameterMap.put("pa7_cardAmt", pa7_cardAmt);
		parameterMap.put("pa8_cardNo", pa8_cardNo);
		parameterMap.put("pa9_cardPwd", pa9_cardPwd);
		parameterMap.put("pd_FrpId", pd_FrpId);
		parameterMap.put("pr_NeedResponse", pr_NeedResponse);
		parameterMap.put("pz_userId", pz_userId);
		parameterMap.put("pz1_userRegTime", pz1_userRegTime);
		parameterMap.put("hmac", hmac);
		return parameterMap;
	}

	@Override
	public boolean verifySign(PaymentConfig paymentConfig,
			HttpServletRequest httpServletRequest) {
		// 业务类型
		String r0_Cmd = httpServletRequest.getParameter("r0_Cmd");
		// 支付结果
		String r1_Code = httpServletRequest.getParameter("r1_Code");
		// 商户编号
		String p1_MerId = httpServletRequest.getParameter("p1_MerId");
		// 商户订单号
		String p2_Order = httpServletRequest.getParameter("p2_Order");
		// 成功金额
		String p3_Amt = httpServletRequest.getParameter("p3_Amt");
		// 支付方式
		String p4_FrpId = httpServletRequest.getParameter("p4_FrpId");
		// 卡序列号组
		String p5_CardNo = httpServletRequest.getParameter("p5_CardNo");
		// 确认金额组
		String p6_confirmAmount = httpServletRequest.getParameter("p6_confirmAmount");
		// 实际金额组
		String p7_realAmount = httpServletRequest.getParameter("p7_realAmount");
		// 卡状态组
		String p8_cardStatus = httpServletRequest.getParameter("p8_cardStatus");
		// 扩展信息
		String p9_MP = httpServletRequest.getParameter("p9_MP");
		// 支付余额 注：此项仅为订单成功,并且需要订单较验时才会有值。失败订单的余额返部返回原卡密中
		String pb_BalanceAmt = httpServletRequest.getParameter("pb_BalanceAmt");
		// 余额卡号 注：此项仅为订单成功,并且需要订单较验时才会有值
		String pc_BalanceAct = httpServletRequest.getParameter("pc_BalanceAct");
		// 签名数据
		String hmac = httpServletRequest.getParameter("hmac");
		String keyValue = paymentConfig.getBargainorKey();// 密钥
		// 验证hmac
		String newHmac = DigestUtil.getHmac(new String[] { r0_Cmd, r1_Code,
				p1_MerId, p2_Order, p3_Amt, p4_FrpId, p5_CardNo,
				p6_confirmAmount, p7_realAmount, p8_cardStatus, p9_MP,
				pb_BalanceAmt, pc_BalanceAct }, keyValue);

		// 验证支付签名
		if (StringUtils.equals(hmac,newHmac)) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public String getPayreturnMessage(String paymentSn) {
		return "ok<html><head><meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\" /><title>页面跳转中..</title></head><body onload=\"javascript: document.forms[0].submit();\"><form action=\""
				+ SettingUtil.getSetting().getShopUrl()
				+ RESULT_URL
				+ "\"><input type=\"hidden\" name=\"paymentsn\" value=\""
				+ paymentSn + "\" /></form></body></html>";
	}

	@Override
	public String getPaynotifyMessage() {
		return null;
	}

	@Override
	public String getQueryUrl() {
		return QUERY_URL;
	}

}