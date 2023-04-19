package com.tireshoppingmall.home.admin.car;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;

public class SearchCarDTO {

	private String carbrandInput;
	private String carnameInput;
	private BigDecimal start;
	private BigDecimal end;
	
	public SearchCarDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SearchCarDTO(String carnameInput,String carbrandInput,  BigDecimal start, BigDecimal end) {
		super();
		this.carbrandInput = carbrandInput;
		this.carnameInput = carnameInput;
		this.start = start;
		this.end = end;
	}
	public String getCarbrandInput() {
		return carbrandInput;
	}
	public void setCarbrandInput(String carbrandInput) {
		this.carbrandInput = carbrandInput;
	}
	public String getCarnameInput() {
		return carnameInput;
	}
	public void setCarnameInput(String carnameInput) {
		this.carnameInput = carnameInput;
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
	@Override
	public String toString() {
		return "SearchCarDTO [carbrandInput=" + carbrandInput + ", carnameInput=" + carnameInput + ", start=" + start
				+ ", end=" + end + "]";
	}
	public static void CarPaging(HttpServletRequest req) {
		req.getSession().setAttribute("cars", null);
		
	}
	
	

	
	
	
	
}
