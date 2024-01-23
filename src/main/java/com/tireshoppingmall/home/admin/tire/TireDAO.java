package com.tireshoppingmall.home.admin.tire;

import java.io.File;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tireshoppingmall.home.product.ProductDAO;


@Service
public class TireDAO {
	
	@Autowired
	private SqlSession ss;
	
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private ProductDAO pDAO;
	
	@Autowired					// 주입 할려면 SC에서 추가해줘야함
	private TireOption no; 		// 한 페이지에 몇개 보여줄지 
	private int allTireCount;
	
	public int getAllTireCount() {
		return allTireCount;
	}
	public void setAllTireCount(int allTireCount) {
		this.allTireCount = allTireCount;
	}



	public void calcAllTireCount() {
		TireDTO startEnd = new TireDTO("", "", null, null);
		allTireCount =ss.getMapper(AdminTireMapper.class).getTireCount(startEnd);
	}
	
	
	public void getAllTireGroup(int pageNo, HttpServletRequest req) {
		int count = no.getTireCountPerPage();
		int start = (pageNo - 1) * count + 1;
		int end = start + (count - 1);

		TireDTO paging = (TireDTO)req.getSession().getAttribute("tireDTO");

		int tireCount = 0;
		if (paging == null) {
			paging = new TireDTO();
			paging.setTg_brand("");
			paging.setTg_name("");
			paging.setStart(new BigDecimal(start));
			paging.setEnd(new BigDecimal(end));
			tireCount = allTireCount;		
		}else {
			paging.setStart(new BigDecimal(start));
			paging.setEnd(new BigDecimal(end));
			tireCount = ss.getMapper(AdminTireMapper.class).getTireCount(paging);
		}
		
		List<TireDTO> tires = ss.getMapper(AdminTireMapper.class).getAllTireGroup(paging);
		
		for (TireDTO t : tires) {		/*몇개인지 갯수   */
			t.setTg_num(ss.getMapper(AdminTireMapper.class).getTireCountByMz(t.getTg_id()));
		}
		
		
		List<TireDTO> tireBrands = ss.getMapper(AdminTireMapper.class).getTireBrandPrint();
	//	List<TireDTO> tireBrands = ss.getMapper(AdminTireMapper.class).getTireBrand();

		
		int pageCount = (int) Math.ceil(tireCount / (double) count);
		req.setAttribute("count", count);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("tires", tires);
		req.setAttribute("tireBrands", tireBrands);		
		req.setAttribute("curPage", pageNo);		
	}
	
	public void tirePasing(TireDTO tDTO, HttpServletRequest req) {
		req.getSession().setAttribute("tireDTO", tDTO);
	}
	
	
	
	
	
	//타이어 브랜드 작업~~~~~~!!!
	public void getTireBrand(HttpServletRequest req) {
		List<TireDTO> brands = ss.getMapper(AdminTireMapper.class).getTireBrand();
		
		for (TireDTO t : brands) {
			t.setTb_num(ss.getMapper(AdminTireMapper.class).getTireBrandCount(t.getTb_name()));
		}
		
		
		req.setAttribute("brands",brands);
		
	}

//	ArrayList<String> list = (ArrayList)session.getAttribute("productlist"); 
//	String productname = request.getParameter("product");  
//	if(list==null) {  
//		list = new ArrayList<String>(); 
//		session.setAttribute("productlist", list); 
//	} 
//	
//	list.add(productname); 
	
	
	public void deleteTireBrand(HttpServletRequest req, TireDTO tb) {
		
		if(ss.getMapper(AdminTireMapper.class).deleteTireBrand(tb)==1) {
			req.setAttribute("r", "삭제성공");
			
			
			
			
			
		}else {
			req.setAttribute("r", "삭제실패");
		}
		
	}
	
	public void deleteTireGroup(HttpServletRequest req, TireDTO tg) {
		if(ss.getMapper(AdminTireMapper.class).deleteTireGroup(tg)==1) {
			req.setAttribute("r", "삭제성공");
			allTireCount--;
			pDAO.setAllProductGroupCount(pDAO.getAllProductGroupCount() - 1);
		}else {
			req.setAttribute("r", "삭제실패");
		}
		
		
	}
	
	//타이어 등록작업
	public void tireRegDo(TireListDTO tDTO, HttpServletRequest req, MultipartFile file, MultipartHttpServletRequest files) {

		
		String savePath = servletContext.getRealPath("resources/web/main/tire");

		try {
			
			allTireCount++;
			
			String fileName = file.getOriginalFilename();
			System.out.println("원래 파일이름 : "+fileName);
			System.out.println("파일 경로 : "+savePath);
			
			String saveFileName= UUID.randomUUID().toString()+
					fileName.substring(fileName.lastIndexOf("."));
			
			System.out.println("저장된 파일이름 : "+saveFileName);
			tDTO.setTg_img(saveFileName);	//이름 저장
			
			//파일 업로드
			file.transferTo(new File(savePath,saveFileName));
			System.out.println("파일 업로드 성공");
			//상세설명 사진 업로드
			
			if(files.getFiles("files")!=null) {
				List<MultipartFile> list = files.getFiles("files");
				
				for(int i = 0; i<list.size(); i++) {
					String fileRealName = list.get(i).getOriginalFilename();
					
					System.out.println(list.get(i).getOriginalFilename());
					String saveFilesName =	UUID.randomUUID().toString() +
								fileRealName.substring(fileRealName.lastIndexOf("."));
					
					System.out.println("여러파일들 이름 : " + i +"번째파일  - " + saveFilesName );
					
					File saveFile = new File(savePath + "\\"+ saveFilesName);	
					if(i == 0) {
						tDTO.setTg_detail(saveFilesName);				
					}else {
						tDTO.setTg_detail(tDTO.getTg_detail()+ "!" + saveFilesName);//말해야할것										
					}
					list.get(i).transferTo(saveFile);	//파일들 업로드
				
				}
				System.out.println("파일들 업로드 성공~~~~~~~~!!!!!!!!!!!");
				System.out.println(savePath);
				pDAO.setAllProductGroupCount(pDAO.getAllProductGroupCount() + 1);
			}
			
			//db에 저장된 값 확인
			System.out.println("DB에 저장된 디테일이름 : " + tDTO.getTg_detail());
			System.out.println("선택 안하면???"+tDTO.getTg_suv());
			System.out.println(tDTO.getTg_dcrate());
			
			
			//타이어 그룹
			System.out.println("왜무결성이지????????");
			tDTO.setTi_tg_id(ss.getMapper(AdminTireMapper.class).tireGroupReg(tDTO));
			System.out.println("타이어 그룹 등록 성공");
			
			//등록된 타이어 그룹의 pk값 가져오기
			tDTO.setTi_tg_id(ss.getMapper(AdminTireMapper.class).getTireGroupPk(tDTO.getTg_name()));
			System.out.println("타이어 그룹 pk가져오기 성공");
			System.out.println(tDTO.getTi_tg_id());
			//메퍼에서 한번에 올리리기
			//ss.getMapper(AdminTireMapper.class).tierItemReg2(tDTO);
			
			for (int i = 0; i < tDTO.getTi_width().length; i++) {
				System.out.println("여기는??" +tDTO.getTi_marking()[i]);
				Map<String, String> tireSize = new HashMap<String, String>();
				//bigdecimal  못찾아서 형변환해줌.....ㅠㅠ
				tireSize.put("ti_tg_id", Integer.toString(tDTO.getTi_tg_id()));
				tireSize.put("ti_marking", tDTO.getTi_marking()[i]);
				tireSize.put("ti_width", Integer.toString(tDTO.getTi_width()[i]));
				tireSize.put("ti_ratio", Integer.toString(tDTO.getTi_ratio()[i]));
				tireSize.put("ti_inch", Integer.toString(tDTO.getTi_inch()[i]));
				tireSize.put("ti_stock", Integer.toString(tDTO.getTi_stock()[i]));
				tireSize.put("ti_pricefac", Integer.toString(tDTO.getTi_pricefac()[i]));
				
				ss.getMapper(AdminTireMapper.class).tierItemReg(tireSize);
			}
			
			
			System.out.println("타이어 아이템 등록 성공");

		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("등록 실패");
			req.setAttribute("r", "등록실패");
			allTireCount--;
			//파일삭제
	        new File(savePath + "/" + tDTO.getTg_img()).delete();
	        System.out.println("삭제성공");
	        //파일들 삭제
	        List<MultipartFile> list = files.getFiles("files");
	        String[] filesName = tDTO.getTg_detail().split("!");
	    	for(int i = 0; i<list.size(); i++) {
	    		new File(savePath + "!" + filesName[i]).delete();
	    		System.out.println("파일들 삭제 성공" +i);
	    	}
	    
		} 	
	}
	public void getTireItem(TireDTO tDTO, HttpServletRequest req) {		
		TireDTO tireGroup =ss.getMapper(AdminTireMapper.class).getTireGroupDetail(tDTO.getTg_id());
		
		List<TireDTO> tireSizes = ss.getMapper(AdminTireMapper.class).getTireItem(tDTO);

		String[] filesName = tireGroup.getTg_detail().split("!");

		req.setAttribute("tireGroup", tireGroup);
		req.setAttribute("filesName", filesName);
		req.setAttribute("tireSizes", tireSizes);
		
	}
	
	
	
	
	
	
	
	
	
	
	
	public int tirePrintOnOff(TireDTO tDTO) {
		if(ss.getMapper(AdminTireMapper.class).tirePrintOnOff(tDTO) == 1) {
				return tDTO.getTg_print();
		}else {
			return 0;
		}
	}
	public int tireSedanRecommend(TireDTO tDTO) {
		if(ss.getMapper(AdminTireMapper.class).tireSedanRecommend(tDTO) == 1) {
			return tDTO.getTg_sedan();
		}else {
			return 0;
		}
	}
	public int tireSuvRecommend(TireDTO tDTO) {
		if(ss.getMapper(AdminTireMapper.class).tireSuvRecommend(tDTO) == 1) {
			return tDTO.getTg_suv();
		}else {
			return 0;
		}
	}
	
	public int tireGroupDcrateChange(TireDTO tDTO) {
		if(ss.getMapper(AdminTireMapper.class).tireGroupDcrateChange(tDTO) == 1) {
			return 1;
		}else {
			return 0;
		}
	}
	
	
	
	public int tireSizeDelte(TireDTO tDTO) {
		if(ss.getMapper(AdminTireMapper.class).tireSizeDelete(tDTO.getTi_id())==1) {
			return 1;
		}
		return 0;
	}
	public int tireSizeChange(TireDTO tDTO) {
		if(ss.getMapper(AdminTireMapper.class).tireSizeChage(tDTO)==1) {
			return 1;
		}
		return 0;
	}
	public int tireMarckingChange(TireDTO tDTO) {
		if(ss.getMapper(AdminTireMapper.class).tireMarckingChange(tDTO)==1) {
			return 1;
		}
		return 0;
	}
	public int tirePriceChange(TireDTO tDTO) {
		if(ss.getMapper(AdminTireMapper.class).tirePriceChange(tDTO)==1) {
			return 1;
		}
		return 0;
	}
	public int tireStockChange(TireDTO tDTO) {
		if(ss.getMapper(AdminTireMapper.class).tireStockChange(tDTO)==1) {
			return 1;
		}
		return 0;
	}
	public int tireSBrandPrintOnoff(TireDTO tDTO) {
		if(ss.getMapper(AdminTireMapper.class).tireBrandPrintOnOff(tDTO) == 1) {
			return tDTO.getTb_ea();
		}else {
			return 0;
		}
	}
	public int tireSBrandNameChange(TireDTO tDTO) {
		if(ss.getMapper(AdminTireMapper.class).tireGroupBrandNameChange(tDTO)>=0) {
			System.out.println("타이어 그룹 브랜드명 변경완료");
		}
		
		if(ss.getMapper(AdminTireMapper.class).tireBrandNameChange(tDTO) == 1) {
			return 1;
		}else {
			return 0;
		}
	}
	public int tireBrandOrderChange(TireDTO tDTO) {
		if(ss.getMapper(AdminTireMapper.class).tireBrandOrderChange(tDTO) == 1) {
			return 1;
		}else {
			return 0;
		}
	}
	
	
	public void regTireBrand(HttpServletRequest req, TireDTO tDTO, MultipartFile file) {
		
		String savePath = servletContext.getRealPath("resources/web/main/tire/brand");
		
		try {
			
			//파일이 있을때
			if(file != null) {
				
				String fileName = file.getOriginalFilename();
				System.out.println("원래 파일이름 : "+ fileName);
				System.out.println("파일 경로 : "+ savePath);
					
				String saveFileName= UUID.randomUUID().toString()+
						fileName.substring(fileName.lastIndexOf("."));
					
				System.out.println("저장된 파일이름 : "+saveFileName);
				tDTO.setTb_img(saveFileName);	//이름 저장
					
				//파일 업로드
				
				file.transferTo(new File(savePath,saveFileName));
				System.out.println("파일 업로드 성공");

				//이제 db등록
				ss.getMapper(AdminTireMapper.class).regTireBrand(tDTO);
			}else {
				tDTO.setTb_img(tDTO.getTb_img());
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("등록 실패");
			//파일삭제
	        new File(savePath + "/" + tDTO.getTb_img()).delete();
	        System.out.println("삭제성공");
		} 
		
		
	}
	public int adminTireSizeNewInsertReg(TireDTO tDTO) {
		if(ss.getMapper(AdminTireMapper.class).adminTireSizeNewInsertReg(tDTO) == 1) {
			return 1;
		}else {
			return 0;
		}
	}
	//ajax이미지 저장
	public int tireImgChange(TireDTO tDTO, MultipartFile file) {
		//파일 삭제
		
	      
		return ss.getMapper(AdminTireMapper.class).tireImgUpdate(tDTO);
	}
	public int tireImgsChange(TireDTO tDTO, MultipartHttpServletRequest files) {
		//파일들 삭제
		String savePath = servletContext.getRealPath("resources/web/main/tire");
		
		if(!tDTO.getTg_detail().equals("noimg")) {
			List<MultipartFile> list = files.getFiles("files");
		    String[] filesName = tDTO.getTg_detail().split("!");
		    for(int i = 0; i<list.size(); i++) {
		    	new File(savePath + "!" + filesName[i]).delete();
		    		System.out.println("파일들 삭제 성공" +i);
		    }
		}
	    
	    
	    try {
	    	if(files.getFiles("files")!=null) {
				List<MultipartFile> list1 = files.getFiles("files");
				
				for(int i = 0; i<list1.size(); i++) {
					String fileRealName = list1.get(i).getOriginalFilename();
					
					String saveFilesName =	UUID.randomUUID().toString()+
								fileRealName.substring(fileRealName.lastIndexOf("."));
					
					System.out.println("여러파일들 이름 : " +i+"번째파일  - " +saveFilesName );
					
					File saveFile = new File(savePath + "\\"+ saveFilesName);	
					if(i == 0) {
						tDTO.setTg_detail(saveFilesName);				
					}else {
						tDTO.setTg_detail(tDTO.getTg_detail()+ "!" + saveFilesName);//말해야할것										
					}
					list1.get(i).transferTo(saveFile);	//파일들 업로드
				
				}
				System.out.println("파일들 업로드 성공~~~~~~~~!!!!!!!!!!!");
				System.out.println(savePath);
			}    	
		} catch (Exception e) {
			e.printStackTrace();
		}
	    
	    
		return ss.getMapper(AdminTireMapper.class).tireImgsUpdate(tDTO);
	}
	
	
	
	
	public void tireUpdate(MultipartFile file, MultipartHttpServletRequest files, HttpServletRequest req,
			TireListDTO tDTO) {
		
		String savePath = servletContext.getRealPath("resources/web/main/tire");
		
		//기존 저장 자료
		TireDTO tireGroup =ss.getMapper(AdminTireMapper.class).getTireGroupDetail(tDTO.getTg_id());
		
		try {
			
			//파일이 있을때
			if(file != null) {
				if(!tireGroup.getTg_img().equals("noimg")) {
					new File(savePath + "/" + tireGroup.getTg_img()).delete();
				    System.out.println("삭제성공");

				}
				String fileName = file.getOriginalFilename();
				System.out.println("원래 파일이름 : "+fileName);
				System.out.println("파일 경로 : "+savePath);
					
				String saveFileName= UUID.randomUUID().toString()+
						fileName.substring(fileName.lastIndexOf("."));
					
				System.out.println("저장된 파일이름 : "+saveFileName);
				tDTO.setTg_img(saveFileName);	//이름 저장
					
				//파일 업로드
				
				file.transferTo(new File(savePath,saveFileName));
				System.out.println("파일 업로드 성공");
			}else {
				tDTO.setTg_img(tireGroup.getTg_img());
			}
			
			
			
			
			//파일들이  있을떄 
			if(files.getFiles("files").size() != 0) {
				
				//그전 파일 삭제
			    String[] filesName = tireGroup.getTg_detail().split("!");
			    for(int i = 0; i<filesName.length; i++) {
			    	new File(savePath + "!" + filesName[i]).delete();
			    		System.out.println("파일들 삭제 성공" +i);
			    }
				
				//파일  새로업데이트
				List<MultipartFile> list = files.getFiles("files");	
				
				for(int i = 0; i<list.size(); i++) {
					String fileRealName = list.get(i).getOriginalFilename();
					
					String saveFilesName =	UUID.randomUUID().toString()+
								fileRealName.substring(fileRealName.lastIndexOf("."));
					
					System.out.println("여러파일들 이름 : " +i+"번째파일  - " +saveFilesName );
					
					File saveFile = new File(savePath + "\\"+ saveFilesName);	
					if(i == 0) {
						tDTO.setTg_detail(saveFilesName);				
					}else {
						tDTO.setTg_detail(tDTO.getTg_detail()+ "!" + saveFilesName);//말해야할것										
					}
					list.get(i).transferTo(saveFile);	//파일들 업로드
				
				}
				System.out.println("파일들 업로드 성공~~~~~~~~!!!!!!!!!!!");
				System.out.println(savePath);
			}else {
				tDTO.setTg_detail(tireGroup.getTg_detail());
			}

		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		
		//이제 업데이트
		if(ss.getMapper(AdminTireMapper.class).getTireGroupUpdate(tDTO)==1){
			System.out.println("업데이트 성공");
		}else{
			System.out.println("업데이트 실패");
		}
		
		
		
		
		
		
	}
	public int tireBrandImgChange(MultipartFile[] file, TireDTO tDTO) {
		
		tDTO = ss.getMapper(AdminTireMapper.class).getOneTireBrand(tDTO);
	
		return ss.getMapper(AdminTireMapper.class).adminTireBrandImgChange(tDTO);
	}
	
	
	
	public void getTireBrandMenu(HttpServletRequest req) {
		List<TireDTO> brands = ss.getMapper(AdminTireMapper.class).getTireBrandPrint();
		
		req.getSession().setAttribute("brands", brands);
		req.getSession().setMaxInactiveInterval(60*60);
		
		req.setAttribute("brands",brands);
	} 
	
	
	
	


	
	
	
}
