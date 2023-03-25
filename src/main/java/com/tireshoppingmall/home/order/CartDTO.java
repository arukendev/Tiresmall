package com.tireshoppingmall.home.order;

public class CartDTO {
	private int tg_id;
	private String tg_brand;
	private String tg_name;
	private String tg_img;
	private int tg_dcrate;
	private int ti_id;
	private int ti_width;
	private int ti_ratio;
	private int ti_inch;
	private int ti_stock;
	private int ti_pricegp;
	private int ti_pricefac;
	private String ti_marking;
	private int ti_allpricegp;
	private int ti_allpricefac;
	
	public CartDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CartDTO(int tg_id, String tg_brand, String tg_name, String tg_img, int tg_dcrate, int ti_id, int ti_width,
			int ti_ratio, int ti_inch, int ti_stock, int ti_pricegp, int ti_pricefac, String ti_marking,
			int ti_allpricegp, int ti_allpricefac) {
		super();
		this.tg_id = tg_id;
		this.tg_brand = tg_brand;
		this.tg_name = tg_name;
		this.tg_img = tg_img;
		this.tg_dcrate = tg_dcrate;
		this.ti_id = ti_id;
		this.ti_width = ti_width;
		this.ti_ratio = ti_ratio;
		this.ti_inch = ti_inch;
		this.ti_stock = ti_stock;
		this.ti_pricegp = ti_pricegp;
		this.ti_pricefac = ti_pricefac;
		this.ti_marking = ti_marking;
		this.ti_allpricegp = ti_allpricegp;
		this.ti_allpricefac = ti_allpricefac;
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

	public int getTg_dcrate() {
		return tg_dcrate;
	}

	public void setTg_dcrate(int tg_dcrate) {
		this.tg_dcrate = tg_dcrate;
	}

	public int getTi_id() {
		return ti_id;
	}

	public void setTi_id(int ti_id) {
		this.ti_id = ti_id;
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

	public int getTi_stock() {
		return ti_stock;
	}

	public void setTi_stock(int ti_stock) {
		this.ti_stock = ti_stock;
	}

	public int getTi_pricegp() {
		return ti_pricegp;
	}

	public void setTi_pricegp(int ti_pricegp) {
		this.ti_pricegp = ti_pricegp;
	}

	public int getTi_pricefac() {
		return ti_pricefac;
	}

	public void setTi_pricefac(int ti_pricefac) {
		this.ti_pricefac = ti_pricefac;
	}

	public String getTi_marking() {
		return ti_marking;
	}

	public void setTi_marking(String ti_marking) {
		this.ti_marking = ti_marking;
	}

	public int getTi_allpricegp() {
		return ti_allpricegp;
	}

	public void setTi_allpricegp(int ti_allpricegp) {
		this.ti_allpricegp = ti_allpricegp;
	}

	public int getTi_allpricefac() {
		return ti_allpricefac;
	}

	public void setTi_allpricefac(int ti_allpricefac) {
		this.ti_allpricefac = ti_allpricefac;
	}

	@Override
	public String toString() {
		return "CartDTO [tg_id=" + tg_id + ", tg_brand=" + tg_brand + ", tg_name=" + tg_name + ", tg_img=" + tg_img
				+ ", tg_dcrate=" + tg_dcrate + ", ti_id=" + ti_id + ", ti_width=" + ti_width + ", ti_ratio=" + ti_ratio
				+ ", ti_inch=" + ti_inch + ", ti_stock=" + ti_stock + ", ti_pricegp=" + ti_pricegp + ", ti_pricefac="
				+ ti_pricefac + ", ti_marking=" + ti_marking + ", ti_allpricegp=" + ti_allpricegp + ", ti_allpricefac="
				+ ti_allpricefac + "]";
	}
}
