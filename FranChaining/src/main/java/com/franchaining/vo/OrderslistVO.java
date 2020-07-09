package com.franchaining.vo;

import java.util.Date;

public class OrderslistVO {

	private int b_no;	// 지점 번호
	private int s_no;	// 재고물품 번호
	private int o_flag;	// 0: 재고  1: 대기 2: 미승인 3: 승인 4: 거절
	private int o_amount;	//재고 당 신청량
	private String o_date;
	private String o_deadline;
	private int o_no;
	private String s_name;
	private String s_origin;
	private int s_size;
	private int s_price;
	private int s_cost;

	public int getS_price() {
		return s_price;
	}
	public void setS_price(int s_price) {
		this.s_price = s_price;
	}
	public int getS_cost() {
		return s_cost;
	}
	public void setS_cost(int s_cost) {
		this.s_cost = s_cost;
	}
	public int getS_size() {
		return s_size;
	}
	public void setS_size(int s_size) {
		this.s_size = s_size;
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
	public int getO_no() {
		return o_no;
	}
	public void setO_no(int o_no) {
		this.o_no = o_no;
	}

	public String getO_deadline() {
		return o_deadline;
	}
	public void setO_deadline(String o_deadline) {
		this.o_deadline = o_deadline;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public int getO_flag() {
		return o_flag;
	}
	public void setO_flag(int o_flag) {
		this.o_flag = o_flag;
	}
	public int getO_amount() {
		return o_amount;
	}
	public void setO_amount(int o_amount) {
		this.o_amount = o_amount;
	}
	public String getO_date() {
		return o_date;
	}
	public void setO_date(String o_date) {
		this.o_date = o_date;
	}
	
	@Override
	public String toString() {
		return "OrderslistVO [b_no=" + b_no + ", s_no=" + s_no + ", o_flag=" + o_flag + ", o_amount=" + o_amount
				+ ", o_date=" + o_date + ", o_deadline=" + o_deadline + ", o_no=" + o_no + ", s_name=" + s_name
				+ ", s_origin=" + s_origin + ", s_size=" + s_size + ", s_price=" + s_price + ", s_cost=" + s_cost + "]";
	}
}
