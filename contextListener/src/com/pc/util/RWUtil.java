package com.pc.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.io.Writer;

import org.slf4j.LoggerFactory;


/**
 * 读写文件工具类，目前用于将Ueditor内容写为HTML和读出HTML内容
 * @author lilei
 *
 */
public class RWUtil {
	
	private static org.slf4j.Logger logger = LoggerFactory.getLogger(Writer.class);
	
	/**
	 * 将制定内容写入制定目录的指定文件
	 * @param savePath 保存路径
	 * @param fileFullName 带扩展名的文件名
	 * @param content 要写入的内容
	 * @return
	 */
	public static boolean Write(String savePath,String fileFullName,String content){
		File file=new File(savePath,fileFullName);
		//判断文件的目录中是否有没有创建的
		if(!file.getParentFile().exists()){
			//有则先生成目录文件夹
			file.getParentFile().mkdirs();
		}
		OutputStream os=null;
		Writer writer=null;
		Writer out=null;
		try {
			os=new FileOutputStream(file);
			writer=new OutputStreamWriter(os,"utf-8");
			out=new BufferedWriter(writer);
			out.write(content);
			out.flush();
		} catch (IOException e) {
			logger.info("---- 获取输出流失败 ----");
			return false;
		}finally{
			try {
				out.close();
				writer.close();
				os.close();
			} catch (IOException e) {
				logger.error("----  输出流关闭失败  ----", e);
			}
		}
		logger.info("----  保存完成！  ----");
		return true;
	}
	
	/**
	 * 修改
	 * @param file 完整路径+文件完整名
	 * @param content
	 * @return
	 */
	public static boolean edit(String file,String content){
		OutputStream os=null;
		Writer writer=null;
		BufferedWriter out=null;
		try {
			os=new FileOutputStream(file);
			writer=new OutputStreamWriter(os,"utf-8");
			out=new BufferedWriter(writer);
			out.write(content);
			out.flush();
		} catch (IOException e) {
			logger.error("---- 写入失败 ----", e);
			return false;
		}finally{
			try {
				out.close();
				writer.close();
				os.close();
			} catch (IOException e) {
				logger.error("----  输出流关闭失败  ----", e);
			}
		}
		logger.info("----  保存完成！  ----");
		return true;
	}
	
	/**
	 * 读取文件内容
	 * @param file 完整路径+完整文件名
	 * @return
	 * @throws IOException
	 */
	public static String Read(String file) throws IOException{
		FileInputStream fis = null;
		Reader ir = null;
		BufferedReader br = null;
		try {
			String line="";
			StringBuffer buffer=new StringBuffer();
			fis=new FileInputStream(file);
			ir=new InputStreamReader(fis,"utf-8");
			br=new BufferedReader(ir);
			while((line=br.readLine())!=null){
				buffer.append(line);
			}
			return buffer.toString();
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}finally{
			br.close();
			ir.close();
			fis.close();
			
		}
	}
}
