package com.pc.util;

public enum Generalize {
	YY(2,"yy"),
	AWB(3,"awb");
	
	private final int comingFrom;
	private final String generalizeName;
	
	private Generalize(int comingFrom,String generalizeName){
		this.comingFrom = comingFrom;
		this.generalizeName = generalizeName;
	}

	public int getComingFrom() {
		return comingFrom;
	}

	public String getGeneralizeName() {
		return generalizeName;
	}
	
	public static Generalize getGeneralize(String str){
		for(Generalize g : Generalize.values()){
			if(str.indexOf(g.getGeneralizeName()) > -1){
				return g;
			}
		}
		return null;
	}
	
	
}
