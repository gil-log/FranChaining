package com.franchaining.vo;

public class StockVO {
//추후에 다른것들 추가. (테이블을 추가하던 해서)
	private String s_name;
	private	String s_origin;
	private int s_no;
	private int s_price;
	private int s_size;
	private int s_cost;
	
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
		return "StockVO [s_name=" + s_name + ", s_origin=" + s_origin + ", s_no=" + s_no + ", s_price=" + s_price
				+ ", s_size=" + s_size + ", s_cost=" + s_cost + "]";
	}
}
