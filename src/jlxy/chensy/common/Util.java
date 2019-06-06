package jlxy.chensy.common;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

public class Util {

	/**
	 * 将日期格式化为字符串
	 * @param date
	 * @return
	 */
	public static String dateToString(Date date) {
		return dateToString(date, "yyyy-MM-dd HH:mm:ss");
	}

	/**
	 * 将日期格式化为字符串
	 * @param date 日期
	 * @param formatType 格式化方式
	 * @return
	 */
	public static String dateToString(Date date, String formatType) {
		if (date == null) {
			date = new Date();
		}
		SimpleDateFormat formatter = new SimpleDateFormat(formatType);
		return formatter.format(date);
	}

	/**
	 * 将空串""转为null
	 * @param input 需要转换的字符串
	 * @return
	 */
	public static String emptyToNull(String input) {
		return "".equals(input) ? null : input;
	}

	/**
	 * 将null转为空串""
	 * @param input 需要转换的字符串
	 * @return
	 */
	public static String nullToEmpty(String input) {
		return input == null ? "" : input;
	}

	/**
	 * 从Request对象获取参数并转换中文字符串编码
	 * @param request Request对象
	 * @param key 参数名称
	 * @return 取得的参数。如果参数为空""或null，返回""
	 */
	public static String getParameter(HttpServletRequest request, String key) {
		String result = request.getParameter(key);
		if (isNullOrEmpty(result))
			return "";
		// 转换中文字符编码
		try {
			result = new String(result.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 验证字符串是否为空 = "" or = null 
	 * @param input 需要验证的字符串
	 * @return true/false
	 */
	public static boolean isNullOrEmpty(String input) {
		return "".equals(input) || input == null;
	}

	/**
	 * 匹配正则表达式
	 * @param input 需要进行匹配的字符串
	 * @param pattern 正则表达式
	 * @return true/false
	 */
	public static boolean regexMatch(String input, String pattern) {
		if (isNullOrEmpty(input))
			return false;
		return Pattern.compile(pattern).matcher(input).matches();
	}
}
