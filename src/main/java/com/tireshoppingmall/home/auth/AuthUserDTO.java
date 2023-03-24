package com.tireshoppingmall.home.auth;

import java.math.BigDecimal;

public class AuthUserDTO {

	private String u_no;
	private String u_id;
	private int u_logintype;
	private String i_name;
	private String i_phoneNum;
	private String i_email;
	private String mc_brand;
	private String mc_carname;
	private String mc_year;
	private String mc_number;
	
	// 1:1문의 페이징관련
	private BigDecimal begin;
	private BigDecimal last;
	
	public AuthUserDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AuthUserDTO(String u_no, String u_id, int u_logintype, String i_name, String i_phoneNum, String i_email,
			String mc_brand, String mc_carname, String mc_year, String mc_number, BigDecimal begin, BigDecimal last) {
		super();
		this.u_no = u_no;
		this.u_id = u_id;
		this.u_logintype = u_logintype;
		this.i_name = i_name;
		this.i_phoneNum = i_phoneNum;
		this.i_email = i_email;
		this.mc_brand = mc_brand;
		this.mc_carname = mc_carname;
		this.mc_year = mc_year;
		this.mc_number = mc_number;
		this.begin = begin;
		this.last = last;
	}

	public String getU_no() {
		return u_no;
	}

	public void setU_no(String u_no) {
		this.u_no = u_no;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public int getU_logintype() {
		return u_logintype;
	}

	public void setU_logintype(int u_logintype) {
		this.u_logintype = u_logintype;
	}

	public String getI_name() {
		return i_name;
	}

	public void setI_name(String i_name) {
		this.i_name = i_name;
	}

	public String getI_phoneNum() {
		return i_phoneNum;
	}

	public void setI_phoneNum(String i_phoneNum) {
		this.i_phoneNum = i_phoneNum;
	}

	public String getI_email() {
		return i_email;
	}

	public void setI_email(String i_email) {
		this.i_email = i_email;
	}

	public String getMc_brand() {
		return mc_brand;
	}

	public void setMc_brand(String mc_brand) {
		this.mc_brand = mc_brand;
	}

	public String getMc_carname() {
		return mc_carname;
	}

	public void setMc_carname(String mc_carname) {
		this.mc_carname = mc_carname;
	}

	public String getMc_year() {
		return mc_year;
	}

	public void setMc_year(String mc_year) {
		this.mc_year = mc_year;
	}

	public String getMc_number() {
		return mc_number;
	}

	public void setMc_number(String mc_number) {
		this.mc_number = mc_number;
	}

	public BigDecimal getBegin() {
		return begin;
	}

	public void setBegin(BigDecimal begin) {
		this.begin = begin;
	}

	public BigDecimal getLast() {
		return last;
	}

	public void setLast(BigDecimal last) {
		this.last = last;
	}

	

	


}
