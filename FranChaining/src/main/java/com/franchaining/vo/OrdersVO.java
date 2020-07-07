package com.franchaining.vo;

import java.sql.Date;

public class OrdersVO {
	
	private String b_no;
	private	String s_no;
	private int o_flag;
	private int o_amount;
	private Date o_date;
	
	
	public String getB_no() {
		return b_no;
	}
	public void setB_no(String b_no) {
		this.b_no = b_no;
	}
	public String getS_no() {
		return s_no;
	}
	public void setS_no(String s_no) {
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
	public Date getO_date() {
		return o_date;
	}
	public void setO_date(Date o_date) {
		this.o_date = o_date;
	}
	@Override
	public String toString() {
		return "OrdersVO [b_no=" + b_no + ", s_no=" + s_no + ", o_flag=" + o_flag + ", o_amount=" + o_amount
				+ ", o_date=" + o_date + "]";
	}

	
}
