package net.xxs.payment;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.PublicKey;
import java.security.Signature;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.xxs.bean.Setting.CurrencyType;
import net.xxs.entity.Order;
import net.xxs.entity.PaymentConfig;
import net.xxs.payment.util.ServerConnSzxUtils;
import net.xxs.util.DateUtil;
import net.xxs.util.EncodeUtils;
import net.xxs.util.XmlStringParse;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpConnectionManagerParams;
import org.apache.commons.lang.StringUtils;

import sun.misc.BASE64Decoder;

/**
 * 神州付  收卡接口
 */

public class SzfPay extends BasePaymentProduct {

	public static final String PAYMENT_URL ="http://pay3.shenzhoufu.com/interface/version3/serverconnszx/entry-noxml.aspx";// 正式支付请求URL
	public static final String QUERY_URL ="http://card.pay.ofpay.com/querycard.do";// 正式查询请求URL
	public static final String RETURN_URL = "/card/payment!payreturn.action";// 回调处理URL
	public static final String SHOW_URL = "/";// 充值卡显示URL
	public static final String VERIFYTYPE = "1";// 校验MD5
	public static final String QUERY_MODE = "q";// 查询mode  
	public static final String VERSION = "3";// 版本version
	public static final String FORMAT = "xml";//返回格式  
	public static final String DESKEY = "kVfZ40x1378=";//卡密组加密串  

	// 支持货币种类
	public static final CurrencyType[] currencyType = { CurrencyType.CNY };

	@Override
	public String getPaymentUrl() {
		return PAYMENT_URL;
	}

	@Override
	public String getOrderSn(HttpServletRequest httpServletRequest) {
		if (httpServletRequest == null) {
			return null;
		}
		String orderno = httpServletRequest.getParameter("orderno");
		if (StringUtils.isEmpty(orderno)) {
			return null;
		}
		return orderno;
	}

	@Override
	public BigDecimal getPaymentAmount(HttpServletRequest httpServletRequest) {
		if (httpServletRequest == null) {
			return null;
		}
		String value = httpServletRequest.getParameter("value");
		if (StringUtils.isEmpty(value)) {
			return null;
		}
		return new BigDecimal(value);
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

    /**
     * 验签
     *
     * @param szfPublicPath 神州付公钥地址（物理路径）
     * @param md5String     数据的md5摘要
     * @param sign          签名字符串
     * @return 签名校验是否成功
     * @throws java.io.FileNotFoundException 神州付公钥证书不存在
     */
	@Override
	public boolean verifySign(PaymentConfig paymentConfig,
			HttpServletRequest httpServletRequest) {
		String szfPublicPath = httpServletRequest.getParameter("szfPublicPath");
		String md5String = httpServletRequest.getParameter("md5String");
		String sign = httpServletRequest.getParameter("sign");
		
		//打开神州付公钥证书，如果证书不存在，在抛出 FileNotFoundException 异常 
        FileInputStream fin = null;
		try {
			fin = new FileInputStream(szfPublicPath);
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		}
        try {
            CertificateFactory certificatefactory = CertificateFactory.getInstance("X.509");
            X509Certificate certificate = (X509Certificate) certificatefactory.generateCertificate(fin);
            fin.close();
//            byte[] sigedText =  Base64.decode(sign);//需要对接受到的参数进行base64解密
            BASE64Decoder base64Decoder = new BASE64Decoder();
            byte[] sigedText = base64Decoder.decodeBuffer(sign);//需要对接受到的参数进行base64解密
            byte[] updateData = md5String.getBytes("UTF-8");
            PublicKey pub = certificate.getPublicKey();
            Signature signature = Signature.getInstance("MD5withRSA");
            signature.initVerify(pub);
            signature.update(updateData);

            return signature.verify(sigedText);
        } catch (Exception e) {
            return false;
        }
		
	}

	@Override
	public String getPayreturnMessage(String paymentSn) {
		return paymentSn;
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
	public PaymentResult cardPay(PaymentConfig paymentConfig,Order order, HttpServletRequest httpServletRequest) {
		// 创建非银行卡专业版消费请求结果
		PaymentResult paymentResult = new PaymentResult();
		System.out.println("开始组织参数");
		
	    String version = VERSION; //接口版本号
	    String merId = paymentConfig.getBargainorId(); //商户ID
	    String merUserName = "";  //商户用户 名
	    String merUserMail = "";  //商户用户 Email
	    String privateField = ""; //商户私有数据
	    String verifyType = VERIFYTYPE;//MD5 校验
	    String desKey = DESKEY;
	    String privateKey = "123456";
	    String cardTypeCombine = order.getCardCode(); //0：移动 1：联通 2：电信
	    String cardInfo = ServerConnSzxUtils.getDesEncryptBase64String(order.getAmount().toString(), order.getCardNum(), order.getCardPwd(), desKey);   //充值卡加密信息
	    String combineString = version + merId + order.getAmount().toString() + order.getOrderSn() + RETURN_URL + cardInfo + privateField + verifyType + privateKey;
	    String md5String = DigestUtils.md5Hex(combineString); //md5加密串
	    System.out.println("md5加密前拼窜：" + combineString);
		
	  //构造 url 请求数据
	    String urlRequestData = "";
		try {
			urlRequestData = PAYMENT_URL + "?version=" + version
			        + "&merId=" + merId
			        + "&payMoney=" + order.getAmount().toString()
			        + "&orderId=" + order.getOrderSn()
			        + "&returnUrl=" + RETURN_URL
			        + "&cardInfo=" + URLEncoder.encode(cardInfo, "utf-8")
			        + "&merUserName=" + merUserName
			        + "&merUserMail=" + merUserMail
			        + "&privateField=" + privateField
			        + "&verifyType=" + verifyType
			        + "&cardTypeCombine=" + cardTypeCombine
			        + "&md5String=" + md5String
			        + "&signString=";
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
			System.out.println("拼装请求路径异常");
		}
	    System.out.println("构造 url 请求数据：" + urlRequestData);
	    //服务器建立连接
	    HttpURLConnection httpConnection;
	    URL url;
	    int code;
	    int szfResponseCode;
	    try {
	        url = new URL(urlRequestData);
	        httpConnection = (HttpURLConnection) url.openConnection();
	        httpConnection.setRequestMethod("GET");
	        httpConnection.setDoOutput(true);
	        httpConnection.setDoInput(true);
	        code = httpConnection.getResponseCode();
	        System.out.println("连接神州付服务器：" + PAYMENT_URL + "，HTTP响应代码：" + code);
	        if (code == HttpURLConnection.HTTP_OK) {
	            try {
	                String strCurrentLine;
	                BufferedReader reader;
	                reader = new BufferedReader(new InputStreamReader(httpConnection.getInputStream(), "UTF-8"));
	                //当正确响应时处理数据
	                szfResponseCode = httpConnection.getHeaderFieldInt("szfResponseCode", 0);
	                System.out.println("连接神州付服务器：" + PAYMENT_URL + "，SZF响应代码：" + szfResponseCode);
	                //数据通过校验
	                if (szfResponseCode == 200) {
	                	paymentResult.setReason("提交成功");
	        			paymentResult.setIsSuccess(true);
	                }else{
	                	paymentResult.setReason("加密验证失败");
	        			paymentResult.setIsSuccess(false);
	                }
	            } catch (IOException e) {
	                System.out.println("连接神州付服务器：" + PAYMENT_URL + "异常，e=" + e);
	            }
	        }
	    } catch (Exception e) {
	        System.out.println("连接神州付服务器：" + PAYMENT_URL + "异常，e=" + e);
	    }
		return paymentResult;
	}

	@Override
	public PaymentResult cardQuery(PaymentConfig paymentConfig,
			String paymentSn,HttpServletRequest httpServletRequest) {
		try {
			// 创建非银行卡专业版消费请求结果
			PaymentResult paymentResult = new PaymentResult();
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

	@Override
	public String getPaySn(HttpServletRequest httpServletRequest) {
		if (httpServletRequest == null) {
			return null;
		}
		String billid = httpServletRequest.getParameter("billid");
		if (StringUtils.isEmpty(billid)) {
			return null;
		}
		return billid;
	}

}