package com.tireshoppingmall.home.admin.tire;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;

public class TireDTO {
	
	//타이어 브랜드
	private String tb_name;		//브랜드 이름
	private int tb_ea;			// 1은 출력 0은 미출력
	private int tb_num;			// 몇개가 등록되어있는지
	private int tb_order;		// 순서 출력
	
	
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
	private String TG_DETAIL;

	
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
	public TireDTO(String tb_name, int tb_ea, int tb_num, int tb_order) {
		super();
		this.tb_name = tb_name;
		this.tb_ea = tb_ea;
		this.tb_num = tb_num;
		this.tb_order = tb_order;
	}

	//전체
	public TireDTO(String tb_name, int tb_ea, int tb_num, int tb_order, int tg_id, String tg_brand, String tg_name,
			String tg_img, String tg_text, int tg_num, int tg_dcrate, int tg_print, int tg_sedan, int tg_suv,
			String tG_DETAIL, int ti_id, int ti_tg_id, String ti_marking, int ti_width, int ti_ratio, int ti_inch,
			int ti_stock, int ti_pricefac, int ti_count, BigDecimal start, BigDecimal end) {
		super();
		this.tb_name = tb_name;
		this.tb_ea = tb_ea;
		this.tb_num = tb_num;
		this.tb_order = tb_order;
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
		this.TG_DETAIL = tG_DETAIL;
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
				+ ", tg_sedan=" + tg_sedan + ", tg_suv=" + tg_suv + ", TG_DETAIL=" + TG_DETAIL + ", ti_id=" + ti_id
				+ ", ti_tg_id=" + ti_tg_id + ", ti_marking=" + ti_marking + ", ti_width=" + ti_width + ", ti_ratio="
				+ ti_ratio + ", ti_inch=" + ti_inch + ", ti_stock=" + ti_stock + ", ti_pricefac=" + ti_pricefac
				+ ", ti_count=" + ti_count + ", start=" + start + ", end=" + end + "]";
	}

	public static void TirePagsing(HttpServletRequest req) {
		req.getSession().setAttribute("authDTO", null);
	}

	
	

	
	/*
	 * @RequestMapping(value = "/upload_ok", method = RequestMethod.POST)
		public String upload(@RequestParam("file") MultipartFile file) {
			
			String fileRealName = file.getOriginalFilename(); //파일명을 얻어낼 수 있는 메서드!
			long size = file.getSize(); //파일 사이즈
			
			System.out.println("파일명 : "  + fileRealName);
			System.out.println("용량크기(byte) : " + size);
			//서버에 저장할 파일이름 fileextension으로 .jsp이런식의  확장자 명을 구함
			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
			String uploadFolder = "C:\\Users\\dlark\\OneDrive\\바탕 화면\\asd";
			
			
		
			  파일 업로드시 파일명이 동일한 파일이 이미 존재할 수도 있고 사용자가 
			  업로드 하는 파일명이 언어 이외의 언어로 되어있을 수 있습니다. 
			  타인어를 지원하지 않는 환경에서는 정산 동작이 되지 않습니다.(리눅스가 대표적인 예시)
			  고유한 랜던 문자를 통해 db와 서버에 저장할 파일명을 새롭게 만들어 준다.
			
			
			UUID uuid = UUID.randomUUID();
			System.out.println(uuid.toString());
			String[] uuids = uuid.toString().split("-");
			
			String uniqueName = uuids[0];
			System.out.println("생성된 고유문자열" + uniqueName);
			System.out.println("확장자명" + fileExtension);
			
			
			
			// File saveFile = new File(uploadFolder+"\\"+fileRealName); uuid 적용 전
			
			File saveFile = new File(uploadFolder+"\\"+uniqueName + fileExtension);  // 적용 후
			try {
				file.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "fileupload/upload_ok";
		}

		
		@RequestMapping(value = "/upload_ok2", method = RequestMethod.POST)
		public String upload2(MultipartHttpServletRequest files,Model m) {
			
			//서버에서 저장 할 경로
			String uploadFolder = "C:\\Users\\dlark\\OneDrive\\바탕 화면\\asd";
			List<MultipartFile> list = files.getFiles("files");
			
			for(int i = 0; i<list.size(); i++) {
				String fileRealName = list.get(i).getOriginalFilename();
				long size = list.get(i).getSize();
				
				System.out.println("파일명 :" + fileRealName);
				System.out.println("사이즈" + size);
				
				UUID uuid = UUID.randomUUID();
				System.out.println(uuid.toString());
				
				String[] uuids= uuid.toString().split("-");
				String uniqueName =	uuids[0] + uuids[1];
				System.out.println("생성된 고유문자열" +uniqueName);
				
				
				File saveFile = new File(uploadFolder + "\\"+uniqueName + fileRealName);
				try {
					list.get(i).transferTo(saveFile);
					m.addAttribute("r","멀티업로드 성공!!");
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		
			return "fileupload/upload_ok";
		}

*/
	
	

}