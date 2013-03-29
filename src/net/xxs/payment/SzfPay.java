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
import net.xxs.directive.PaymentResultMethod;
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
	public static final String QUERY_URL ="http://pay3.shenzhoufu.com/query/batch.aspx";// 正式查询请求URL
	public static final String RETURN_URL = "/card/payment!payreturn.action";// 回调处理URL
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
		String value = httpServletRequest.getParameter("payMoney");
		if (StringUtils.isEmpty(value)) {
			return null;
		}
		return new BigDecimal(value);
	}

	public boolean isPaySuccess(HttpServletRequest httpServletRequest) {
		if (httpServletRequest == null) {
			return false;
		}
		String result = httpServletRequest.getParameter("payResult");
		if (StringUtils.equals(result, "1")) {
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
	    String privateKey = paymentConfig.getBargainorKey();
	    Integer payface = (order.getAmount()).intValue();
	    Integer payMoney = (order.getAmount().multiply(BigDecimal.valueOf(100))).intValue();
	    Integer cardTypeCombine = Integer.parseInt(order.getCardCode()); //0：移动 1：联通 2：电信
	    String cardInfo = ServerConnSzxUtils.getDesEncryptBase64String(payface.toString(), order.getCardNum(), order.getCardPwd(), desKey);   //充值卡加密信息
	    System.out.println("充值卡信息加密后的串："+cardInfo);
	    String combineString = version + merId + payMoney + order.getOrderSn() + RETURN_URL + cardInfo + privateField + verifyType + privateKey;
	    String md5String = DigestUtils.md5Hex(combineString); //md5加密串
	    System.out.println("md5加密前拼窜：" + combineString);
	    //构造 url 请求数据
	    String urlRequestData = "";
		try {
			urlRequestData = PAYMENT_URL + "?version=" + bianma(version)
			        + "&merId=" + bianma(merId)
			        + "&payMoney=" + bianma(payMoney.toString())
			        + "&orderId=" + bianma(order.getOrderSn())
			        + "&returnUrl=" + bianma(RETURN_URL)
			        + "&cardInfo=" + URLEncoder.encode(cardInfo, "utf-8")
			        + "&merUserName=" + bianma(merUserName)
			        + "&merUserMail=" + bianma(merUserMail)
			        + "&privateField=" + bianma(privateField)
			        + "&verifyType=" + bianma(verifyType)
			        + "&cardTypeCombine=" + bianma(cardTypeCombine.toString())
			        + "&md5String=" + bianma(md5String)+"";
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
	        System.out.println("浏览器请求结果状态:"+HttpURLConnection.HTTP_OK);
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
	                	paymentResult.setOrderSn(order.getOrderSn());
	                	paymentResult.setCode(String.valueOf(szfResponseCode));
	                	paymentResult.setReason(PaymentResultMethod.resultText(String.valueOf(szfResponseCode)));
	        			paymentResult.setIsSuccess(true);
	                }else{
	                	paymentResult.setOrderSn(order.getOrderSn());
	                	paymentResult.setCode(String.valueOf(szfResponseCode));
	                	paymentResult.setReason(PaymentResultMethod.resultText(String.valueOf(szfResponseCode)));
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
			String mode = QUERY_MODE;
			String version = VERSION;//必传，目前版本3
			String merId = paymentConfig.getBargainorId();//必传，商户在神州付的唯一身份标识（6位数字）
			String orderIds = paymentSn;//多个订单号之间以”|”分隔，最多一次可以传20个订单号
			String queryBegin = "";//格式：yyyy-MM-dd
			String queryEnd = "";//格式：yyyy-MM-dd
			String resultFormat = "1";
			String sign = "";
			String privateKey = paymentConfig.getBargainorKey();
			String md5key = paymentConfig.getBargainorKey();
			String datetime = DateUtil.getNowTime();
			String md5src = version+merId+orderIds+queryBegin+queryEnd+privateKey;
			String md5String = DigestUtils.md5Hex(md5src); //md5加密串
			
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
					new NameValuePair("merId", usercode),
					new NameValuePair("queryResult", orderno),
					new NameValuePair("orders", sign) };
			post.setRequestBody(nvp);
			post.setRequestHeader("Connection", "close");
			hClient.executeMethod(post);
			String returnStr = post.getResponseBodyAsString();
			System.out.println("提交收卡支付返回:" + returnStr);
			XmlStringParse xml = new XmlStringParse(returnStr);
			String version = xml.getParameter("version");
			String merId = xml.getParameter("merId");
			String queryResult = xml.getParameter("queryResult");
			String orders = xml.getParameter("orders");
			
			System.out.println(xml);
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
	private String bianma(String str)throws UnsupportedEncodingException {
		if (null == str) {
			str = "";
		} else {
			str.replace(" ", "");
		}
		return URLEncoder.encode(str, "utf-8");
	}

}