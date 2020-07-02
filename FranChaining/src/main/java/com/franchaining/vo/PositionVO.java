package com.franchaining.vo;

public class PositionVO {
	
	private int p_no;
	private String p_name;
	
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	
	@Override
	public String toString() {
		return "PositionVO [p_no=" + p_no + ", p_name=" + p_name + "]";
	}

}
