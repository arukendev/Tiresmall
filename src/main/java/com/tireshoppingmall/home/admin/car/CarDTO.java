package com.tireshoppingmall.home.admin.car;

import org.springframework.web.multipart.MultipartFile;

public class CarDTO {

	private String c_id;
	private String c_name;
	private String c_year1;
	private String c_year2;
	private String c_option;
	private String c_brand;
	private String c_ft;
	private String c_bt;
	private String c_print;
	private MultipartFile file;
	private String c_file;
	
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

	public String getC_option() {
		return c_option;
	}

	public void setC_option(String c_option) {
		this.c_option = c_option;
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

	
	

	public String getC_print() {
		return c_print;
	}

	public void setC_print(String c_print) {
		this.c_print = c_print;
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

	public CarDTO(String c_id, String c_name, String c_year1, String c_year2, String c_option, String c_brand,
			String c_ft, String c_bt, String c_fta, String c_bta, String c_print, MultipartFile file, String c_file) {
		super();
		this.c_id = c_id;
		this.c_name = c_name;
		this.c_year1 = c_year1;
		this.c_year2 = c_year2;
		this.c_option = c_option;
		this.c_brand = c_brand;
		this.c_ft = c_ft;
		this.c_bt = c_bt;
		this.c_print = c_print;
		this.file = file;
		this.c_file = c_file;
	}

	public CarDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
