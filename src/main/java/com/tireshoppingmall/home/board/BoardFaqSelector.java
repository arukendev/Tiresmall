package com.tireshoppingmall.home.board;

import java.math.BigDecimal;

public class BoardFaqSelector {
	private String f_sortation;
	private int f_no;
	private String faqSearchSelection;
	private String faqSearch;
	private BigDecimal begin;
	private BigDecimal last;
	public BoardFaqSelector() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardFaqSelector(String f_sortation, int f_no, String faqSearchSelection, String faqSearch, BigDecimal begin,
			BigDecimal last) {
		super();
		this.f_sortation = f_sortation;
		this.f_no = f_no;
		this.faqSearchSelection = faqSearchSelection;
		this.faqSearch = faqSearch;
		this.begin = begin;
		this.last = last;
	}
	public String getF_sortation() {
		return f_sortation;
	}
	public void setF_sortation(String f_sortation) {
		this.f_sortation = f_sortation;
	}
	public int getF_no() {
		return f_no;
	}
	public void setF_no(int f_no) {
		this.f_no = f_no;
	}
	public String getFaqSearchSelection() {
		return faqSearchSelection;
	}
	public void setFaqSearchSelection(String faqSearchSelection) {
		this.faqSearchSelection = faqSearchSelection;
	}
	public String getFaqSearch() {
		return faqSearch;
	}
	public void setFaqSearch(String faqSearch) {
		this.faqSearch = faqSearch;
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
