package com.pc.util;

import java.util.Date;

/**
 * FishingSingle 存储全局变量
 * 
 * @author admin
 * 
 */
public class WanjinSingle {

	private WanjinSingle() {

	}
	

	public static WanjinSingle instance = null;

	static {
		instance = new WanjinSingle();
	}

	// js sdk凭证生成时间
	private Date jsGenerateTime;

	// js sdk加密凭证
	private String jsTicket;

	public Date getJsGenerateTime() {
		return jsGenerateTime;
	}

	public void setJsGenerateTime(Date jsGenerateTime) {
		this.jsGenerateTime = jsGenerateTime;
	}

	public String getJsTicket() {
		return jsTicket;
	}

	public void setJsTicket(String jsTicket) {
		this.jsTicket = jsTicket;
	}

}
