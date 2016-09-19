package com.pc.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import freemarker.template.SimpleDate;

public class DateUtil {
	private final static SimpleDateFormat sdfYear = new SimpleDateFormat("yyyy");

	private final static SimpleDateFormat sdfDay = new SimpleDateFormat(
			"yyyy-MM-dd");
	
	private final static SimpleDateFormat sdfDays = new SimpleDateFormat(
	"yyyyMMdd");

	private final static SimpleDateFormat sdfTime = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");
	
	private final static SimpleDateFormat sdfTime4File = new SimpleDateFormat("yyyyMMddHHmmssSSS");
	
	private final static SimpleDateFormat sdfPureTime = new SimpleDateFormat("HHmmss");
	
	private final static SimpleDateFormat sdfChineseTime = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒");
	
	/**
	 * 获取yyyyMMddHHmmss格式日期时间字符串
	 * @return
	 */
	public static String getTime4FileName(){
		return sdfTime4File.format(new Date());
	}
	
	
	/**
	 * 获取YYYY格式
	 * 
	 * @return
	 */
	public static String getYear() {
		return sdfYear.format(new Date());
	}

	/**
	 * 获取YYYY-MM-DD格式
	 * 
	 * @return
	 */
	public static String getDay() {
		return sdfDay.format(new Date());
	}
	
	/**
	 * 获取YYYYMMDD格式
	 * 
	 * @return
	 */
	public static String getDays(){
		return sdfDays.format(new Date());
	}

	/**
	 * 获取YYYY-MM-DD HH:mm:ss格式
	 * 
	 * @return
	 */
	public static String getTime() {
		return sdfTime.format(new Date());
	}
	
	/**
	 * eg.2015年01月01日 13时27分15秒
	 * @return
	 */
	public static String getChineseTime(){
		return sdfChineseTime.format(new Date());
	}
	
	public static String getPureTime(){
		return sdfPureTime.format(new Date());
	}
	
	/**
	* @Title: compareDate
	* @Description: TODO(日期比较，如果s>=e 返回true 否则返回false)
	* @param s
	* @param e
	* @return boolean  
	* @throws
	* @author luguosui
	 */
	public static boolean compareDate(String s, String e) {
		if(fomatDate(s)==null||fomatDate(e)==null){
			return false;
		}
		return fomatDate(s).getTime() >=fomatDate(e).getTime();
	}
	
	public static boolean compare2(String s, String e) {
		if(fomatDate(s)==null||fomatDate(e)==null){
			return false;
		}
		return fomatDate(s).getTime() < fomatDate(e).getTime();
	}

	/**
	 * 格式化日期
	 * 
	 * @return
	 */
	public static Date fomatDate(String date) {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		try {
			return fmt.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * date转dateString
	 * <li> yyyy-MM-dd HH:mm:ss
	 * @param date
	 * @return
	 */
	public static String date2String(Date date){
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try{
			return fmt.format(date);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * date转dateString
	 * <li> yyyyMMddHHmmss
	 * @param date
	 * @return
	 */
	public static String date2str(Date date){
		DateFormat fmt = new SimpleDateFormat("yyyyMMddHHmmss");
		try{
			return fmt.format(date);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	
	/**
	 * yyyy-MM-dd
	 * @param date
	 * @return
	 */
	public static String dateStr(Date date){
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		try{
			return fmt.format(date);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	
	
	
	/**
	 * yyyy-MM-dd
	 * @param date
	 * @return
	 */
	public static String strDateStr(String date){
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		try{
			Date d = fomatDate(date);
			return fmt.format(d);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 校验日期是否合法
	 * 
	 * @return
	 */
	public static boolean isValidDate(String s) {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		try {
			fmt.parse(s);
			return true;
		} catch (Exception e) {
			// 如果throw java.text.ParseException或者NullPointerException，就说明格式不对
			return false;
		}
	}
	public static int getDiffYear(String startTime,String endTime) {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		try {
			long aa=0;
			int years=(int) (((fmt.parse(endTime).getTime()-fmt.parse(startTime).getTime())/ (1000 * 60 * 60 * 24))/365);
			return years;
		} catch (Exception e) {
			// 如果throw java.text.ParseException或者NullPointerException，就说明格式不对
			return 0;
		}
	}
	  /**
     * <li>功能描述：时间相减得到天数
     * @param beginDateStr
     * @param endDateStr
     * @return
     * long 
     * @author Administrator
     */
    public static long getDaySub(String beginDateStr,String endDateStr){
        long day=0;
        java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd");
        java.util.Date beginDate = null;
        java.util.Date endDate = null;
        
            try {
				beginDate = format.parse(beginDateStr);
				endDate= format.parse(endDateStr);
			} catch (ParseException e) {
				e.printStackTrace();
			}
            day=(endDate.getTime()-beginDate.getTime())/(24*60*60*1000);
            //System.out.println("相隔的天数="+day);
      
        return day;
    }
    
    /**
     * 得到n天之后的日期
     * @param days
     * @return
     */
    public static String getAfterDayDate(String days) {
    	int daysInt = Integer.parseInt(days);
    	
        Calendar canlendar = Calendar.getInstance(); // java.util包
        canlendar.add(Calendar.DATE, daysInt); // 日期减 如果不够减会将月变动
        Date date = canlendar.getTime();
        
        SimpleDateFormat sdfd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateStr = sdfd.format(date);
        
        return dateStr;
    }
    
    /**
     * 获取指定日期days天后的日期
     * @param date
     * @return
     */
    public static Date getAfterDayDate(Date date,Integer days) {
    	
        Calendar calendar = Calendar.getInstance(); // java.util包
        calendar.setTime(date);
        calendar.add(Calendar.DATE, days); // 日期减 如果不够减会将月变动
        Date dateReturn = calendar.getTime();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateString=sdf.format(dateReturn);
        Date d=null;
		try {
			d = sdf.parse(dateString);
		} catch (ParseException e) {
			
		}
        return d;
    }
    
    
    /**
     * 得到n天之后是周几
     * @param days
     * @return
     */
    public static String getAfterDayWeek(String days) {
    	int daysInt = Integer.parseInt(days);
    	
        Calendar canlendar = Calendar.getInstance(); // java.util包
        canlendar.add(Calendar.DATE, daysInt); // 日期减 如果不够减会将月变动
        Date date = canlendar.getTime();
        
        SimpleDateFormat sdf = new SimpleDateFormat("E");
        String dateStr = sdf.format(date);
        
        return dateStr;
    }
    
    /**
     * 当前之间距离明天0点还有多少秒
     * @return
     */
    public static int sec2tomorrow0(){
    	Date nowDate = new Date();
    	
    	Calendar cal = Calendar.getInstance();
    	cal.setTime(nowDate);
    	cal.add(Calendar.DAY_OF_MONTH, 1);
    	cal.set(Calendar.HOUR_OF_DAY, 0);
    	cal.set(Calendar.MINUTE, 0);
    	cal.set(Calendar.SECOND, 0);
    	cal.set(Calendar.MILLISECOND, 0);
    	long tomorrowMsec = cal.getTime().getTime();
    	long nowMsec = nowDate.getTime();
    	
    	return (int)(tomorrowMsec - nowMsec)/1000;
    }
    
    public static void main(String[] args) {
    	System.out.println(getDays());
    	System.out.println(getAfterDayWeek("3"));
    	System.out.println(getAfterDayDate(new Date(),1));
    	System.out.println(strDateStr("2015-09-09 00:00:00"));
    	String cur = date2String(new Date());
    	String next = "2015-11-30 23:59:59";
    	System.out.println(getDaySub(cur, next));
    	
    	Calendar cal = Calendar.getInstance();
    	cal.setTime(new Date());
    	cal.add(Calendar.DAY_OF_MONTH, 1);
    	cal.set(Calendar.HOUR_OF_DAY, 0);
    	cal.set(Calendar.MINUTE, 0);
    	cal.set(Calendar.SECOND, 0);
    	cal.set(Calendar.MILLISECOND, 0);
    	System.out.println("明天0点："+cal.getTime());
    	System.out.println((int)((cal.getTime().getTime() - new Date().getTime())/1000));
    	System.out.println(sec2tomorrow0());
    }

}
