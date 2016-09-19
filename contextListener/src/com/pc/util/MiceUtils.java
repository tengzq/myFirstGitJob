package com.pc.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

/**
 * 
 * 类名称：MiceUtils.java 类描述：经常使用的类方法
 * 
 * @author chenph
 * @CreateDate：2015年5月16日
 * @version 1.0
 */
public class MiceUtils {
	// 从user-agent中取出手机类型
	// static Pattern pattern =
	// Pattern.compile(";\\s?(\\S*?\\s?\\S*?)\\s?(Build)?/");
	static Pattern pattern = Pattern
			.compile(";\\s?[^;\\s]*?(\\s?\\S*?)\\s?(Build)?/");

	/**
	 * 获取手机类型
	 * 
	 * @param agent
	 * @return
	 */
	public static String getMobileType(String agent) {
		if (agent.indexOf("iPhone") != -1) {
			return "iPhone";
		}
		Matcher matcher = pattern.matcher(agent);
		String model = null;
		if (matcher.find()) {
			model = matcher.group(1).trim();
			return model;
		}
		return "";
	}

	/**
	 * 获取ip
	 * @param request
	 * @return
	 */
	public static String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader(" x-forwarded-for ");
		if (ip == null || ip.length() == 0 || " unknown ".equalsIgnoreCase(ip)) {
			ip = request.getHeader(" Proxy-Client-IP ");
		}
		if (ip == null || ip.length() == 0 || " unknown ".equalsIgnoreCase(ip)) {
			ip = request.getHeader(" WL-Proxy-Client-IP ");
		}
		if (ip == null || ip.length() == 0 || " unknown ".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}

	public static void main(String args[]) {
		// String agent =
		// "Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; XT1079 Build/LXB22.99-7.1) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.4.0.558 U3/0.8.0 Mobile Safari/534.30";
		String agent = "Mozilla/5.0 (iPhone; CPU iPhone OS 8_2 like Mac OS X; zh-CN) AppleWebKit/537.51.1 (KHTML, like Gecko) Mobile/12D508 UCBrowser/10.4.5.568 Mobile";
		System.out.println(MiceUtils.getMobileType(agent));
	}
}
