package jlxy.chensy.util;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

public class Util {

	public String getParameter(HttpServletRequest request, String key) {
		String res = request.getParameter(key);
		if (res != null) {
			try {
				res = new String(res.getBytes("ISO-8859-1"), "utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
			return res;
		} else
			return "";
	}

}
