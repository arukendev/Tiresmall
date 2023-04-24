package com.tireshoppingmall.home.admin.car;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class CarDTO {
	
	//자동차
	private int c_id;
	private String c_name;
	private String c_year1;
	private String c_year2;
	private String c_brand;
	private String c_ft;
	private String c_bt;
	private MultipartFile file;
	private String c_file;
	
	//자동차 타이어 등록 배열
	private String[] tf_width;
	private String[] tf_ratio;
	private String[] tf_inch;
	
	private String[] tb_width;
	private String[] tb_ratio;
	private String[] tb_inch;
	
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
	
	public CarDTO(int c_id, String c_name, String c_year1, String c_year2, String c_brand,
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
	
	public CarDTO(int c_id, String c_name, String c_year1, String c_year2, String c_brand,
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

	public CarDTO(int c_id, String c_name, String c_year1, String c_year2, String c_brand, String c_ft, String c_bt,
			MultipartFile file, String c_file, String[] tf_width, String[] tf_ratio, String[] tf_inch,
			String[] tb_width, String[] tb_ratio, String[] tb_inch, String cb_name, String old_cb_name,
			String new_cb_name, String cb_ea, int cb_order, String cb_img, BigDecimal start, BigDecimal end) {
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
		this.tf_width = tf_width;
		this.tf_ratio = tf_ratio;
		this.tf_inch = tf_inch;
		this.tb_width = tb_width;
		this.tb_ratio = tb_ratio;
		this.tb_inch = tb_inch;
		this.cb_name = cb_name;
		this.old_cb_name = old_cb_name;
		this.new_cb_name = new_cb_name;
		this.cb_ea = cb_ea;
		this.cb_order = cb_order;
		this.cb_img = cb_img;
		this.start = start;
		this.end = end;
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
	
	public String[] getTf_width() {
		return tf_width;
	}

	public void setTf_width(String[] tf_width) {
		this.tf_width = tf_width;
	}

	public String[] getTf_ratio() {
		return tf_ratio;
	}

	public void setTf_ratio(String[] tf_ratio) {
		this.tf_ratio = tf_ratio;
	}

	public String[] getTf_inch() {
		return tf_inch;
	}

	public void setTf_inch(String[] tf_inch) {
		this.tf_inch = tf_inch;
	}

	public String[] getTb_width() {
		return tb_width;
	}

	public void setTb_width(String[] tb_width) {
		this.tb_width = tb_width;
	}

	public String[] getTb_ratio() {
		return tb_ratio;
	}

	public void setTb_ratio(String[] tb_ratio) {
		this.tb_ratio = tb_ratio;
	}

	public String[] getTb_inch() {
		return tb_inch;
	}

	public void setTb_inch(String[] tb_inch) {
		this.tb_inch = tb_inch;
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

	public int getC_id() {
		return c_id;
	}

	public void setC_id(int c_id) {
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
