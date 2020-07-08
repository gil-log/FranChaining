package com.franchaining.vo;

public class StockVO {
//추후에 다른것들 추가. (테이블을 추가하던 해서)
	private String s_name;
	private String o_amount;
	private String s_price;
	private	String s_origin;
	
	
	
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getO_amount() {
		return o_amount;
	}
	public void setO_amount(String o_amount) {
		this.o_amount = o_amount;
	}
	public String getS_price() {
		return s_price;
	}
	public void setS_price(String s_price) {
		this.s_price = s_price;
	}
	public String getS_origin() {
		return s_origin;
	}
	public void setS_origin(String s_origin) {
		this.s_origin = s_origin;
	}
	

	@Override
	public String toString() {
		return "StockVO [s_name=" + s_name + ", o_amount=" + o_amount + ",s_price=" + s_price + ", s_origin=" + s_origin + "]";
	}

}
