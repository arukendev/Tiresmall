package com.tireshoppingmall.home.admin.car;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class CarDTO {
	
	//자동차
	private String c_id;
	private String c_name;
	private String c_year1;
	private String c_year2;
	private String c_brand;
	private String c_ft;
	private String c_bt;
	private MultipartFile file;
	private String c_file;
	
	//자동차 타이어 등록 배열
	private String[] tire_input_width1;
	private String[] tire_input_ratio1;
	private String[] tire_input_inch1;
	private String[] tire_input_width2;
	private String[] tire_input_ratio2;
	private String[] tire_input_inch2;
	
	//자동차 브랜드
	private String cb_name;
	private String old_cb_name;
	private String new_cb_name;
	private String cb_ea;
	private int cb_order;
	private String cb_img;
	
	//페이징
	private BigDecimal start;
	private BigDecimal end;

	public CarDTO() {
	}
	
	public CarDTO(String c_id, String c_name, String c_year1, String c_year2, String c_brand,
			String c_ft, String c_bt, MultipartFile file, String c_file) {
		super();
		this.c_id = c_id;
		this.c_name = c_name;
		this.c_year1 = c_year1;
		this.c_year2 = c_year2;
		this.c_brand = c_brand;
		this.c_ft = c_ft;
		this.c_bt = c_bt;
		this.file = file;
		this.c_file = c_file;
	}
	
	public CarDTO(String c_id, String c_name, String c_year1, String c_year2, String c_brand,
			String c_ft, String c_bt, MultipartFile file, String c_file, BigDecimal start,
			BigDecimal end) {
		super();
		this.c_id = c_id;
		this.c_name = c_name;
		this.c_year1 = c_year1;
		this.c_year2 = c_year2;
		this.c_brand = c_brand;
		this.c_ft = c_ft;
		this.c_bt = c_bt;
		this.file = file;
		this.c_file = c_file;
		this.start = start;
		this.end = end;
	}

	
	public CarDTO(String c_id, String c_name, String c_year1, String c_year2, String c_brand, String c_ft, String c_bt,
			MultipartFile file, String c_file, String[] tire_input_width1, String[] tire_input_ratio1,
			String[] tire_input_inch1, String[] tire_input_width2, String[] tire_input_ratio2,
			String[] tire_input_inch2) {
		super();
		this.c_id = c_id;
		this.c_name = c_name;
		this.c_year1 = c_year1;
		this.c_year2 = c_year2;
		this.c_brand = c_brand;
		this.c_ft = c_ft;
		this.c_bt = c_bt;
		this.file = file;
		this.c_file = c_file;
		this.tire_input_width1 = tire_input_width1;
		this.tire_input_ratio1 = tire_input_ratio1;
		this.tire_input_inch1 = tire_input_inch1;
		this.tire_input_width2 = tire_input_width2;
		this.tire_input_ratio2 = tire_input_ratio2;
		this.tire_input_inch2 = tire_input_inch2;
	}

	//페이징 작업
	public CarDTO(String c_name, String c_brand, BigDecimal start, BigDecimal end) {
		super();
		this.c_name = c_name;
		this.c_brand = c_brand;
		this.start = start;
		this.end = end;
	}
	//자동차 브랜드
	public CarDTO(String cb_name, String old_cb_name, String new_cb_name, String cb_ea, int cb_order, String cb_img) {
		super();
		this.cb_name = cb_name;
		this.old_cb_name = old_cb_name;
		this.new_cb_name = new_cb_name;
		this.cb_ea = cb_ea;
		this.cb_order = cb_order;
		this.cb_img = cb_img;
	}
	
	public String[] getTire_input_width1() {
		return tire_input_width1;
	}

	public void setTire_input_width1(String[] tire_input_width1) {
		this.tire_input_width1 = tire_input_width1;
	}

	public String[] getTire_input_ratio1() {
		return tire_input_ratio1;
	}

	public void setTire_input_ratio1(String[] tire_input_ratio1) {
		this.tire_input_ratio1 = tire_input_ratio1;
	}

	public String[] getTire_input_inch1() {
		return tire_input_inch1;
	}

	public void setTire_input_inch1(String[] tire_input_inch1) {
		this.tire_input_inch1 = tire_input_inch1;
	}

	public String[] getTire_input_width2() {
		return tire_input_width2;
	}

	public void setTire_input_width2(String[] tire_input_width2) {
		this.tire_input_width2 = tire_input_width2;
	}

	public String[] getTire_input_ratio2() {
		return tire_input_ratio2;
	}

	public void setTire_input_ratio2(String[] tire_input_ratio2) {
		this.tire_input_ratio2 = tire_input_ratio2;
	}

	public String[] getTire_input_inch2() {
		return tire_input_inch2;
	}

	public void setTire_input_inch2(String[] tire_input_inch2) {
		this.tire_input_inch2 = tire_input_inch2;
	}

	public String getCb_img() {
		return cb_img;
	}

	public void setCb_img(String cb_img) {
		this.cb_img = cb_img;
	}

	public String getCb_name() {
		return cb_name;
	}
	
	public void setCb_name(String cb_name) {
		this.cb_name = cb_name;
	}

	public String getOld_cb_name() {
		return old_cb_name;
	}

	public void setOld_cb_name(String old_cb_name) {
		this.old_cb_name = old_cb_name;
	}

	public String getNew_cb_name() {
		return new_cb_name;
	}

	public void setNew_cb_name(String new_cb_name) {
		this.new_cb_name = new_cb_name;
	}

	public String getCb_ea() {
		return cb_ea;
	}

	public void setCb_ea(String cb_ea) {
		this.cb_ea = cb_ea;
	}

	public int getCb_order() {
		return cb_order;
	}

	public void setCb_order(int cb_order) {
		this.cb_order = cb_order;
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

	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getC_year1() {
		return c_year1;
	}

	public void setC_year1(String c_year1) {
		this.c_year1 = c_year1;
	}

	public String getC_year2() {
		return c_year2;
	}

	public void setC_year2(String c_year2) {
		this.c_year2 = c_year2;
	}

	public String getC_brand() {
		return c_brand;
	}

	public void setC_brand(String c_brand) {
		this.c_brand = c_brand;
	}

	public String getC_ft() {
		return c_ft;
	}

	public void setC_ft(String c_ft) {
		this.c_ft = c_ft;
	}

	public String getC_bt() {
		return c_bt;
	}

	public void setC_bt(String c_bt) {
		this.c_bt = c_bt;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public String getC_file() {
		return c_file;
	}

	public void setC_file(String c_file) {
		this.c_file = c_file;
	}

	
	@Override
	public String toString() {
		return "CarDTO [c_id=" + c_id + ", c_name=" + c_name + ", c_year1=" + c_year1 + ", c_year2=" + c_year2
				+ ", c_brand=" + c_brand + ", c_ft=" + c_ft + ", c_bt=" + c_bt +
				", file=" + file + ", c_file=" + c_file + "]";
	}
	public static void CarPaging(HttpServletRequest req) {
		req.getSession().setAttribute("cars", null);
	}

	
}
