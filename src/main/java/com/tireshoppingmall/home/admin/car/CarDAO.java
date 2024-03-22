package com.tireshoppingmall.home.admin.car;

import java.io.File;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tireshoppingmall.home.admin.car.CarDTO;
import com.tireshoppingmall.home.admin.car.CarOption;

@Service
public class CarDAO {

	@Autowired
	private ServletContext servletContext;

	@Autowired
	private SqlSession ss;

	@Autowired
	private CarOption co;

	private int allCarCount;

	public int getAllCarCount() {
		return allCarCount;
	}

	public void setAllCarCount(int allCarCount) {
		this.allCarCount = allCarCount;
	}

	// 페이징작업
	public void calcAllCarCount() {
		CarDTO strartEnd = new CarDTO("", "", null, null);
		allCarCount = ss.getMapper(AdminCarMapper.class).getCarCount(strartEnd);
	}

	// 카 모든것 가져오기
	public void getAllCar(int pageNo, HttpServletRequest req) {
		int count = co.getCarCountPerPage();
		int start = (pageNo - 1) * count + 1;
		int end = start + (count - 1);
		CarDTO paging = (CarDTO) req.getSession().getAttribute("cars");
		int CarCount = 0;
		if (paging == null) {
			paging = new CarDTO();
			paging.setC_name("");
			paging.setC_brand("");
			paging.setStart(new BigDecimal(start));
			paging.setEnd(new BigDecimal(end));
			CarCount = allCarCount;
		} else {
			paging.setStart(new BigDecimal(start));
			paging.setEnd(new BigDecimal(end));
			CarCount = ss.getMapper(AdminCarMapper.class).getCarCount(paging);
		}

		List<CarDTO> car = ss.getMapper(AdminCarMapper.class).getAllCar(paging);
		//타이어 브랜드  차에 맞게 맞춰서 가져오기
			
		// 타이어 사이즈 가져오기
		String[] frontTireSize = null;
		String[] rearTireSize;

		
		String[][] TireSizes = new String[car.size()][10]; //ArrayList도 한번 생각해보기	
		
		
							//최대 10은 안넘으니 일단 10으로 만들어둠
							//2차원 배열은 무조건  new String[][]  []안에 크기 선언을 해줘야한다(둘다) 안하면 터짐;;;;
							//null을 안써도 터짐;;;
		if(car.size() != 0) {	
			//몇번째 자동차
			for (int i = 0; i < car.size(); i++) {	//i는 하나 의 라인 하나의 자동차
				//앞바퀴 뒷바퀴 !로 나눠서 배열에 저장
				frontTireSize = car.get(i).getC_ft().split("!");
				rearTireSize = car.get(i).getC_bt().split("!");
				

				
				
				//저장한것을 앞 : 뒤:  / 앞: 뒤: / 앞: 뒤:  로 보여주기 위해서  
				for (int j = 0; j < frontTireSize.length; j++) {
					
				
					TireSizes[i][j] = frontTireSize[j] +" "+ rearTireSize[j];
					System.out.println("TireSizes["+i+"]["+j+"]의 값 : "+TireSizes[i][j]);
				}
			}
			req.setAttribute("tires", TireSizes);
		}
		

		List<CarDTO> carBrands = ss.getMapper(AdminCarMapper.class).getAllCarBrands();

		int pageCount = (int) Math.ceil(CarCount / (double) count);

		System.out.println(allCarCount);
		System.out.println(start);
		System.out.println(end);
		
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("cars", car);
		req.setAttribute("carBrands", carBrands);
		req.setAttribute("curPage", pageNo);
		req.setAttribute("count", count);
		
	}

	//자동차 등록
	public void regCar(CarDTO c, HttpServletRequest req) {
		String carFT = "";
		String carRT = "";
		String uploadFolder = "";
		String fileRealName = "";
		for (int i = 0; i < c.getTf_inch().length; i++) {
			if((i+1) != c.getTf_inch().length) {  		
				//앞,뒤 타이어가 같을 경우
				if(c.getTb_width()[i].equals("0")) {			
					carFT+=c.getTf_width()[i] + "/" +  c.getTf_ratio()[i] + "R" + c.getTf_inch()[i] +"!";
					carRT+="!";
				}else {
					carFT += "전륜 : " + c.getTf_width()[i] + "/" + c.getTf_ratio()[i] + "R" + c.getTf_inch()[i]+"!";
					carRT += "후륜 : " + c.getTb_width()[i] + "/" + c.getTb_ratio()[i] + "R" + c.getTb_inch()[i]+"!";			
				}
			}else { //마지막일경우
				
				//앞,뒤 타이어가 같을 경우
				if(c.getTb_width()[i].equals("0")) {
					carFT+=c.getTf_width()[i] + "/" +  c.getTf_ratio()[i] + "R" + c.getTf_inch()[i];
					carRT+=" ";
				}else {	
					carFT+= "전륜 : " + c.getTf_width()[i] + "/" +  c.getTf_ratio()[i] + "R" + c.getTf_inch()[i];
					carRT+= "후륜 : " + c.getTb_width()[i] + "/" +  c.getTb_ratio()[i] + "R" + c.getTb_inch()[i];
				
				
				}
			}
		}
		c.setC_ft(carFT);
		c.setC_bt(carRT);

		System.out.println("전:"+c.getFile());
		//사진이 있을경우
		if(c.getFile() != null) {
			fileRealName = c.getFile().getOriginalFilename();

			System.out.println("파일명 : " + fileRealName);

			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
			uploadFolder = servletContext.getRealPath("resources/web/main/car");

			UUID uuid = UUID.randomUUID();
			System.out.println(uuid.toString());
			String[] uuids = uuid.toString().split("-");

			String uniqueName = uuids[0];
			System.out.println("생성된 고유문자열" + uniqueName);
			System.out.println("확장자명" + fileExtension);

			File saveFile = new File(uploadFolder + "\\" + uniqueName + fileExtension); // 적용 후
			try {
				c.getFile().transferTo(saveFile);
				c.setC_file(uniqueName + fileExtension);
				System.out.println(c);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}else {//사진이 없을경우		
			c.setC_file("없음");
		}
		System.out.println("후:"+c.getC_file());
		
		//c_brand로 car_brand의 id값 을 가져와서 c_cb_id에 세팅
		c.setC_cb_id(ss.getMapper(AdminCarMapper.class).getBrandId(c.getC_brand()));
		System.out.println("제대로 가져왔냐?" + c.getC_cb_id());
		//db저장
		if (ss.getMapper(AdminCarMapper.class).regCar(c) == 1) {
			System.out.println("등록성공");
			allCarCount++;
			req.setAttribute("r", "등록성공");
		} else {
			req.setAttribute("r", "등록 실패");
			new File(uploadFolder + "/" + fileRealName).delete();
	        System.out.println("삭제성공");
		}
	
	}

	public void updateCar(CarDTO c, HttpServletRequest req) {
		String uploadFolder = servletContext.getRealPath("resources/web/main/car");
		String carFT = "";
		String carRT = "";
		
		for (int i = 0; i < c.getTf_inch().length; i++) {
			if((i+1) != c.getTf_inch().length) {  		
				//앞,뒤 타이어가 같을 경우
				if(c.getTb_width()[i].equals("0")) {			
					carFT+=c.getTf_width()[i] + "/" +  c.getTf_ratio()[i] + "R" + c.getTf_inch()[i] +"!";
					carRT+="!";
				}else {//다를 경우
					carFT += "전륜 : " + c.getTf_width()[i] + "/" + c.getTf_ratio()[i] + "R" + c.getTf_inch()[i]+"!";
					carRT += "후륜 : " + c.getTb_width()[i] + "/" + c.getTb_ratio()[i] + "R" + c.getTb_inch()[i]+"!";			
				}
			}else { //마지막일경우
				//앞,뒤 타이어가 같을 경우
				if(c.getTb_width()[i].equals("0")) {
					carFT+=c.getTf_width()[i] + "/" +  c.getTf_ratio()[i] + "R" + c.getTf_inch()[i];
					carRT+=" ";
				}else {	//다를경우
					carFT+= "전륜 : " + c.getTf_width()[i] + "/" +  c.getTf_ratio()[i] + "R" + c.getTf_inch()[i];
					carRT+= "후륜 : " + c.getTb_width()[i] + "/" +  c.getTb_ratio()[i] + "R" + c.getTb_inch()[i];
				}
			}
			
			
		}
		c.setC_ft(carFT);
		c.setC_bt(carRT);
		System.out.println(c.getC_ft());
		System.out.println(c.getC_bt());
		
		// 파일이 업로드 되었을 때만 새로운 파일 생성
		if (c.getFile() != null) {
			String fileRealName = c.getFile().getOriginalFilename();
			long size = c.getFile().getSize();
			System.out.println("파일명 : " + fileRealName);
			System.out.println("용량크기(byte) : " + size);

			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
			UUID uuid = UUID.randomUUID();
			System.out.println(uuid.toString());
			String[] uuids = uuid.toString().split("-");
			String uniqueName = uuids[0];
			System.out.println("생성된 고유문자열 : " + uniqueName);
			System.out.println("확장자명 : " + fileExtension);
			File saveFile = new File(uploadFolder + "\\" + uniqueName + fileExtension);
			try {
				c.getFile().transferTo(saveFile);
				new File(uploadFolder + "/" + c.getC_file()).delete();
				c.setC_file(uniqueName + fileExtension);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println("c_file의 값 : " + c.getC_file());
		//c_brand로 car_brand의 id값 을 가져와서 c_cb_id에 세팅
		c.setC_cb_id(ss.getMapper(AdminCarMapper.class).getBrandId(c.getC_brand()));
		System.out.println(c.getC_id());
		try {
			if (ss.getMapper(AdminCarMapper.class).updatecar(c) == 1) {

				System.out.println("수정성공");
			} else {
				System.out.println("수정실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deletecar(CarDTO c, HttpServletRequest req) {
		if (ss.getMapper(AdminCarMapper.class).deletecar(c) == 1) {
			System.out.println("삭제완료");
			allCarCount--;
		}

	}

	public void searchcar(CarDTO c, HttpServletRequest req) {
		req.getSession().setAttribute("cars", c);
		System.out.println(req);
	}

	//수정페이지 갈때 
	public void getCar(CarDTO c, HttpServletRequest req) {
		List<CarDTO> carBrands = ss.getMapper(AdminCarMapper.class).getAllCarBrands();
		System.out.println(c.getC_id());
		
		CarDTO Car = ss.getMapper(AdminCarMapper.class).getCar(c);
		System.out.println(Car.toString());
		System.out.println(Car.getC_ft());
		System.out.println(Car.getC_bt());
		String[] frontTire =  Car.getC_ft().replaceAll("전륜 : ", "").replaceAll("/", "").replaceAll("R", "").split("!");
		String[] rearTire = Car.getC_bt().replaceAll("후륜 : ", "").replaceAll("/", "").replaceAll("R", "").split("!");
		
		
		//자동차 타이어 사이즈 업데이트 
		ArrayList<CarDTO> carTireSize = new ArrayList<CarDTO>();
		for (int i = 0; i < frontTire.length; i++) {
			System.out.println(rearTire[i].length());
			
			if(rearTire[i].length()<=1) {// 앞뒤 타이어 사이즈가 같을 경우
				carTireSize.add(new CarDTO(frontTire[i].substring(0,3),frontTire[i].substring(3,5),frontTire[i].substring(5,7)));				
			}else {// 앞뒤 타이어 사이즈가 다를경우
				carTireSize.add(new CarDTO(frontTire[i].substring(0,3),frontTire[i].substring(3,5),frontTire[i].substring(5,7)
										,rearTire[i].substring(0,3),rearTire[i].substring(3,5),rearTire[i].substring(5,7)));				
			}
			
		}
	
		req.setAttribute("car", Car);
		req.setAttribute("carTireSize", carTireSize);
		req.setAttribute("carbrands", carBrands);

	}

	//카브랜드
	public void deletebrand(CarDTO c, HttpServletRequest req) {

		if (ss.getMapper(AdminCarMapper.class).deletebrand(c) == 1) {
			System.out.println("삭제완료");
			allCarCount--;
		}

	}

	public void regbrand(CarDTO c, HttpServletRequest req) {
		if (ss.getMapper(AdminCarMapper.class).regbrand(c) == 1) {
			System.out.println("등록완료");

		}
	}

	public void getallCarBrands(HttpServletRequest req) {
		List<CarDTO> carBrands =  ss.getMapper(AdminCarMapper.class).getAllCarBrands();
		req.setAttribute("carbrands", carBrands);
		
		for (CarDTO c : carBrands) {
			c.setCb_num(ss.getMapper(AdminCarMapper.class).getallBrandCount(c.getCb_id()));		
		}
		
	}

	public int carBrandNameChange(CarDTO c) {
		//car 브랜드 이름 변경
		if(ss.getMapper(AdminCarMapper.class).carBrandChange(c)>=0) {
			System.out.println("변경 성공");
		}
		
		return ss.getMapper(AdminCarMapper.class).carBrandNameChange(c);
	}



}
