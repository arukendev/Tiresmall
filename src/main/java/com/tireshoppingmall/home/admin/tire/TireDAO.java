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
		
		int pageCount = (int) Math.ceil(tireCount / (double) count);
		req.setAttribute("count", count);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("tires", tires);
		req.setAttribute("curPage", pageNo);		
	}
	
	public void tirePasing(TireDTO tDTO, HttpServletRequest req) {
		req.getSession().setAttribute("tireDTO", tDTO);
	}
	
	
	
	
	
	//타이어 브랜드 작업~~~~~~!!!

	public void getTireBrand(HttpServletRequest req) {
		List<TireDTO> brands =ss.getMapper(AdminTireMapper.class).getTireBrand();
		
		for (TireDTO t : brands) {
			t.setTb_num(ss.getMapper(AdminTireMapper.class).getTireBrandCount(t.getTb_name()));
			System.out.println(t.getTb_name());
			System.out.println(t.getTb_num()+"개");
		}
		req.setAttribute("brands",brands);
		
	}
	public void deleteTireBrand(HttpServletRequest req, TireDTO tb) {
		
		if(ss.getMapper(AdminTireMapper.class).deleteTireBrand(tb)==1) {
			req.setAttribute("r", "삭제성공");
			allTireCount-=1;
		}else {
			req.setAttribute("r", "삭제실패");
		}
		
	}
	public void deleteTireGroup(HttpServletRequest req, TireDTO tg) {
		if(ss.getMapper(AdminTireMapper.class).deleteTireGroup(tg)==1) {
			req.setAttribute("r", "삭제성공");
			allTireCount-=1;
			pDAO.setAllProductGroupCount(pDAO.getAllProductGroupCount() - 1);
		}else {
			req.setAttribute("r", "삭제실패");
		}
		
		
	}
	
	//타이어 등록작업
	public void tireRegDo(TireListDTO tDTO, HttpServletRequest req, MultipartFile file, MultipartHttpServletRequest files) {

		
		String savePath = servletContext.getRealPath("resources/web/main/tire");
		System.out.println("일단 시작");
		
		
		
		
		try {
			pDAO.setAllProductGroupCount(pDAO.getAllProductGroupCount() + 1);
			allTireCount +=1;
			
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

		req.setAttribute("tireGroup", tireGroup);
		req.setAttribute("tireSizes", tireSizes);
		
	}
	
	
	
	
	
	
	
	
	
	
	
	public int tirePrintOnOff(TireDTO tg) {
		if(ss.getMapper(AdminTireMapper.class).tirePrintOnOff(tg) == 1) {
				return tg.getTg_print();
		}else {
			return 0;
		}
	}
	public int tireSedanRecommend(TireDTO tg) {
		if(ss.getMapper(AdminTireMapper.class).tireSedanRecommend(tg) == 1) {
			return tg.getTg_sedan();
		}else {
			return 0;
		}
	}
	public int tireSuvRecommend(TireDTO tg) {
		if(ss.getMapper(AdminTireMapper.class).tireSuvRecommend(tg) == 1) {
			return tg.getTg_suv();
		}else {
			return 0;
		}
	}
	public int tireSizeDelte(TireDTO tDTO) {
		System.out.println("여긴1");
		if(ss.getMapper(AdminTireMapper.class).tireSizeDelete(tDTO.getTi_tg_id())==1) {
			System.out.println("여긴2");
			return 1;
		}
		return 0;
	}
	
	
	
}
