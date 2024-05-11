package com.tireshoppingmall.home.admin.car;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class CarDTO {
	
	//자동차
	private int c_id;
	private int c_cb_id;
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
	
	//update 페이지 타이어 나오게 하기위해서(list사용)
	private String ft_width;
	private String ft_ratio;
	private String ft_inch;
	
	private String rt_width;
	private String rt_ratio;
	private String rt_inch;
	
	//자동차 브랜드
	private String cb_name;
	private int cb_id;
	private int cb_num;
	private int cb_order;
	
	
	
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

	//전체
	public CarDTO(int c_id, int c_cb_id, String c_name, String c_year1, String c_year2, String c_brand, String c_ft,
			String c_bt, MultipartFile file, String c_file, String[] tf_width, String[] tf_ratio, String[] tf_inch,
			String[] tb_width, String[] tb_ratio, String[] tb_inch, String ft_width, String ft_ratio, String ft_inch,
			String rt_width, String rt_ratio, String rt_inch, String cb_name, int cb_id, int cb_num, int cb_order,
			BigDecimal start, BigDecimal end) {
		super();
		this.c_id = c_id;
		this.c_cb_id = c_cb_id;
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
		this.ft_width = ft_width;
		this.ft_ratio = ft_ratio;
		this.ft_inch = ft_inch;
		this.rt_width = rt_width;
		this.rt_ratio = rt_ratio;
		this.rt_inch = rt_inch;
		this.cb_name = cb_name;
		this.cb_id = cb_id;
		this.cb_num = cb_num;
		this.cb_order = cb_order;
		this.start = start;
		this.end = end;
	}

	//업데이트 앞 뒤 타이어 사이즈가 같을경우
	public CarDTO(String ft_width, String ft_ratio, String ft_inch) {
		super();
		this.ft_width = ft_width;
		this.ft_ratio = ft_ratio;
		this.ft_inch = ft_inch;
	}
	//없데이트 앞 뒤 타이어 사이즈가 다를경우
	public CarDTO(String ft_width, String ft_ratio, String ft_inch, String rt_width, String rt_ratio, String rt_inch) {
		super();
		this.ft_width = ft_width;
		this.ft_ratio = ft_ratio;
		this.ft_inch = ft_inch;
		this.rt_width = rt_width;
		this.rt_ratio = rt_ratio;
		this.rt_inch = rt_inch;
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
	public CarDTO(String cb_name, int cb_id, int cb_num, int cb_order) {
		super();
		this.cb_name = cb_name;
		this.cb_id = cb_id;
		this.cb_num = cb_num;
		this.cb_order = cb_order;
	}

	public int getCb_order() {
		return cb_order;
	}




	public void setCb_order(int cb_order) {
		this.cb_order = cb_order;
	}




	public int getC_cb_id() {
		return c_cb_id;
	}




	public void setC_cb_id(int c_cb_id) {
		this.c_cb_id = c_cb_id;
	}




	public int getCb_id() {
		return cb_id;
	}




	public void setCb_id(int cb_id) {
		this.cb_id = cb_id;
	}




	public String getFt_width() {
		return ft_width;
	}

	



	public void setFt_width(String ft_width) {
		this.ft_width = ft_width;
	}

	public String getFt_ratio() {
		return ft_ratio;
	}

	public void setFt_ratio(String ft_ratio) {
		this.ft_ratio = ft_ratio;
	}

	public String getFt_inch() {
		return ft_inch;
	}

	public void setFt_inch(String ft_inch) {
		this.ft_inch = ft_inch;
	}

	public String getRt_width() {
		return rt_width;
	}

	public void setRt_width(String rt_width) {
		this.rt_width = rt_width;
	}

	public String getRt_ratio() {
		return rt_ratio;
	}

	public void setRt_ratio(String rt_ratio) {
		this.rt_ratio = rt_ratio;
	}

	public String getRt_inch() {
		return rt_inch;
	}

	public void setRt_inch(String rt_inch) {
		this.rt_inch = rt_inch;
	}

	public int getCb_num() {
		return cb_num;
	}

	public void setCb_num(int cb_num) {
		this.cb_num = cb_num;
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


	public String getCb_name() {
		return cb_name;
	}
	
	public void setCb_name(String cb_name) {
		this.cb_name = cb_name;
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

	public static void CarPaging(HttpServletRequest req) {
		req.getSession().setAttribute("cars", null);
	}

	
}
