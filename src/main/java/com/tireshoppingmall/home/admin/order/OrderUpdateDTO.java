package com.tireshoppingmall.home.admin.order;

public class OrderUpdateDTO {

	private String o_no;
	private String o_step;
	
	public OrderUpdateDTO() {
		super();
	}
	public OrderUpdateDTO(String o_no, String o_step) {
		super();
		this.o_no = o_no;
		this.o_step = o_step;
	}
	public String getO_no() {
		return o_no;
	}
	public void setO_no(String o_no) {
		this.o_no = o_no;
	}
	public String getO_step() {
		return o_step;
	}
	public void setO_step(String o_step) {
		this.o_step = o_step;
	}
	
	
}
