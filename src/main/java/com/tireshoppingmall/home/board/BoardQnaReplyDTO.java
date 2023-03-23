package com.tireshoppingmall.home.board;

import java.util.Date;

public class BoardQnaReplyDTO {
	private int q_reply_no;
	private String q_reply_txt;
	private Date q_reply_date;
	private int q_reply_board_no;
	public BoardQnaReplyDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardQnaReplyDTO(int q_reply_no, String q_reply_txt, Date q_reply_date, int q_reply_board_no) {
		super();
		this.q_reply_no = q_reply_no;
		this.q_reply_txt = q_reply_txt;
		this.q_reply_date = q_reply_date;
		this.q_reply_board_no = q_reply_board_no;
	}
	public int getQ_reply_no() {
		return q_reply_no;
	}
	public void setQ_reply_no(int q_reply_no) {
		this.q_reply_no = q_reply_no;
	}
	public String getQ_reply_txt() {
		return q_reply_txt;
	}
	public void setQ_reply_txt(String q_reply_txt) {
		this.q_reply_txt = q_reply_txt;
	}
	public Date getQ_reply_date() {
		return q_reply_date;
	}
	public void setQ_reply_date(Date q_reply_date) {
		this.q_reply_date = q_reply_date;
	}
	public int getQ_reply_board_no() {
		return q_reply_board_no;
	}
	public void setQ_reply_board_no(int q_reply_board_no) {
		this.q_reply_board_no = q_reply_board_no;
	}
}
