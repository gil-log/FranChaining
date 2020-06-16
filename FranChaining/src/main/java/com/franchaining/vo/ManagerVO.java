package com.franchaining.vo;

public class ManagerVO {
	
	private String id;
	private int e_no;
	private String pwd;
	private int m_flag;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getE_no() {
		return e_no;
	}
	public void setE_no(int e_no) {
		this.e_no = e_no;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public int getM_flag() {
		return m_flag;
	}
	public void setM_flag(int m_flag) {
		this.m_flag = m_flag;
	}
	
	@Override
	public String toString() {
		return "ManagerVO [id=" + id + ", e_no=" + e_no + ", pwd=" + pwd + ", m_flag=" + m_flag + "]";
	}

}
