package com.pc.util;

import java.io.IOException;
import java.util.Properties;

import org.springframework.core.io.support.PropertiesLoaderUtils;

/**
 * 读取Properties文件工具类
 * @author lilei
 * TODO 待完善
 */

public class PropUtil {
	private static Logger logger=Logger.getLogger(PropUtil.class);
	
	/**
	 * 根据指定.properties文件获取Properties类
	 * @param resource
	 * @return
	 */
	public static Properties getProperties(String resource){
		try {
			Properties prop=PropertiesLoaderUtils.loadAllProperties(resource);
			return prop;
		} catch (IOException e) {
			logger.error("读取Properties文件出错！", e);
			return null;
		}
		
	}
	
	/**
	 * 传入.properties文件，property的key获取值
	 * @param resource
	 * @param key
	 * @return
	 */
	public static String getValue(String resource,String key){
		Properties prop=getProperties(resource);
		
		return prop==null?null:prop.getProperty(key);
	}
	
	public static void main(String[] args){
		System.out.println(getValue("program.properties","pg_test_ket"));
		String key="pg_abc";
		System.out.println(key.substring(0,3));
	}
}
