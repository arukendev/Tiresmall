package com.tireshoppingmall.home.admin.tire;

import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class TireListDTO {

	//타이어 그룹
	private int tg_id;
	private String tg_brand;
	private String tg_name;
	private String tg_img;
	private String tg_text;		
	private int tg_num;			/*타이어가 총 몇개 등록되어있는지*/
	private int tg_dcrate;		/* dc rate 할인율 */
	private int tg_print;       /* 출력 여부 */
	private int tg_sedan;		/* 승용차 추천 1(t)/0(f) */
	private int tg_suv;			/* suv 추천 1(t)/0(f)*/
	private String tg_detail;

	
	//타이어 상세
	private int ti_id;		
	private int ti_tg_id;		/* tire_group 테이블 pk 참조하는 것 */
	private String[] ti_marking;	/* 하중 + 속도계수 = 마킹이 됨. */ 
	private int[] ti_width;		/* 단면폭 */
	private int[] ti_ratio;		/* 편평비 */
	private int[] ti_inch;		/* 인치 */
	private int[] ti_stock;		/* 재고량 */
	private int[] ti_pricefac;	/* 공장가격 */
	
	public TireListDTO() {
		// TODO Auto-generated constructor stub
	}

	

	public TireListDTO(int tg_id, String tg_brand, String tg_name, String tg_img, String tg_text, int tg_num,
			int tg_dcrate, int tg_print, int tg_sedan, int tg_suv, String tg_detail, int ti_id, int ti_tg_id,
			String[] ti_marking, int[] ti_width, int[] ti_ratio, int[] ti_inch, int[] ti_stock, int[] ti_pricefac) {
		super();
		this.tg_id = tg_id;
		this.tg_brand = tg_brand;
		this.tg_name = tg_name;
		this.tg_img = tg_img;
		this.tg_text = tg_text;
		this.tg_num = tg_num;
		this.tg_dcrate = tg_dcrate;
		this.tg_print = tg_print;
		this.tg_sedan = tg_sedan;
		this.tg_suv = tg_suv;
		this.tg_detail = tg_detail;
		this.ti_id = ti_id;
		this.ti_tg_id = ti_tg_id;
		this.ti_marking = ti_marking;
		this.ti_width = ti_width;
		this.ti_ratio = ti_ratio;
		this.ti_inch = ti_inch;
		this.ti_stock = ti_stock;
		this.ti_pricefac = ti_pricefac;
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

	public int getTg_num() {
		return tg_num;
	}

	public void setTg_num(int tg_num) {
		this.tg_num = tg_num;
	}

	public int getTg_dcrate() {
		return tg_dcrate;
	}

	public void setTg_dcrate(int tg_dcrate) {
		this.tg_dcrate = tg_dcrate;
	}

	public int getTg_print() {
		return tg_print;
	}

	public void setTg_print(int tg_print) {
		this.tg_print = tg_print;
	}

	public int getTg_sedan() {
		return tg_sedan;
	}

	public void setTg_sedan(int tg_sedan) {
		this.tg_sedan = tg_sedan;
	}

	public int getTg_suv() {
		return tg_suv;
	}

	public void setTg_suv(int tg_suv) {
		this.tg_suv = tg_suv;
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

	public String[] getTi_marking() {
		return ti_marking;
	}

	public void setTi_marking(String[] ti_marking) {
		this.ti_marking = ti_marking;
	}

	public int[] getTi_width() {
		return ti_width;
	}

	public void setTi_width(int[] ti_width) {
		this.ti_width = ti_width;
	}

	public int[] getTi_ratio() {
		return ti_ratio;
	}

	public void setTi_ratio(int[] ti_ratio) {
		this.ti_ratio = ti_ratio;
	}

	public int[] getTi_inch() {
		return ti_inch;
	}

	public void setTi_inch(int[] ti_inch) {
		this.ti_inch = ti_inch;
	}

	public int[] getTi_stock() {
		return ti_stock;
	}

	public void setTi_stock(int[] ti_stock) {
		this.ti_stock = ti_stock;
	}

	public int[] getTi_pricefac() {
		return ti_pricefac;
	}

	public void setTi_pricefac(int[] ti_pricefac) {
		this.ti_pricefac = ti_pricefac;
	}

	@Override
	public String toString() {
		return "TireListDTO [tg_id=" + tg_id + ", tg_brand=" + tg_brand + ", tg_name=" + tg_name + ", tg_img=" + tg_img
				+ ", tg_text=" + tg_text + ", tg_num=" + tg_num + ", tg_dcrate=" + tg_dcrate + ", tg_print=" + tg_print
				+ ", tg_sedan=" + tg_sedan + ", tg_suv=" + tg_suv + ", tg_detail=" + tg_detail + ", ti_id=" + ti_id
				+ ", ti_tg_id=" + ti_tg_id + ", ti_marking=" + Arrays.toString(ti_marking) + ", ti_width="
				+ Arrays.toString(ti_width) + ", ti_ratio=" + Arrays.toString(ti_ratio) + ", ti_inch="
				+ Arrays.toString(ti_inch) + ", ti_stock=" + Arrays.toString(ti_stock) + ", ti_pricefac="
				+ Arrays.toString(ti_pricefac) + "]";
	}



	
}
