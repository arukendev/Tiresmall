package com.tireshoppingmall.home.board;

import java.math.BigDecimal;
import java.util.Date;

public class BoardEventDTO {
	private int e_no;
	private String e_title;
	private Date e_date;
	private String e_content;
	private Date e_duration;
	private int e_popup;
	private String e_mainimg;
	private String e_detailimg;
	private String e_status;
	private BigDecimal begin;
	private BigDecimal last;
	public BoardEventDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardEventDTO(int e_no, String e_title, Date e_date, String e_content, Date e_duration, int e_popup,
			String e_mainimg, String e_detailimg, String e_status, BigDecimal begin, BigDecimal last) {
		super();
		this.e_no = e_no;
		this.e_title = e_title;
		this.e_date = e_date;
		this.e_content = e_content;
		this.e_duration = e_duration;
		this.e_popup = e_popup;
		this.e_mainimg = e_mainimg;
		this.e_detailimg = e_detailimg;
		this.e_status = e_status;
		this.begin = begin;
		this.last = last;
	}
	public int getE_no() {
		return e_no;
	}
	public void setE_no(int e_no) {
		this.e_no = e_no;
	}
	public String getE_title() {
		return e_title;
	}
	public void setE_title(String e_title) {
		this.e_title = e_title;
	}
	public Date getE_date() {
		return e_date;
	}
	public void setE_date(Date e_date) {
		this.e_date = e_date;
	}
	public String getE_content() {
		return e_content;
	}
	public void setE_content(String e_content) {
		this.e_content = e_content;
	}
	public Date getE_duration() {
		return e_duration;
	}
	public void setE_duration(Date e_duration) {
		this.e_duration = e_duration;
	}
	public int getE_popup() {
		return e_popup;
	}
	public void setE_popup(int e_popup) {
		this.e_popup = e_popup;
	}
	public String getE_mainimg() {
		return e_mainimg;
	}
	public void setE_mainimg(String e_mainimg) {
		this.e_mainimg = e_mainimg;
	}
	public String getE_detailimg() {
		return e_detailimg;
	}
	public void setE_detailimg(String e_detailimg) {
		this.e_detailimg = e_detailimg;
	}
	public String getE_status() {
		return e_status;
	}
	public void setE_status(String e_status) {
		this.e_status = e_status;
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
