package net.xxs.payment;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.xxs.bean.Setting.CurrencyType;
import net.xxs.entity.PaymentConfig;
import net.xxs.util.EncodeUtils;
import net.xxs.util.SettingUtil;
import net.xxs.util.XmlStringParse;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpConnectionManagerParams;
import org.apache.commons.lang.StringUtils;

import com.ofpay.rcvcard.util.RSA;
import com.yeepay.DigestUtil;

/**
 * 殴飞  收卡接口
 */

public class OfPay extends BasePaymentProduct {

	public static final String PAYMENT_URL ="http://card.pay.ofpay.com/rcvcard.do";// 正式支付请求URL
	public static final String QUERY_URL ="http://card.pay.ofpay.com/querycard.do";// 正式查询请求URL
	public static final String RETURN_URL = ":8080/card/payment!payreturn.action";// 回调处理URL
	public static final String NOTIFY_URL = ":8080/card/payment!paynotify.action";// 消息通知URL
	public static final String SHOW_URL = "/";// 充值卡显示URL

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
		System.out.println("开始组织参数");
		String usercode = paymentConfig.getBargainorId(); // 合作伙伴在欧飞的用户ID
		String md5key = paymentConfig.getBargainorKey();//签名密钥，是在申请为欧飞第四方支付用户的时候由系统分配的
		String mode = "r"; // 商户编号
		String version = "1.0";// 固定填"1.0"
		String orderno = paymentSn;// 合作伙伴方定单号，要求系统唯一
		String cardcode = "true";// 卡类代码
		String cardno = paymentSn;// 充值卡的卡号
		String cardpass = "";// 充值卡密码(该参数可以使用RSA加密发送)。
		String retaction = SettingUtil.getSetting().getCardUrl() + RETURN_URL
				+ "?paymentsn=" + paymentSn;// 合作伙伴的回调地址，不能包含 & ? 等特别字符,必须拥有回调地址。
		String datetime = "20110808131313";// 日期时间，格式：YYYYMMDDHHMMSS，如 20110515080808
		String format = "xml";// 固定“xml”

		// 生成md5src，保证交易信息不被篡改,关于md5src详见
		String md5src = usercode + mode + version + orderno + cardcode
				+ cardno + cardpass + retaction + datetime + format+ md5key;
		//签名（参见Sign计算方法）
		String sign = EncodeUtils.testDigest(md5src);
		
		try {
			usercode = RSA.encrypt(usercode, "gbk");
			cardpass = RSA.encrypt(cardpass, "gbk");
		} catch (Exception e1) {
			e1.printStackTrace();
		}

		HttpClient hClient = new HttpClient();
		HttpConnectionManagerParams managerParams = hClient
				.getHttpConnectionManager().getParams();
		// 设置连接超时时间(单位毫秒)
		managerParams.setConnectionTimeout(1110000);
		// 设置读数据超时时间(单位毫秒)
		managerParams.setSoTimeout(3011000);
		PostMethod post = null;
		post = new PostMethod("http://localhost:8188/rcvcard.do");
		NameValuePair[] nvp = { new NameValuePair("mode", mode),
				new NameValuePair("version", version),
				new NameValuePair("usercode", usercode),
				new NameValuePair("orderno", orderno),
				new NameValuePair("cardcode", cardcode),
				new NameValuePair("cardno", cardno),
				new NameValuePair("cardpass", cardpass),
				new NameValuePair("retaction", retaction),
				new NameValuePair("format", format),
				new NameValuePair("datetime", datetime),
				new NameValuePair("sign", sign) };
		post.setRequestBody(nvp);
		post.setRequestHeader("Connection", "close");
		String returnStr = "";
		try {
			hClient.executeMethod(post);
		} catch (HttpException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		try {
			returnStr = post.getResponseBodyAsString();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("提交收卡支付返回:" + returnStr);
		XmlStringParse xml = new XmlStringParse(returnStr);
		String retusercode = xml.getParameter("usercode");
		String retmode = xml.getParameter("mode");
		String retversion = xml.getParameter("version");
		String retorderno = xml.getParameter("orderno");
		String retbillid = xml.getParameter("billid");
		String retcardcode = xml.getParameter("cardcode");
		String retcardno = xml.getParameter("cardno");
		String retretaction = xml.getParameter("retaction");
		String retresult = xml.getParameter("result");
		String retinfo = xml.getParameter("info");
		String retdatetime = xml.getParameter("datetime");
		String retsign = xml.getParameter("sign");
		
		md5src = retusercode + retmode + retversion + retorderno
				+ retbillid + retcardcode + retcardno + retretaction
				+ retresult + retinfo + retdatetime;
		// MD5check
		if (!retsign.equals(EncodeUtils.testDigest(md5src + md5key))) {
		System.out.println("加密验证失败");
		}
		post.releaseConnection();
		post = null;
		hClient = null;
		
		// 参数处理
		Map<String, String> parameterMap = new HashMap<String, String>();
		parameterMap.put("usercode", usercode);
		parameterMap.put("mode", mode);
		parameterMap.put("version", version);
		parameterMap.put("orderno", orderno);
		parameterMap.put("cardcode", cardcode);
		parameterMap.put("cardno", cardno);
		parameterMap.put("cardpass", cardpass);
		parameterMap.put("retaction", retaction);
		parameterMap.put("datetime", datetime);
		parameterMap.put("format", format);
		parameterMap.put("sign", sign);
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
				+ SettingUtil.getSetting().getCardUrl()
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