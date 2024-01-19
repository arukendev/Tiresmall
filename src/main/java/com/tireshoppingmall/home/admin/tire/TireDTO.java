package com.tireshoppingmall.home.admin.tire;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;

public class TireDTO {
	
	//타이어 브랜드
	private String tb_name;		//브랜드 이름
	private int tb_ea;			// 1은 출력 0은 미출력
	private int tb_num;			// 몇개가 등록되어있는지
	private int tb_order;		// 순서 출력
	private int tb_id;			// 브랜드 pk
	private String tb_img;		// 브랜드 이미지
	
	
	
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
	private String tg_detail;	// 타이어상세페이지 이미지들을 나오게 함
	private int tg_tb_id;		// tb_id랑 같은 수

	
	//타이어 상세
	private int ti_id;		
	private int ti_tg_id;		/* tire_group 테이블 pk 참조하는 것 */
	private String ti_marking;	/* 속도계수 		하중 + 속도계수 = 마킹이 됨. */ 
	private int ti_width;		/* 단면폭 */
	private int ti_ratio;		/* 편평비 */
	private int ti_inch;		/* 인치 */
	private int ti_stock;		/* 재고량 */
	private int ti_pricefac;	/* 공장가격 */
	private int ti_count;



	//페이지 작업
	private BigDecimal start;
	private BigDecimal end;
	
	public TireDTO() {
		// TODO Auto-generated constructor stub
	}		
	
	//브랜드 페이지
	public TireDTO(String tb_name, int tb_ea, int tb_num, int tb_order, int tb_id, String tb_img) {
		super();
		this.tb_name = tb_name;
		this.tb_ea = tb_ea;
		this.tb_num = tb_num;
		this.tb_order = tb_order;
		this.tb_id = tb_id;
		this.tb_img = tb_img;
	}

	//전체
	public TireDTO(String tb_name, int tb_ea, int tb_num, int tb_order, int tb_id, String tb_img, int tg_id,
			String tg_brand, String tg_name, String tg_img, String tg_text, int tg_num, int tg_dcrate, int tg_print,
			int tg_sedan, int tg_suv, String tg_detail, int tg_tb_id, int ti_id, int ti_tg_id, String ti_marking,
			int ti_width, int ti_ratio, int ti_inch, int ti_stock, int ti_pricefac, int ti_count, BigDecimal start,
			BigDecimal end) {
		super();
		this.tb_name = tb_name;
		this.tb_ea = tb_ea;
		this.tb_num = tb_num;
		this.tb_order = tb_order;
		this.tb_id = tb_id;
		this.tb_img = tb_img;
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
		this.tg_tb_id = tg_tb_id;
		this.ti_id = ti_id;
		this.ti_tg_id = ti_tg_id;
		this.ti_marking = ti_marking;
		this.ti_width = ti_width;
		this.ti_ratio = ti_ratio;
		this.ti_inch = ti_inch;
		this.ti_stock = ti_stock;
		this.ti_pricefac = ti_pricefac;
		this.ti_count = ti_count;
		this.start = start;
		this.end = end;
	}
	
	

	//검색 페이징 작업 객체호출
	public TireDTO(String tg_brand, String tg_name, BigDecimal start, BigDecimal end) {
		super();
		this.tg_brand = tg_brand;
		this.tg_name = tg_name;
		this.start = start;
		this.end = end;
	}

	public String getTb_name() {
		return tb_name;
	}

	public void setTb_name(String tb_name) {
		this.tb_name = tb_name;
	}

	public int getTb_ea() {
		return tb_ea;
	}

	public void setTb_ea(int tb_ea) {
		this.tb_ea = tb_ea;
	}

	public int getTb_num() {
		return tb_num;
	}

	public void setTb_num(int tb_num) {
		this.tb_num = tb_num;
	}

	public int getTb_order() {
		return tb_order;
	}

	public void setTb_order(int tb_order) {
		this.tb_order = tb_order;
	}

	public int getTb_id() {
		return tb_id;
	}

	public void setTb_id(int tb_id) {
		this.tb_id = tb_id;
	}

	public String getTb_img() {
		return tb_img;
	}

	public void setTb_img(String tb_img) {
		this.tb_img = tb_img;
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

	public int getTg_tb_id() {
		return tg_tb_id;
	}

	public void setTg_tb_id(int tg_tb_id) {
		this.tg_tb_id = tg_tb_id;
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

	public String getTi_marking() {
		return ti_marking;
	}

	public void setTi_marking(String ti_marking) {
		this.ti_marking = ti_marking;
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

	public int getTi_pricefac() {
		return ti_pricefac;
	}

	public void setTi_pricefac(int ti_pricefac) {
		this.ti_pricefac = ti_pricefac;
	}

	public int getTi_count() {
		return ti_count;
	}

	public void setTi_count(int ti_count) {
		this.ti_count = ti_count;
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
		return "TireDTO [tb_name=" + tb_name + ", tb_ea=" + tb_ea + ", tb_num=" + tb_num + ", tb_order=" + tb_order
				+ ", tg_id=" + tg_id + ", tg_brand=" + tg_brand + ", tg_name=" + tg_name + ", tg_img=" + tg_img
				+ ", tg_text=" + tg_text + ", tg_num=" + tg_num + ", tg_dcrate=" + tg_dcrate + ", tg_print=" + tg_print
				+ ", tg_sedan=" + tg_sedan + ", tg_suv=" + tg_suv + ", tg_detail=" + tg_detail + ", ti_id=" + ti_id
				+ ", ti_tg_id=" + ti_tg_id + ", ti_marking=" + ti_marking + ", ti_width=" + ti_width + ", ti_ratio="
				+ ti_ratio + ", ti_inch=" + ti_inch + ", ti_stock=" + ti_stock + ", ti_pricefac=" + ti_pricefac
				+ ", ti_count=" + ti_count + ", start=" + start + ", end=" + end + "]";
	}

	public static void TirePagsing(HttpServletRequest req) {
		req.getSession().setAttribute("authDTO", null);
	}

}