package com.tireshoppingmall.home.board;

import java.util.Date;

public class BoardNoticeDTO {
	private int rownumber;
	private int n_no;
	private String n_sortation;
	private String n_title;
	private String n_txt;
	private Date n_date;
	public BoardNoticeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardNoticeDTO(int rownumber, int n_no, String n_sortation, String n_title, String n_txt, Date n_date) {
		super();
		this.rownumber = rownumber;
		this.n_no = n_no;
		this.n_sortation = n_sortation;
		this.n_title = n_title;
		this.n_txt = n_txt;
		this.n_date = n_date;
	}
	public int getRownumber() {
		return rownumber;
	}
	public void setRownumber(int rownumber) {
		this.rownumber = rownumber;
	}
	public int getN_no() {
		return n_no;
	}
	public void setN_no(int n_no) {
		this.n_no = n_no;
	}
	public String getN_sortation() {
		return n_sortation;
	}
	public void setN_sortation(String n_sortation) {
		this.n_sortation = n_sortation;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_txt() {
		return n_txt;
	}
	public void setN_txt(String n_txt) {
		this.n_txt = n_txt;
	}
	public Date getN_date() {
		return n_date;
	}
	public void setN_date(Date n_date) {
		this.n_date = n_date;
	}
}
