package net.xxs.action.api;

import java.io.IOException;
import java.io.PrintWriter;

import net.sf.json.JSONObject;
import net.xxs.util.EncodeUtils;

import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.ParentPackage;

/**
 * 前台Action类 - api远程查询接口
 */

@ParentPackage("api")
@InterceptorRefs({
	@InterceptorRef(value = "apiStack")
})
public class RegcardAction extends BaseApiAction {

	private static final long serialVersionUID = -3361881210496442774L;

	public String execute() throws Exception {
		
		System.out.println("执行了销卡操作");
		String md5key = "XFY60Amvk7cTfKPa0szi5GC5R9P7UO8X";
		String md5src=usercode + mode + version
		+ orderno + billid + result + info + value + accountvalue
		+ datetime;
		
		if (!sign.equals(EncodeUtils.testDigest(md5src + md5key))) {
			System.out.println("加密验证失败");
		}
		PrintWriter out = null;
		
		JSONObject jsonObject = new JSONObject();
        jsonObject.put("usercode", usercode);
        jsonObject.put("mode", mode);
        jsonObject.put("QQ", "413425430");
        jsonObject.put("Min.score", new Integer(99));
        jsonObject.put("nickname", "梦中心境");
		
		
		
		 StringBuffer xml = new StringBuffer();
//		 xml.append("<?xml version=\"1.0\" encoding=\"gbk\"?>");
//		 xml.append("<root>");
//		 xml.append("<usercode>");
//		 xml.append(request.getParameter("usercode"));
//		 xml.append("</usercode>");
//		 xml.append("<mode>");
//		 xml.append(request.getParameter("mode"));
//		 xml.append("</mode>");
//		 xml.append("<version>");
//		 xml.append(request.getParameter("version"));
//		 xml.append("</version>");
//		 xml.append("<orderno>");
//		 xml.append(request.getParameter("orderno"));
//		 xml.append("</orderno>");
//		 xml.append("<billid>");
//		 xml.append(request.getParameter("billid"));
//		 xml.append("</billid>");
//		 xml.append("<result>");
//		 xml.append(request.getParameter("result"));
//		 xml.append("</result>");
//		 xml.append("<info>");
//		 xml.append(request.getParameter("info"));
//		 xml.append("</info>");
//		 xml.append("<value>");
//		 xml.append(request.getParameter("value"));
//		 xml.append("</value>");
//		 xml.append("<accountvalue>");
//		 xml.append(request.getParameter("accountvalue"));
		 xml.append("</accountvalue>");
		 xml.append("</root>");
		 String xmlcp = xml.toString();
		 System.out.println(xmlcp);
		try {
			// response.setContentType("text/xml");
			// response.setCharacterEncoding("gbk");
			// response.setHeader("Cache-Control", "no-cache");
			// response.setHeader("Pragma", "no-cache");
//			out = response.getWriter();
			out.write("OK");
			out.flush();
			out.close();
		} finally {
			if (out != null) {
				out.close();
			}
		}
		return null;
	}
}