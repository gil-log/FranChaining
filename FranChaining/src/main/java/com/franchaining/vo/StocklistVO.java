package com.franchaining.vo;

public class StocklistVO {
	
	private String s_name;
	private	String s_origin;
	private int s_no;
	private int s_price;
	private int s_size;
	private int s_cost;
	private int o_amount;
	
	public int getO_amount() {
		return o_amount;
	}
	public void setO_amount(int o_amount) {
		this.o_amount = o_amount;
	}
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public int getS_price() {
		return s_price;
	}
	public void setS_price(int s_price) {
		this.s_price = s_price;
	}
	public int getS_size() {
		return s_size;
	}
	public void setS_size(int s_size) {
		this.s_size = s_size;
	}
	public int getS_cost() {
		return s_cost;
	}
	public void setS_cost(int s_cost) {
		this.s_cost = s_cost;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getS_origin() {
		return s_origin;
	}
	public void setS_origin(String s_origin) {
		this.s_origin = s_origin;
	}
	
	@Override
	public String toString() {
		return "StocklistVO [s_name=" + s_name + ", s_origin=" + s_origin + ", s_no=" + s_no + ", s_price=" + s_price
				+ ", s_size=" + s_size + ", s_cost=" + s_cost + ", o_amount=" + o_amount + "]";
	}
}
