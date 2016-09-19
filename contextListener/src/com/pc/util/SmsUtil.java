package com.pc.util;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.naming.spi.DirStateFactory.Result;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;



import org.apache.ibatis.annotations.ResultMap;
import org.dom4j.Document;   
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;   
import org.dom4j.Element;   

/**
 * 通过短信接口发送短信
 */
public class SmsUtil {
	
	private static Logger logger = Logger.getLogger(SmsUtil.class);

	private static Properties prop;
	
	private static String uid;
	
	private static String pwd;
	
	static {   
	        	//InputStream in = new FileInputStream("/resources/sms.properties"); 
	            uid = (String) MiceConfig.getContextProperty("sms_uid");
	            pwd = MD5.md5((String) MiceConfig.getContextProperty("sms_pwd"));
	}   
	
	public static void main(String [] args) throws UnsupportedEncodingException {
		
		//sendSms2("13511111111","您的验证码是：1111。请不要把验证码泄露给其他人。");
		//sendSmsAll(List<PageData> list)
		
		//sendSms1();
		/*String uid = "15040598011";
		String pwd = MD5.md5("leo123456");
		String mobile = "13811733978";
		String msg = "您的验证码为：2312【账房先生】";
		String dtime = DateUtil.getTime();
		String linkid = UuidUtil.get32UUID();
		//sms3(uid, pwd, mobile, msg, dtime, linkid);
		String tString="0我爱吃";
		System.out.println(Integer.parseInt(tString.substring(0, 1)));*/
		//sms4("15040598011", MD5.md5("leo123456"), "15910395975", "qweqweqwe",DateUtil.getTime() , UuidUtil.get32UUID());
		sms4("15910395975", "sms_first_login", "123");
	}
	


	 //短信商 一  http://www.dxton.com/ =====================================================================================
	/**
	 * 给一个人发送单条短信
	 * @param mobile 手机号
	 * @param code  短信内容
	 */
 	public static void sendSms1(String mobile,String code){
 		
	    String account = "", password = "";
	    String strSMS1 = Tools.readTxtFile(Const.SMS1);			//读取短信1配置
		if(null != strSMS1 && !"".equals(strSMS1)){
			String strS1[] = strSMS1.split(",fh,");
			if(strS1.length == 2){
				account = strS1[0];
				password = strS1[1];
			}
		}
 		String PostData = "";
		try {
			PostData = "account="+account+"&password="+password+"&mobile="+mobile+"&content="+URLEncoder.encode(code,"utf-8");
		} catch (UnsupportedEncodingException e) {
			System.out.println("短信提交失败");
		}
		 //System.out.println(PostData);
 	     String ret = SMS(PostData, "http://sms.106jiekou.com/utf8/sms.aspx");
 	     System.out.println(ret);
 	   /*  
 	   100			发送成功
 	   101			验证失败
 	   102			手机号码格式不正确
 	   103			会员级别不够
 	   104			内容未审核
 	   105			内容过多
 	   106			账户余额不足
 	   107			Ip受限
 	   108			手机号码发送太频繁，请换号或隔天再发
 	   109			帐号被锁定
 	   110			发送通道不正确
 	   111			当前时间段禁止短信发送
 	   120			系统升级
		*/
 	     
	}
	
	 public static String SMS(String postData, String postUrl) {
	        try {
	            //发送POST请求
	            URL url = new URL(postUrl);
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	            conn.setRequestMethod("POST");
	            conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
	            conn.setRequestProperty("Connection", "Keep-Alive");
	            conn.setUseCaches(false);
	            conn.setDoOutput(true);

	            conn.setRequestProperty("Content-Length", "" + postData.length());
	            OutputStreamWriter out = new OutputStreamWriter(conn.getOutputStream(), "UTF-8");
	            out.write(postData);
	            out.flush();
	            out.close();

	            //获取响应状态
	            if (conn.getResponseCode() != HttpURLConnection.HTTP_OK) {
	                System.out.println("connect failed!");
	                return "";
	            }
	            //获取响应内容体
	            String line, result = "";
	            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
	            while ((line = in.readLine()) != null) {
	                result += line + "\n";
	            }
	            in.close();
	            return result;
	        } catch (IOException e) {
	            e.printStackTrace(System.out);
	        }
	        return "";
	    }
	 //===================================================================================================================
	 
	 
	/**
	 * 
	 * 短信商 二  http://www.ihuyi.com/ =====================================================================================
	 * 
	 */
	private static String Url = "http://106.ihuyi.com/webservice/sms.php?method=Submit";
	
	
	
	/**
	 * 给一个人发送单条短信
	 * @param mobile 手机号
	 * @param code  短信内容
	 */
	public static void sendSms2(String mobile,String code){
		HttpClient client = new HttpClient(); 
		PostMethod method = new PostMethod(Url); 
			
		client.getParams().setContentCharset("UTF-8");
		method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=UTF-8");

	    String content = new String(code);  
	    
	    String account = "", password = "";
	    String strSMS2 = Tools.readTxtFile(Const.SMS2);			//读取短信2配置
		if(null != strSMS2 && !"".equals(strSMS2)){
			String strS2[] = strSMS2.split(",fh,");
			if(strS2.length == 2){
				account = strS2[0];
				password = strS2[1];
			}
		}
	    
		NameValuePair[] data = {//提交短信
		    new NameValuePair("account", account), 
		    new NameValuePair("password", password), 			//密码可以使用明文密码或使用32位MD5加密
		    new NameValuePair("mobile", mobile), 
		    new NameValuePair("content", content),
		};
		
		method.setRequestBody(data);
		
		try {
			client.executeMethod(method);
			
			String SubmitResult =method.getResponseBodyAsString();
					
			Document doc = DocumentHelper.parseText(SubmitResult); 
			Element root = doc.getRootElement();


			code = root.elementText("code");
			String msg = root.elementText("msg");
			String smsid = root.elementText("smsid");
			
			
			System.out.println(code);
			System.out.println(msg);
			System.out.println(smsid);
			
			if(code == "2"){
				System.out.println("短信提交成功");
			}
			
		} catch (HttpException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		}	
		
	}
	
	/**
	 * 给多个人发送单条短信
	 * @param list 手机号验证码
	 */
	public static void sendSmsAll(List<PageData> list){
		String code;
		String mobile;
		for(int i=0;i<list.size();i++){
			code=list.get(i).get("code").toString();
			mobile=list.get(i).get("mobile").toString();
			sendSms2(mobile,code);
		}
	}
	// =================================================================================================
	
	/**
	 * 短信接口
	 * @param uid
	 * @param pwd
	 * @param mobile
	 * @param msg
	 * @param dtime
	 * @param linkid
	 */
	public static Map<String,String> sms3(String uid,String pwd,String mobile,String msg,String dtime,String linkid){
		Map<String, String> resultMap = new HashMap<String, String>();
		HttpClient client=new HttpClient();
		PostMethod post=new PostMethod("http://www.smsadmin.cn/smsmarketing/wwwroot/api/post_send_md5/");
		post.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=GB2312");
		NameValuePair[] content = {
				new NameValuePair("uid", uid),
				new NameValuePair("pwd", pwd),
				new NameValuePair("mobile", mobile),
				new NameValuePair("msg", msg),
				new NameValuePair("dtime", dtime),
				new NameValuePair("linkid", linkid),
		};
		post.setRequestBody(content);
		try {
			client.executeMethod(post);
			//Header[] headers = post.getResponseHeaders();  
	        int statusCode = post.getStatusCode();  
	        System.out.println("statusCode:" + statusCode);  
	        /*for (Header h : headers) {  
	            System.out.println("---" + h.toString());  
	        } */ 
	        String returnC = new String(post.getResponseBodyAsString().getBytes("GB2312"));  
	        logger.info("[短信平台返回数据："+returnC+"]");
	        int status = Integer.parseInt(returnC.substring(0, 1));
	        if(status==0){
	        	resultMap.put("status", "success");
	        }
	        if(status==5){
	        	resultMap.put("status", "mobileerr");
	        }
		} catch (IOException e) {
			logger.error("[执行PostMethod失败]", e);
			resultMap.put("status", "httperr");
			return resultMap;
		}
		return resultMap;
	}
	
	/**
	 * 发短信，成功true,其他false
	 * @param uid
	 * @param pwd
	 * @param mobile
	 * @param msg
	 * @param dtime
	 * @param linkid
	 * @return
	 */
	public static boolean sms4(String uid,String pwd,String mobile,String msg,String dtime,String linkid){
		HttpClient client=new HttpClient();
		PostMethod post=new PostMethod("http://www.smsadmin.cn/smsmarketing/wwwroot/api/post_send_md5/");
		post.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=GB2312");
		NameValuePair[] content = {
				new NameValuePair("uid", uid),
				new NameValuePair("pwd", pwd),
				new NameValuePair("mobile", mobile),
				new NameValuePair("msg", msg),
				new NameValuePair("dtime", dtime),
				new NameValuePair("linkid", linkid),
		};
		post.setRequestBody(content);
		try {
			client.executeMethod(post);
		        int statusCode = post.getStatusCode();  
		        System.out.println("statusCode:" + statusCode);  
		        String returnC = new String(post.getResponseBody(),"GB2312");
				
		        logger.info("[短信平台返回数据："+returnC+"]");
		        int status = Integer.parseInt(returnC.substring(0, 1));
		        if(status==0){
		        	return true;
		        }
		} catch (IOException e) {
			logger.error("[执行PostMethod失败]", e);
		}
		return false;
	}
	
	/**
	 * 发短信，成功true,其他false
	 * @param uid
	 * @param pwd
	 * @param mobile
	 * @param msg
	 * @param dtime
	 * @param linkid
	 * @return
	 */
	public static boolean sms4(String mobile, String msg, String... arg){
		HttpClient client=new HttpClient();
		PostMethod post=new PostMethod("http://www.smsadmin.cn/smsmarketing/wwwroot/api/post_send_md5/");
		post.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=GB2312");
		String str = (String) MiceConfig.getContextProperty(msg);
		for (int i = 0; i < arg.length; i++) {
			str = str.replaceFirst("%P%", arg[i]);
		}
		logger.info("短信验证：---------phoneNumber:"+mobile+",checkCode" + str);
		NameValuePair[] content = {
				new NameValuePair("uid", uid),
				new NameValuePair("pwd", pwd),
				new NameValuePair("mobile", mobile),
				new NameValuePair("msg", str),
				new NameValuePair("dtime", DateUtil.getTime()),
				new NameValuePair("linkid", UuidUtil.get32UUID()),
		};
		
		post.setRequestBody(content);
		try {
			client.executeMethod(post);
		        int statusCode = post.getStatusCode();  
		        System.out.println("statusCode:" + statusCode);  
		        String returnC = new String(post.getResponseBody(),"GB2312");
				
		        logger.info("[短信平台返回数据："+returnC+"]");
		        int status = Integer.parseInt(returnC.substring(0, 1));
		        if(status==0){
		        	return true;
		        }
		} catch (IOException e) {
			logger.error("[执行PostMethod失败]", e);
		}
		return false;
	}
	
	
	/**
	 * 发送短信类
	 * @param content
	 * @param mobile
	 * @return
	 */
	public static boolean sendSmsCommon(String content,String mobile){
		String uid = (String) MiceConfig.getContextProperty("sms_uid");
		String pwd = MD5.md5((String) MiceConfig.getContextProperty("sms_pwd"));
		logger.info("【发送短信】");
		try {
			return sms5(uid, pwd, mobile, content, DateUtil.getTime(), UuidUtil.get32UUID());
		} catch (UnsupportedEncodingException e) {
			return false;
		}
	}
	
	
	/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
	
	public static boolean sms5(String uid,String pwd,String mobile,String msg,String dtime,String linkid) throws UnsupportedEncodingException{
		HttpClient client=new HttpClient();
		PostMethod post=new PostMethod("http://http.yunsms.cn/tx/");
		post.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=GBK");
		NameValuePair[] content = {
				new NameValuePair("uid", uid),
				new NameValuePair("pwd", pwd),
				new NameValuePair("mobile", mobile),
				new NameValuePair("content", URLEncoder.encode(msg,"GBK")),
				
		};
		post.setRequestBody(content);
		try {
			client.executeMethod(post);
			//Header[] headers = post.getResponseHeaders();  
		        int statusCode = post.getStatusCode();  
		        System.out.println("statusCode:" + statusCode);  
		        /*for (Header h : headers) {  
		            System.out.println("---" + h.toString());  
		        } */ 
		        String returnC = new String(post.getResponseBody(),"GBK");
				
		        logger.info("[短信平台返回数据："+returnC+"]");
		        int status = Integer.parseInt(returnC);
		        if(100==status){
		        	return true;
		        }
		} catch (IOException e) {
			logger.error("[执行PostMethod失败]", e);
		}
		return false;
	}
	
	
}

