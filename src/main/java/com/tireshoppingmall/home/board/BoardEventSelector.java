package com.tireshoppingmall.home.board;

import java.math.BigDecimal;

public class BoardEventSelector {
	private int e_no;
	private BigDecimal begin;
	private BigDecimal last;
	public BoardEventSelector() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardEventSelector(int e_no, BigDecimal begin, BigDecimal last) {
		super();
		this.e_no = e_no;
		this.begin = begin;
		this.last = last;
	}
	public int getE_no() {
		return e_no;
	}
	public void setE_no(int e_no) {
		this.e_no = e_no;
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
