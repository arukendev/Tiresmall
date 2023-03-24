package com.tireshoppingmall.home.admin.auth;

import java.math.BigDecimal;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

public class AuthDTO {

	// auth_user
	private int u_no;
	private String u_id;
	private String u_loginType;

	// auth_userinfo
	private int i_no;
	private String i_name;
	private String i_phoneNum;
	private Date i_newDate;
	private int i_grade;
	private String i_email;

	// auth_password
	private int pw_no;
	private String pw_salt;
	private String pw_password;
	private Date pw_update;

	// my_car
	private String mc_number;
	private String mc_id;
	private String mc_carName;
	private String mc_brand;
	private int mc_year;

	// 페이징작업
	private BigDecimal start;
	private BigDecimal end;

	public AuthDTO() {
	}

	public AuthDTO(int u_no, String u_id, String u_loginType, int i_no, String i_name, String i_phoneNum,
			Date i_newDate, int i_grade, String i_email, int pw_no, String pw_salt, String pw_password, Date pw_update,
			String mc_number, String mc_id, String mc_carName, String mc_brand, int mc_year, BigDecimal start,
			BigDecimal end) {
		super();
		this.u_no = u_no;
		this.u_id = u_id;
		this.u_loginType = u_loginType;
		this.i_no = i_no;
		this.i_name = i_name;
		this.i_phoneNum = i_phoneNum;
		this.i_newDate = i_newDate;
		this.i_grade = i_grade;
		this.i_email = i_email;
		this.pw_no = pw_no;
		this.pw_salt = pw_salt;
		this.pw_password = pw_password;
		this.pw_update = pw_update;
		this.mc_number = mc_number;
		this.mc_id = mc_id;
		this.mc_carName = mc_carName;
		this.mc_brand = mc_brand;
		this.mc_year = mc_year;
		this.start = start;
		this.end = end;
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

	public String getU_loginType() {
		return u_loginType;
	}

	public void setU_loginType(String u_loginType) {
		this.u_loginType = u_loginType;
	}

	public int getI_no() {
		return i_no;
	}

	public void setI_no(int i_no) {
		this.i_no = i_no;
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

	public Date getI_newDate() {
		return i_newDate;
	}

	public void setI_newDate(Date i_newDate) {
		this.i_newDate = i_newDate;
	}

	public int getI_grade() {
		return i_grade;
	}

	public void setI_grade(int i_grade) {
		this.i_grade = i_grade;
	}

	public String getI_email() {
		return i_email;
	}

	public void setI_email(String i_email) {
		this.i_email = i_email;
	}

	public int getPw_no() {
		return pw_no;
	}

	public void setPw_no(int pw_no) {
		this.pw_no = pw_no;
	}

	public String getPw_salt() {
		return pw_salt;
	}

	public void setPw_salt(String pw_salt) {
		this.pw_salt = pw_salt;
	}

	public String getPw_password() {
		return pw_password;
	}

	public void setPw_password(String pw_password) {
		this.pw_password = pw_password;
	}

	public Date getPw_update() {
		return pw_update;
	}

	public void setPw_update(Date pw_update) {
		this.pw_update = pw_update;
	}

	public String getMc_number() {
		return mc_number;
	}

	public void setMc_number(String mc_number) {
		this.mc_number = mc_number;
	}

	public String getMc_id() {
		return mc_id;
	}

	public void setMc_id(String mc_id) {
		this.mc_id = mc_id;
	}

	public String getmc_carName() {
		return mc_carName;
	}

	public void setmc_carName(String mc_carName) {
		this.mc_carName = mc_carName;
	}

	public String getMc_brand() {
		return mc_brand;
	}

	public void setMc_brand(String mc_brand) {
		this.mc_brand = mc_brand;
	}

	public int getMc_year() {
		return mc_year;
	}

	public void setMc_year(int mc_year) {
		this.mc_year = mc_year;
	}

	public BigDecimal getStart() {
		return start;
	}

	public void setStart(BigDecimal start) {
		this.start = start;
	}

	public BigDecimal getEnd() {
		return end;
	}

	public void setEnd(BigDecimal end) {
		this.end = end;
	}

	@Override
	public String toString() {
		return "AuthDTO [u_no=" + u_no + ", u_id=" + u_id + ", u_loginType=" + u_loginType + ", i_no=" + i_no
				+ ", i_name=" + i_name + ", i_phoneNum=" + i_phoneNum + ", i_newDate=" + i_newDate + ", i_grade="
				+ i_grade + ", i_email=" + i_email + ", pw_no=" + pw_no + ", pw_salt=" + pw_salt + ", pw_password="
				+ pw_password + ", pw_update=" + pw_update + ", mc_number=" + mc_number + ", mc_id=" + mc_id
				+ ", mc_carName=" + mc_carName + ", mc_brand=" + mc_brand + ", mc_year=" + mc_year + ", start=" + start
				+ ", end=" + end + "]";
	}

	
	public static void AuthPagsing(HttpServletRequest req) {
		req.getSession().setAttribute("authDTO", null);
	}
}
