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
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.tireshoppingmall.home.admin.car.CarDTO;
import com.tireshoppingmall.home.admin.car.CarOption;
import com.tireshoppingmall.home.admin.car.SearchCarDTO;
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
	//페이징작업
	public void calcAllCarCount() {
		CarDTO strartEnd = new CarDTO("","",null,null);
		allCarCount = ss.getMapper(AdminCarMapper.class).getCarCount(strartEnd);		
	}
	//카 모든것 가져오기
	public void getAllCar(int pageNo, HttpServletRequest req) {
		mapper = ss.getMapper(AdminCarMapper.class);
		int count = co.getCarCountPerPage();
		int start = (pageNo - 1) * count + 1;
		int end = start + (count - 1);
		
		CarDTO paging = (CarDTO) req.getSession().getAttribute("cars");
		int CarCount = 0;
		if (paging == null) {
			System.out.println("null입니다");
			
			paging = new CarDTO();
			paging.setC_name("");
			paging.setC_brand("");
			paging.setStart(new BigDecimal(start));
			paging.setEnd(new BigDecimal(end));
			CarCount = allCarCount;
		}else {
			paging.setStart(new BigDecimal(start));
			paging.setEnd(new BigDecimal(end));
			CarCount = ss.getMapper(AdminCarMapper.class).getCarCount(paging);
		}

		List<CarDTO> Car = ss.getMapper(AdminCarMapper.class).getAllCar(paging);

		int pageCount = (int) Math.ceil(CarCount / (double) count);
	
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("cars", Car);
		req.setAttribute("curPage", pageNo);
		
	}
	
	

	public void regCar(MultipartFile file, CarDTO c, HttpServletRequest req) {
		
		String fileRealName = c.getFile().getOriginalFilename(); 
		long size = file.getSize(); 
		
		System.out.println("파일명 : "  + fileRealName);
		System.out.println("용량크기(byte) : " + size);
		
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
		String uploadFolder = servletContext.getRealPath("resources/web");
		
		
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());
		String[] uuids = uuid.toString().split("-");
		
		String uniqueName = uuids[0];
		System.out.println("생성된 고유문자열" + uniqueName);
		System.out.println("확장자명" + fileExtension);
		
		

		File saveFile = new File(uploadFolder+"\\"+uniqueName + fileExtension);  // 적용 후
		
	
		try {
			c.getFile().transferTo(saveFile);
			c.setC_file(uniqueName+fileExtension);
			AdminCarMapper mm = ss.getMapper(AdminCarMapper.class);
			System.out.println("upload successed!");
			req.setAttribute("fileName", uniqueName+fileExtension);
			
			System.out.println(c);
		
			if (mm.regCar(c) == 1) {
	            System.out.println("등록성공");
	            allCarCount++;
	            req.setAttribute("r", "등록성공");
	        } else {
	            req.setAttribute("r", "등록 실패");
	        }

	    } catch (IllegalStateException e) {
	        e.printStackTrace();
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	}
	
	
	public void updateCar(MultipartFile file, CarDTO c, HttpServletRequest req) {
	    String uploadFolder = servletContext.getRealPath("resources/web");

	    // 파일이 업로드 되었을 때만 새로운 파일 생성
	    if (!file.isEmpty()) {
	        String fileRealName = file.getOriginalFilename();
	        long size = file.getSize();
	        System.out.println("파일명 : "  + fileRealName);
	        System.out.println("용량크기(byte) : " + size);
	        
	        String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
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



	

 
	
 	public void searchcar(SearchCarDTO c, HttpServletRequest req) {
		req.getSession().setAttribute("cars", c);
		System.out.println(req);
	}


	public void getCar(CarDTO c, HttpServletRequest req) {
		CarDTO Car = mapper.getCar(c);
		req.setAttribute("car1", Car);
		

	}

	public void deletebrand(CarBrandDTO c, HttpServletRequest req) {
		ss.getMapper(AdminCarMapper.class).deletebrandcar(c);
		
		if (ss.getMapper(AdminCarMapper.class).deletebrand(c) == 1) {
			System.out.println("삭제완료");
			allCarCount--;
		}
		
	}

	public void regbrand(CarBrandDTO c, HttpServletRequest req) {
		
		AdminCarMapper mm = ss.getMapper(AdminCarMapper.class);
		
		if (mm.regbrand(c) == 1) {
			System.out.println("등록완료");
			
		}
		
		
	}

	public void getCarbrandselectlist(Model m) {
		
		m.addAttribute("carbrand", ss.getMapper(AdminCarMapper.class).getCarbrandselectlist());
	}


	
	public void getallCarBrands(Model m) {
		
		m.addAttribute("carbrands", ss.getMapper(AdminCarMapper.class).getAllCarBrands());
	
		
	}

	public void getallBrandCount(CarBrandDTO c,Model m) {
		m.addAttribute("carcount", ss.getMapper(AdminCarMapper.class).getallBrandCount(c));
	}
		
	
	//	public void menuSession(AdminMenuSession menuSession, HttpServletRequest req) {
		//	AdminMenuSession menu = (AdminMenuSession) req.getSession().getAttribute("menuSession");
		//	menu.setMenu("store");
	
	
		
	// public void getAllCar(Model m) {
			
			
	//	}
	
	public void updatebrand(CarBrandDTO c, HttpServletRequest req) {
		AdminCarMapper mm = ss.getMapper(AdminCarMapper.class);
		
		
		if (mm.updatebrand(c) == 1) {
		System.out.println(c);
	
			mm.updatebrandcar(c);
			System.out.println("수정완료");
		}else {
			System.out.println("수정실패");
		}
		
	}
	
	public int carprintOnOff(CarDTO c) {
		if (ss.getMapper(AdminCarMapper.class).carprintOnOff(c) == 1) {
			System.out.println("**************************");
			System.out.println(ss.getMapper(AdminCarMapper.class).carprintOnOff(c));
			System.out.println("**************************");
			return c.getC_print();
		}else {
			return 0;
		}
	}

		
	
}


