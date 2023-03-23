package com.tireshoppingmall.home.board;

import java.util.Date;

public class BoardQnaDTO {
	private int rownumber;
	private int q_no;
	private String q_title;
	private String q_txt;
	private Date q_date;
	private int q_u_no;
	private int q_reply_has;
	private BoardQnaReplyDTO q_reply;
	public BoardQnaDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardQnaDTO(int rownumber, int q_no, String q_title, String q_txt, Date q_date, int q_u_no, int q_reply_has,
			BoardQnaReplyDTO q_reply) {
		super();
		this.rownumber = rownumber;
		this.q_no = q_no;
		this.q_title = q_title;
		this.q_txt = q_txt;
		this.q_date = q_date;
		this.q_u_no = q_u_no;
		this.q_reply_has = q_reply_has;
		this.q_reply = q_reply;
	}
	public int getRownumber() {
		return rownumber;
	}
	public void setRownumber(int rownumber) {
		this.rownumber = rownumber;
	}
	public int getQ_no() {
		return q_no;
	}
	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_txt() {
		return q_txt;
	}
	public void setQ_txt(String q_txt) {
		this.q_txt = q_txt;
	}
	public Date getQ_date() {
		return q_date;
	}
	public void setQ_date(Date q_date) {
		this.q_date = q_date;
	}
	public int getQ_u_no() {
		return q_u_no;
	}
	public void setQ_u_no(int q_u_no) {
		this.q_u_no = q_u_no;
	}
	public int getQ_reply_has() {
		return q_reply_has;
	}
	public void setQ_reply_has(int q_reply_has) {
		this.q_reply_has = q_reply_has;
	}
	public BoardQnaReplyDTO getQ_reply() {
		return q_reply;
	}
	public void setQ_reply(BoardQnaReplyDTO q_reply) {
		this.q_reply = q_reply;
	}
}
