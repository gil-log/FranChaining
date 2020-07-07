package com.franchaining.vo;

import java.util.Date;

public class OrdersVO {
	private int b_no;	// 지점 번호
	private int s_no;	// 재고물품 번호
	private int o_flag;	// 0: 재고  1: 대기 2: 미승인 3: 승인 4: 거절
	private int o_amount;	//재고 당 신청량
	private Date o_date;
	private Date o_deadline;
	
	public Date getO_deadline() {
		return o_deadline;
	}
	public void setO_deadline(Date o_deadline) {
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
	public Date getO_date() {
		return o_date;
	}
	public void setO_date(Date o_date) {
		this.o_date = o_date;
	}
	
	@Override
	public String toString() {
		return "OrdersVO [b_no=" + b_no + ", s_no=" + s_no + ", o_flag=" + o_flag + ", o_amount=" + o_amount
				+ ", o_date=" + o_date + ", o_deadline=" + o_deadline + "]";
	}
}
