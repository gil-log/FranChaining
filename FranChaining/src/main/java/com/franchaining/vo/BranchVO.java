package com.franchaining.vo;

public class BranchVO {
	
	private int b_no;
	private String b_name;
	private String e_name;
	private int b_phone1;
	private int b_phone2;
	private int b_phone3;
	

	public String getE_name() {
		return e_name;
	}
	public void setE_name(String e_name) {
		this.e_name = e_name;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public int getB_phone1() {
		return b_phone1;
	}
	public void setB_phone1(int b_phone1) {
		this.b_phone1 = b_phone1;
	}
	public int getB_phone2() {
		return b_phone2;
	}
	public void setB_phone2(int b_phone2) {
		this.b_phone2 = b_phone2;
	}
	public int getB_phone3() {
		return b_phone3;
	}
	public void setB_phone3(int b_phone3) {
		this.b_phone3 = b_phone3;
	}
	
	public String addPhoneNum() {
		int ip1 = b_phone1;
		int ip2 = b_phone2;
		int ip3 = b_phone3;
		
		String p1 = '0' + String.valueOf(ip1);
		String p2 = String.valueOf(ip2);
		String p3 = String.valueOf(ip3);
		
		String phone = p1+"-"+p2+"-"+p3;
		
		return phone;
	}
	
	@Override
	public String toString() {
		return "BranchVO [b_no=" + b_no + ", b_name=" + b_name + ", b_phone1=" + b_phone1 + ", b_phone2=" + b_phone2
				+ ", b_phone3=" + b_phone3 + "]";
	}

}
