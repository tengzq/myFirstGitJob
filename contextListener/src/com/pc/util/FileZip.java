package com.pc.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
//import java.util.zip.ZipEntry;
//import java.util.zip.ZipOutputStream;
import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipOutputStream;

public class FileZip {

	/**
	 * @param inputFileName
	 *            你要压缩的文件夹(整个完整路径)
	 * @param zipFileName
	 *            压缩后的文件(整个完整路径)
	 */
	public static void zip(String inputFileName, String zipFileName)
			throws Exception {
		zip(zipFileName, new File(inputFileName));
	}

	private static void zip(String zipFileName, File inputFile)
			throws Exception {
		ZipOutputStream out = new ZipOutputStream(new FileOutputStream(
				zipFileName));
		out.setEncoding(System.getProperty("sun.jnu.encoding"));
		zip(out, inputFile, "");
		out.close();
	}

	private static void zip(ZipOutputStream out, File f, String base)
			throws Exception {
		if (f.isDirectory()) {
			File[] fl = f.listFiles();
			base = base.length() == 0 ? "" : base + "/"; // 注意，这里用左斜杠
			out.putNextEntry(new ZipEntry(base));
			for (int i = 0; i < fl.length; i++) {
				zip(out, fl[i], base + fl[i].getName());
			}
		} else {
			out.putNextEntry(new ZipEntry(base));
			FileInputStream in = new FileInputStream(f);
			byte[] buffer = new byte[1024];
			int n = in.read(buffer);
			while (n != -1) {
				out.write(buffer, 0, n);
				n = in.read(buffer);
			}
			in.close();
		}
	}

	public static void main(String[] temp) {
		try {
			zip("D:\\Servers\\apache-tomcat-7.0.59\\webapps\\NPMYSQL\\admin00\\ftl\\code",
					"E:\\test.zip");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
