package com.tireshoppingmall.home.admin.board;

import java.util.Date;

public class QnaDTO {

	private String q_no;
	private String q_title;
	private String q_txt;
	private Date q_date;
	private String u_id;
	private String i_name;
	private int q_reply_has;
	private QnaReplyDTO q_reply;
	
	public String getQ_no() {
		return q_no;
	}
	public void setQ_no(String q_no) {
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
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getI_name() {
		return i_name;
	}
	public void setI_name(String i_name) {
		this.i_name = i_name;
	}
	public int getQ_reply_has() {
		return q_reply_has;
	}
	public void setQ_reply_has(int q_reply_has) {
		this.q_reply_has = q_reply_has;
	}
	public QnaReplyDTO getQ_reply() {
		return q_reply;
	}
	public void setQ_reply(QnaReplyDTO q_reply) {
		this.q_reply = q_reply;
	}
	
	

}
