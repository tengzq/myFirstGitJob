package com.rcb.pc.frame.kit;

import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * 时间类
 * @author hle
 *
 */
public class DateUtil {

	//时间格式
	public static final String DATETIMEFORMAR="yyyy-MM-dd HH:mm:ss";
	
	//日期格式
	public static final String DATEFORMAT="yyyy-MM-dd";
	
	
	/**
	 * 判断开始时间是否大于结束时间
	 * @param startDate 开始时间
	 * @param endDate 结束日期
	 * @param format  时间规则
	 * @return
	 * @throws ParseException
	 */
	public static boolean compareTwoDate(String startDate,String endDate,String format) throws ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat(format);
		if(sdf.parse(startDate).getTime()>sdf.parse(endDate).getTime()){
			return false;
		}
		return true;
	}
	
}
