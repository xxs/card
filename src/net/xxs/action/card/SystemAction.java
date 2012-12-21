package net.xxs.action.card;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 前台Action类 - 系统
 */

public class SystemAction extends ActionSupport {

	private static final long serialVersionUID = 4535356901892013943L;

	@Action("/SYSTEM")
	public String execute() {
		try {
			byte[] b = {83, 72, 79, 80, 43, 43, 32, 86, 50, 46, 48, 32, 32, 32, 67, 111, 112, 121, 114, 105, 103, 104, 116, 32, 40, 99, 41, 32, 50, 48, 49, 49, 32, 115, 104, 111, 112, 120, 120, 46, 110, 101, 116, 32, 65, 108, 108, 32, 82, 105, 103, 104, 116, 115, 32, 82, 101, 115, 101, 114, 118, 101, 100, 46};
			HttpServletResponse response = ServletActionContext.getResponse();
			PrintWriter printWriter = response.getWriter();
			printWriter.write(new String(b));
			printWriter.flush();
			printWriter.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return NONE;
	}

}