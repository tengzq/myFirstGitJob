package com.pc.util;

import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

public class WjxsSettings {
	
	private static Logger logger = Logger.getLogger(WjxsSettings.class);
	
	public static void test() throws DocumentException{
		logger.info("[ ##################### XMLReaderUtil Start #################### ]");
		logger.info("[ Thread.currentThread().getContextClassLoader().getResource(\"\") :" + Thread.currentThread().getContextClassLoader().getResource("") + "]");
		Document doc =  new SAXReader().read(Thread.currentThread().getContextClassLoader().getResourceAsStream("settings.xml"));
		Element root = doc.getRootElement();
		Element settings = root.element("settings");
		Element ele = settings.element("regsendticket");
		Attribute a = ele.attribute("isopen");
		a.getData();
		a.getStringValue();
		logger.info(a.getStringValue());
		logger.info("[ ##################### XMLReaderUtil End #################### ]");
	}
	
	public static boolean isSendTicket(){
		Document doc;
		try {
			doc = new SAXReader().read(Thread.currentThread().getContextClassLoader().getResourceAsStream("settings.xml"));
			Element root = doc.getRootElement();
			Element settings = root.element("settings");
			Element ele = settings.element("regsendticket");
			Attribute a = ele.attribute("isopen");
			return Boolean.parseBoolean(a.getStringValue());
		} catch (DocumentException e) {
			logger.error("[读取xml出错]", e);
			return false;
		}
	}
	
	public static String presentTicketId(){
		Document doc;
		try {
			doc = new SAXReader().read(Thread.currentThread().getContextClassLoader().getResourceAsStream("settings.xml"));
			Element root = doc.getRootElement();
			Element settings = root.element("settings");
			Element ele = settings.element("present");
			Attribute a = ele.attribute("ticketid");
			return a.getStringValue();
		} catch (DocumentException e) {
			logger.error("[读取xml出错]", e);
			return null;
		}
	}
}
