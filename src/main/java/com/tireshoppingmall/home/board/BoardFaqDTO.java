package com.tireshoppingmall.home.board;

import java.util.Date;

public class BoardFaqDTO {
	private int f_no;
	private String f_sortation;
	private String f_title;
	private String f_txt;
	private Date f_date;
	public BoardFaqDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardFaqDTO(int f_no, String f_sortation, String f_title, String f_txt, Date f_date) {
		super();
		this.f_no = f_no;
		this.f_sortation = f_sortation;
		this.f_title = f_title;
		this.f_txt = f_txt;
		this.f_date = f_date;
	}
	public int getF_no() {
		return f_no;
	}
	public void setF_no(int f_no) {
		this.f_no = f_no;
	}
	public String getF_sortation() {
		return f_sortation;
	}
	public void setF_sortation(String f_sortation) {
		this.f_sortation = f_sortation;
	}
	public String getF_title() {
		return f_title;
	}
	public void setF_title(String f_title) {
		this.f_title = f_title;
	}
	public String getF_txt() {
		return f_txt;
	}
	public void setF_txt(String f_txt) {
		this.f_txt = f_txt;
	}
	public Date getF_date() {
		return f_date;
	}
	public void setF_date(Date f_date) {
		this.f_date = f_date;
	}
}
