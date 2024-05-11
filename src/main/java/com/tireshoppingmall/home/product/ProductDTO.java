package com.tireshoppingmall.home.product;

public class ProductDTO {
	private int tg_id;
	private String tg_brand;
	private String tg_name;
	private String tg_img;
	private String tg_text;
	private int tg_dcrate;
	private String tg_detail;
	
	private int ti_id;
	private int ti_tg_id;
	private int ti_width;
	private int ti_ratio;
	private int ti_inch;
	private String ti_marking;
	private int ti_stock;
	private int ti_pricefac;
	
	private int front_tire_width;
	private int front_tire_ratio;
	private int front_tire_inch;
	private int rear_tire_width;
	private int rear_tire_ratio;
	private int rear_tire_inch;
	
	private int result_price;
	
	public ProductDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	//전체
	public ProductDTO(int tg_id, String tg_brand, String tg_name, String tg_img, String tg_text, int tg_dcrate,
			String tg_detail, int ti_id, int ti_tg_id, int ti_width, int ti_ratio, int ti_inch, String ti_marking,
			int ti_stock, int ti_pricefac, int front_tire_width, int front_tire_ratio, int front_tire_inch,
			int rear_tire_width, int rear_tire_ratio, int rear_tire_inch, int result_price) {
		super();
		this.tg_id = tg_id;
		this.tg_brand = tg_brand;
		this.tg_name = tg_name;
		this.tg_img = tg_img;
		this.tg_text = tg_text;
		this.tg_dcrate = tg_dcrate;
		this.tg_detail = tg_detail;
		this.ti_id = ti_id;
		this.ti_tg_id = ti_tg_id;
		this.ti_width = ti_width;
		this.ti_ratio = ti_ratio;
		this.ti_inch = ti_inch;
		this.ti_marking = ti_marking;
		this.ti_stock = ti_stock;
		this.ti_pricefac = ti_pricefac;
		this.front_tire_width = front_tire_width;
		this.front_tire_ratio = front_tire_ratio;
		this.front_tire_inch = front_tire_inch;
		this.rear_tire_width = rear_tire_width;
		this.rear_tire_ratio = rear_tire_ratio;
		this.rear_tire_inch = rear_tire_inch;
		this.result_price = result_price;
	}
	
	
	
	
	
	public int getTg_id() {
		return tg_id;
	}
	public void setTg_id(int tg_id) {
		this.tg_id = tg_id;
	}
	public String getTg_brand() {
		return tg_brand;
	}
	public void setTg_brand(String tg_brand) {
		this.tg_brand = tg_brand;
	}
	public String getTg_name() {
		return tg_name;
	}
	public void setTg_name(String tg_name) {
		this.tg_name = tg_name;
	}
	public String getTg_img() {
		return tg_img;
	}
	public void setTg_img(String tg_img) {
		this.tg_img = tg_img;
	}
	public String getTg_text() {
		return tg_text;
	}
	public void setTg_text(String tg_text) {
		this.tg_text = tg_text;
	}
	public int getTg_dcrate() {
		return tg_dcrate;
	}
	public void setTg_dcrate(int tg_dcrate) {
		this.tg_dcrate = tg_dcrate;
	}
	public String getTg_detail() {
		return tg_detail;
	}
	public void setTg_detail(String tg_detail) {
		this.tg_detail = tg_detail;
	}
	public int getTi_id() {
		return ti_id;
	}
	public void setTi_id(int ti_id) {
		this.ti_id = ti_id;
	}
	public int getTi_tg_id() {
		return ti_tg_id;
	}
	public void setTi_tg_id(int ti_tg_id) {
		this.ti_tg_id = ti_tg_id;
	}
	public int getTi_width() {
		return ti_width;
	}
	public void setTi_width(int ti_width) {
		this.ti_width = ti_width;
	}
	public int getTi_ratio() {
		return ti_ratio;
	}
	public void setTi_ratio(int ti_ratio) {
		this.ti_ratio = ti_ratio;
	}
	public int getTi_inch() {
		return ti_inch;
	}
	public void setTi_inch(int ti_inch) {
		this.ti_inch = ti_inch;
	}
	public String getTi_marking() {
		return ti_marking;
	}
	public void setTi_marking(String ti_marking) {
		this.ti_marking = ti_marking;
	}
	public int getTi_stock() {
		return ti_stock;
	}
	public void setTi_stock(int ti_stock) {
		this.ti_stock = ti_stock;
	}
	public int getTi_pricefac() {
		return ti_pricefac;
	}
	public void setTi_pricefac(int ti_pricefac) {
		this.ti_pricefac = ti_pricefac;
	}
	public int getFront_tire_width() {
		return front_tire_width;
	}
	public void setFront_tire_width(int front_tire_width) {
		this.front_tire_width = front_tire_width;
	}
	public int getFront_tire_ratio() {
		return front_tire_ratio;
	}
	public void setFront_tire_ratio(int front_tire_ratio) {
		this.front_tire_ratio = front_tire_ratio;
	}
	public int getFront_tire_inch() {
		return front_tire_inch;
	}
	public void setFront_tire_inch(int front_tire_inch) {
		this.front_tire_inch = front_tire_inch;
	}
	public int getRear_tire_width() {
		return rear_tire_width;
	}
	public void setRear_tire_width(int rear_tire_width) {
		this.rear_tire_width = rear_tire_width;
	}
	public int getRear_tire_ratio() {
		return rear_tire_ratio;
	}
	public void setRear_tire_ratio(int rear_tire_ratio) {
		this.rear_tire_ratio = rear_tire_ratio;
	}
	public int getRear_tire_inch() {
		return rear_tire_inch;
	}
	public void setRear_tire_inch(int rear_tire_inch) {
		this.rear_tire_inch = rear_tire_inch;
	}
	public int getResult_price() {
		return result_price;
	}
	public void setResult_price(int result_price) {
		this.result_price = result_price;
	}
	
	
	
}
