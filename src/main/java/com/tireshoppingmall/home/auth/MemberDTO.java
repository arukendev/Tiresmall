package com.tireshoppingmall.home.auth;

public class MemberDTO {
	private int u_no;
	private String u_id;
	private String pw_password;
	private String i_name;
	private String i_phoneNum;
	private String i_email;
	private String u_logintype;
	private String mc_brand;
	private String mc_carname;
	private String mc_year;
	private String mc_number;
	
	
	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	public MemberDTO(int u_no, String u_id, String pw_password, String i_name, String i_phoneNum, String i_email,
			String u_logintype, String mc_brand, String mc_carname, String mc_year, String mc_number) {
		super();
		this.u_no = u_no;
		this.u_id = u_id;
		this.pw_password = pw_password;
		this.i_name = i_name;
		this.i_phoneNum = i_phoneNum;
		this.i_email = i_email;
		this.u_logintype = u_logintype;
		this.mc_brand = mc_brand;
		this.mc_carname = mc_carname;
		this.mc_year = mc_year;
		this.mc_number = mc_number;
	}

	public int getU_no() {
		return u_no;
	}

	public void setU_no(int u_no) {
		this.u_no = u_no;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getPw_password() {
		return pw_password;
	}

	public void setPw_password(String pw_password) {
		this.pw_password = pw_password;
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

	public String getU_logintype() {
		return u_logintype;
	}

	public void setU_logintype(String u_logintype) {
		this.u_logintype = u_logintype;
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
}
