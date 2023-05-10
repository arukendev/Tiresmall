package com.tireshoppingmall.home.admin.order;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.tireshoppingmall.home.admin.tire.TireDTO;

public class OrderDTO {

	private String o_no;
	private String o_sortation;
	private String o_ordernumber;
	private Date o_orderdate;
	private String o_ordername;
	private String o_product;
	
	private List<TireDTO> o_products;
	
	public List<TireDTO> getO_products() {
		return o_products;
	}
	
	public void setO_products(ArrayList<TireDTO> order_tires) {
		this.o_products = order_tires;
	}
	private String o_price;
	private String o_paymethod;
	private String o_deliverymethod;
	private String o_step;
	private String o_storeshop;
	private Date o_tireinstalldate;
	private String o_name;
	private String o_phone;
	private String o_email;
	private String o_caryear;
	private String o_carbrand;
	private String o_carname;
	private String o_carnumber;
	private String o_request;
	
	
	public String getO_no() {
		return o_no;
	}
	public void setO_no(String o_no) {
		this.o_no = o_no;
	}
	public String getO_sortation() {
		return o_sortation;
	}
	public void setO_sortation(String o_sortation) {
		this.o_sortation = o_sortation;
	}
	public String getO_ordernumber() {
		return o_ordernumber;
	}
	public void setO_ordernumber(String o_ordernumber) {
		this.o_ordernumber = o_ordernumber;
	}
	public Date getO_orderdate() {
		return o_orderdate;
	}
	public void setO_orderdate(Date o_orderdate) {
		this.o_orderdate = o_orderdate;
	}
	public String getO_ordername() {
		return o_ordername;
	}
	public void setO_ordername(String o_ordername) {
		this.o_ordername = o_ordername;
	}
	public String getO_product() {
		return o_product;
	}
	public void setO_product(String o_product) {
		this.o_product = o_product;
	}
	public String getO_price() {
		return o_price;
	}
	public void setO_price(String o_price) {
		this.o_price = o_price;
	}
	public String getO_paymethod() {
		return o_paymethod;
	}
	public void setO_paymethod(String o_paymethod) {
		this.o_paymethod = o_paymethod;
	}
	public String getO_deliverymethod() {
		return o_deliverymethod;
	}
	public void setO_deliverymethod(String o_deliverymethod) {
		this.o_deliverymethod = o_deliverymethod;
	}
	public String getO_step() {
		return o_step;
	}
	public void setO_step(String o_step) {
		this.o_step = o_step;
	}
	public String getO_storeshop() {
		return o_storeshop;
	}
	public void setO_storeshop(String o_storeshop) {
		this.o_storeshop = o_storeshop;
	}
	public Date getO_tireinstalldate() {
		return o_tireinstalldate;
	}
	public void setO_tireinstalldate(Date o_tireinstalldate) {
		this.o_tireinstalldate = o_tireinstalldate;
	}
	public String getO_name() {
		return o_name;
	}
	public void setO_name(String o_name) {
		this.o_name = o_name;
	}
	public String getO_phone() {
		return o_phone;
	}
	public void setO_phone(String o_phone) {
		this.o_phone = o_phone;
	}
	public String getO_email() {
		return o_email;
	}
	public void setO_email(String o_email) {
		this.o_email = o_email;
	}
	public String getO_caryear() {
		return o_caryear;
	}
	public void setO_caryear(String o_caryear) {
		this.o_caryear = o_caryear;
	}
	public String getO_carbrand() {
		return o_carbrand;
	}
	public void setO_carbrand(String o_carbrand) {
		this.o_carbrand = o_carbrand;
	}
	public String getO_carname() {
		return o_carname;
	}
	public void setO_carname(String o_carname) {
		this.o_carname = o_carname;
	}
	public String getO_carnumber() {
		return o_carnumber;
	}
	public void setO_carnumber(String o_carnumber) {
		this.o_carnumber = o_carnumber;
	}
	public String getO_request() {
		return o_request;
	}
	public void setO_request(String o_request) {
		this.o_request = o_request;
	}
	@Override
	public String toString() {
		return "OrderDTO [o_no=" + o_no + ", o_sortation=" + o_sortation + ", o_ordernumber=" + o_ordernumber
				+ ", o_orderdate=" + o_orderdate + ", o_ordername=" + o_ordername + ", o_product=" + o_product
				+ ", o_products=" + o_products + ", o_price=" + o_price + ", o_paymethod=" + o_paymethod
				+ ", o_deliverymethod=" + o_deliverymethod + ", o_step=" + o_step + ", o_storeshop=" + o_storeshop
				+ ", o_tireinstalldate=" + o_tireinstalldate + ", o_name=" + o_name + ", o_phone=" + o_phone
				+ ", o_email=" + o_email + ", o_caryear=" + o_caryear + ", o_carbrand=" + o_carbrand + ", o_carname="
				+ o_carname + ", o_carnumber=" + o_carnumber + ", o_request=" + o_request + "]";
	}
	
	
	
}
