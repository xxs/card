package net.xxs.payment;
/**
 * 非银行卡支付结果
 * @author lu.li
 *
 */
public class PaymentResult {
	private String cmd;				//业务类型（用户请求返回是做数据hmac验证）
	private String code;			// 消费请求结果(该结果代表请求是否成功，不代表实际扣款结果)
	private String orderSn;			// 商户订单号
	private String returnMsg;		// 错误信息
	private String hmac;			// 签名数据
	
	
	public String getCmd() {
		return cmd;
	}
	public void setCmd(String cmd) {
		this.cmd = cmd;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	public String getOrderSn() {
		return orderSn;
	}
	public void setOrderSn(String orderSn) {
		this.orderSn = orderSn;
	}
	public String getReturnMsg() {
		return returnMsg;
	}
	public void setReturnMsg(String returnMsg) {
		this.returnMsg = returnMsg;
	}
	public String getHmac() {
		return hmac;
	}
	public void setHmac(String hmac) {
		this.hmac = hmac;
	}
	
	
}
