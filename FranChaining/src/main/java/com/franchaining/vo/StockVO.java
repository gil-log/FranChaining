package com.franchaining.vo;

public class StockVO {
	
	private int s_no;
	private String s_name;
	private int s_price;
	private	String s_origin;
	private int s_size;
	private int s_cost;
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public int getS_price() {
		return s_price;
	}
	public void setS_price(int s_price) {
		this.s_price = s_price;
	}
	public String getS_origin() {
		return s_origin;
	}
	public void setS_origin(String s_origin) {
		this.s_origin = s_origin;
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
	@Override
	public String toString() {
		return "StockVO [s_no=" + s_no + ", s_name=" + s_name + ", s_price=" + s_price + ", s_origin=" + s_origin
				+ ", s_size=" + s_size + ", s_cost=" + s_cost + "]";
	}
	
	
	
	
	
}
