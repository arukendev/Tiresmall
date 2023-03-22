package com.tireshoppingmall.home.product;

import java.math.BigDecimal;

public class ProductSelector {
	private String search;
	private String search2;
	private BigDecimal start;
	private BigDecimal end;
	
	
	public ProductSelector() {
		// TODO Auto-generated constructor stub
	}

	public ProductSelector(String search, String search2, BigDecimal start, BigDecimal end) {
		super();
		this.search = search;
		this.search2 = search2;
		this.start = start;
		this.end = end;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}
	
	public String getSearch2() {
		return search2;
	}

	public void setSearch2(String search2) {
		this.search2 = search2;
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

	
	
}
