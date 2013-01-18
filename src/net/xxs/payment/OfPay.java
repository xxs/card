package net.xxs.payment;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.xxs.bean.Setting.CurrencyType;
import net.xxs.entity.Order;
import net.xxs.entity.PaymentConfig;
import net.xxs.util.DateUtil;
import net.xxs.util.EncodeUtils;
import net.xxs.util.SettingUtil;
import net.xxs.util.XmlStringParse;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpConnectionManagerParams;
import org.apache.commons.lang.StringUtils;

/**
 * 殴飞  收卡接口
 */

public class OfPay extends BasePaymentProduct {

	public static final String PAYMENT_URL ="http://card.pay.ofpay.com/rcvcard.do";// 正式支付请求URL
	public static final String QUERY_URL ="http://card.pay.ofpay.com/querycard.do";// 正式查询请求URL
	public static final String RETURN_URL = ":8080/card/payment!payreturn.action";// 回调处理URL
	public static final String NOTIFY_URL = ":8080/card/payment!paynotify.action";// 消息通知URL
	public static final String SHOW_URL = "/";// 充值卡显示URL
	public static final String PAY_MODE = "r";// 支付mode
	public static final String QUERY_MODE = "q";// 查询mode  
	public static final String VERSION = "1.0";// 版本version
	public static final String FORMAT = "xml";//返回格式

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
		return null;
	}

	@Override
	public boolean verifySign(PaymentConfig paymentConfig,
			HttpServletRequest httpServletRequest) {
		return true;
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

	@Override
	public PaymentResult cardPay(PaymentConfig paymentConfig, String paymentSn,
			Order order, HttpServletRequest httpServletRequest) {
		
		System.out.println("开始组织参数");
		String usercode = paymentConfig.getBargainorId(); // 合作伙伴在欧飞的用户ID
		String md5key = paymentConfig.getBargainorKey();//签名密钥，是在申请为欧飞第四方支付用户的时候由系统分配的
		String mode = PAY_MODE; // 商户编号
		String version = VERSION;// 固定填"1.0"
		String orderno = paymentSn;// 合作伙伴方定单号，要求系统唯一
		String cardcode = order.getCardCode()+String.valueOf(order.getAmount().intValue());// 卡类代码
		System.out.println("cardcode:"+cardcode);
		String cardno = order.getCardNum();// 充值卡的卡号
		String cardpass = order.getCardPwd();// 充值卡密码(该参数可以使用RSA加密发送)。
		String retaction = SettingUtil.getSetting().getCardUrl() + RETURN_URL
				+ "?paymentsn=" + paymentSn;// 合作伙伴的回调地址，不能包含 & ? 等特别字符,必须拥有回调地址。
		String datetime = DateUtil.getNowTime();// 日期时间，格式：YYYYMMDDHHMMSS，如 20110515080808
		String format = FORMAT;// 固定“xml”
		System.out.println("参数完成");
		// 生成md5src，保证交易信息不被篡改,关于md5src详见
		String md5src = usercode + mode + version + orderno + cardcode
				+ cardno + cardpass + retaction + datetime + format+ md5key;
		//签名（参见Sign计算方法）
		String sign = EncodeUtils.testDigest(md5src);
		System.out.println("sdfsdfs");
		try {
			System.out.println("1");
			System.out.println("usercode"+usercode);
//			usercode = RSA.encrypt(usercode, "gbk");
//			System.out.println("2");
//			System.out.println("cardpass"+cardpass);
//			cardpass = RSA.encrypt(cardpass, "gbk");
			System.out.println("3");
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		System.out.println("code   md5");
		HttpClient hClient = new HttpClient();
		HttpConnectionManagerParams managerParams = hClient
				.getHttpConnectionManager().getParams();
		// 设置连接超时时间(单位毫秒)
		managerParams.setConnectionTimeout(1110000);
		// 设置读数据超时时间(单位毫秒)
		managerParams.setSoTimeout(3011000);
		PostMethod post = null;
		System.out.println("strat");
		post = new PostMethod(PAYMENT_URL);
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
		System.out.println("bigin");
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
		System.out.println("yanzhegnqian ");
		// MD5check
		if (!retsign.equals(EncodeUtils.testDigest(md5src + md5key))) {
		System.out.println("加密验证失败");
		}
		post.releaseConnection();
		post = null;
		hClient = null;
		// 创建非银行卡专业版消费请求结果
		PaymentResult paymentResult = new PaymentResult();
		paymentResult.setCmd(retmode);
		paymentResult.setCode(retresult);
		paymentResult.setReturnMsg(retinfo);
		paymentResult.setOrderSn(retorderno);
		paymentResult.setHmac(EncodeUtils.testDigest(md5src + md5key));
		return paymentResult;
	}

	@Override
	public PaymentResult cardQuery(PaymentConfig paymentConfig,
			String paymentSn,HttpServletRequest httpServletRequest) {
		System.out.println("query1");
		try {
			String usercode = paymentConfig.getBargainorId();
			String mode = QUERY_MODE;
			String version = VERSION;
			String format = FORMAT;
			String sign = "";
			String orderno = paymentSn;
			String md5key = paymentConfig.getBargainorKey();
			String datetime = DateUtil.getNowTime();
			String md5src = usercode + mode + version + orderno + format;
			sign = EncodeUtils.testDigest(md5src + md5key);

			HttpClient hClient = new HttpClient();
			HttpConnectionManagerParams managerParams = hClient
					.getHttpConnectionManager().getParams();
			// 设置连接超时时间(单位毫秒)
			managerParams.setConnectionTimeout(10000);
			// 设置读数据超时时间(单位毫秒)
			managerParams.setSoTimeout(10000);
			PostMethod post = null;
			post = new PostMethod(QUERY_URL);
			NameValuePair[] nvp = { new NameValuePair("mode", mode),
					new NameValuePair("version", version),
					new NameValuePair("usercode", usercode),
					new NameValuePair("orderno", orderno),
					new NameValuePair("format", format),
					new NameValuePair("datetime", datetime),
					new NameValuePair("sign", sign) };
			post.setRequestBody(nvp);
			post.setRequestHeader("Connection", "close");
			hClient.executeMethod(post);
			String returnStr = post.getResponseBodyAsString();
			System.out.println("提交收卡支付返回:" + returnStr);
			XmlStringParse xml = new XmlStringParse(returnStr);
			String retusercode = xml.getParameter("usercode");
			String retmode = xml.getParameter("mode");
			String retversion = xml.getParameter("version");
			String retorderno = xml.getParameter("orderno");
			String retbillid = xml.getParameter("billid");
			String retresult = xml.getParameter("result");
			String retinfo = xml.getParameter("info");
			String retdatetime = xml.getParameter("datetime");
			String retsign = xml.getParameter("sign");
			String retvalue = xml.getParameter("value");
			String retaccountvalue = xml.getParameter("accountvalue");
			
			System.out.println(xml);
			md5src = usercode + mode + version
			+ orderno + retbillid + retresult + retinfo + retvalue + retaccountvalue
			+ retdatetime;
			if (!retsign.equals(EncodeUtils.testDigest(md5src + md5key))) {
				System.out.println("加密验证失败");
			}
			post.releaseConnection();
			post = null;
			hClient = null;
			// 创建非银行卡专业版消费请求结果
			PaymentResult paymentResult = new PaymentResult();
			paymentResult.setCmd(retmode);
			paymentResult.setCode(retresult);
			paymentResult.setReturnMsg(retinfo);
			paymentResult.setOrderSn(retorderno);
			paymentResult.setHmac(EncodeUtils.testDigest(md5src + md5key));
			if("2000".equals(retresult)||"2011".equals(retresult)){
				paymentResult.setIsSuccess(true);
			}else{
				paymentResult.setIsSuccess(false);
			}
			return paymentResult;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			
		}
		return null;
	}

}