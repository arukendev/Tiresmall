package com.tireshoppingmall.home.admin.car;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tireshoppingmall.home.admin.car.CarDTO;
import com.tireshoppingmall.home.admin.car.CarOption;

@Service
public class CarDAO {

	@Autowired
	private ServletContext servletContext;

	@Autowired
	private SqlSession ss;

	private AdminCarMapper mapper;

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
		mapper = ss.getMapper(AdminCarMapper.class);
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

		//사진이 있을경우
		if(c.getFile() != null) {
			String fileRealName = c.getFile().getOriginalFilename();

			System.out.println("파일명 : " + fileRealName);

			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
			String uploadFolder = servletContext.getRealPath("resources/web/main/car");

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
				AdminCarMapper mm = ss.getMapper(AdminCarMapper.class);
				System.out.println("upload successed!");
				req.setAttribute("fileName", uniqueName + fileExtension);

				System.out.println(c);

				if (mm.regCar(c) == 1) {
					System.out.println("등록성공");
					allCarCount++;
					req.setAttribute("r", "등록성공");
				} else {
					req.setAttribute("r", "등록 실패");
					new File(uploadFolder + "/" + fileRealName).delete();
			        System.out.println("삭제성공");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}else {//사진이 없을경우
			String carFT="";
			String carRT="";
			
			for (int i = 0; i < c.getTire_input_inch1().length; i++) {
				if((i+1) != c.getTire_input_inch1().length) { 
					carFT+= c.getTire_input_width1()[i] + c.getTire_input_ratio1()[i] + c.getTire_input_inch1()[i]+"/";
					carRT+= c.getTire_input_width2()[i] + c.getTire_input_ratio2()[i] + c.getTire_input_inch2()[i]+"/";
				}else { //마지막일경우
					carFT+= c.getTire_input_width1()[i] + c.getTire_input_ratio1()[i] + c.getTire_input_inch1()[i];
					carRT+= c.getTire_input_width2()[i] + c.getTire_input_ratio2()[i] + c.getTire_input_inch2()[i];
				}
				
			}
			
		}
	
	}

	public void updateCar(MultipartFile file, CarDTO c, HttpServletRequest req) {
		String uploadFolder = servletContext.getRealPath("resources/web");

		// 파일이 업로드 되었을 때만 새로운 파일 생성
		if (!file.isEmpty()) {
			String fileRealName = file.getOriginalFilename();
			long size = file.getSize();
			System.out.println("파일명 : " + fileRealName);
			System.out.println("용량크기(byte) : " + size);

			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
			UUID uuid = UUID.randomUUID();
			System.out.println(uuid.toString());
			String[] uuids = uuid.toString().split("-");
			String uniqueName = uuids[0];
			System.out.println("생성된 고유문자열" + uniqueName);
			System.out.println("확장자명" + fileExtension);
			File saveFile = new File(uploadFolder + "\\" + uniqueName + fileExtension);
			try {
				file.transferTo(saveFile);
				c.setC_file(uniqueName + fileExtension);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			// 파일이 업로드 되지 않았을 때 기존 파일명을 유지
			c.setC_file(c.getFile().getOriginalFilename());
		}

		AdminCarMapper mm = ss.getMapper(AdminCarMapper.class);
		try {
			if (mm.updatecar(c) == 1) {
				System.out.println(c);
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

	public void getCar(CarDTO c, HttpServletRequest req) {
		CarDTO Car = mapper.getCar(c);
		req.setAttribute("car1", Car);

	}

	public void deletebrand(CarDTO c, HttpServletRequest req) {
		ss.getMapper(AdminCarMapper.class).deletebrandcar(c);

		if (ss.getMapper(AdminCarMapper.class).deletebrand(c) == 1) {
			System.out.println("삭제완료");
			allCarCount--;
		}

	}

	public void regbrand(CarDTO c, HttpServletRequest req) {
		AdminCarMapper mm = ss.getMapper(AdminCarMapper.class);
		if (mm.regbrand(c) == 1) {
			System.out.println("등록완료");

		}
	}

	public void getallCarBrands(HttpServletRequest req) {
		
		req.setAttribute("carbrands", ss.getMapper(AdminCarMapper.class).getAllCarBrands());
		
	}

	public void getallBrandCount(CarDTO c, HttpServletRequest req) {
		req.setAttribute("carcount", ss.getMapper(AdminCarMapper.class).getallBrandCount(c));
	}

	public void updatebrand(CarDTO c, HttpServletRequest req) {
		AdminCarMapper mm = ss.getMapper(AdminCarMapper.class);

		if (mm.updatebrand(c) == 1) {
			System.out.println(c);

			mm.updatebrandcar(c);
			System.out.println("수정완료");
		} else {
			System.out.println("수정실패");
		}
	}



}
