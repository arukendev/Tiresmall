package com.tireshoppingmall.home.board;

import java.math.BigDecimal;

public class BoardNoticeSelector {
	private int n_no;
	private BigDecimal begin;
	private BigDecimal last;
	public BoardNoticeSelector() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardNoticeSelector(int n_no, BigDecimal begin, BigDecimal last) {
		super();
		this.n_no = n_no;
		this.begin = begin;
		this.last = last;
	}
	public int getN_no() {
		return n_no;
	}
	public void setN_no(int n_no) {
		this.n_no = n_no;
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
