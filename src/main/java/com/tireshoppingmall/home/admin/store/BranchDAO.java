package com.tireshoppingmall.home.admin.store;

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

import com.tireshoppingmall.home.admin.board.AdminBoardMapper;



@Service
public class BranchDAO {
	

	@Autowired
	private ServletContext servletContext;


	@Autowired
	private SqlSession ss;
	

	private AdminStoreMapper mapper;
	
	
	@Autowired
	private BranchOption bo;
	
	
	private int allBranchCount;
	
	public int getAllBranchCount() {
		return allBranchCount;
	}

	public void setAllBranchCount(int allBranchCount) {
		this.allBranchCount = allBranchCount;
	}

	

//	public void getAllBranch(Model m) {
//		mapper = ss.getMapper(AdminStoreMapper.class);
//		m.addAttribute("branchs", ss.getMapper(AdminStoreMapper.class).getAllBranch());
//	}
	
	
	public void calcAllBranchCount() {
		SearchBranchDTO sSel = new SearchBranchDTO("","", null, null);
		allBranchCount = ss.getMapper(AdminStoreMapper.class).getBranchCount(sSel);
		System.out.println(allBranchCount);
	}
	
	
	public void getBranchlist(int pageNo, HttpServletRequest req) {
		mapper = ss.getMapper(AdminStoreMapper.class);
		int count = bo.getBranchCountPerPage();
		int start = (pageNo - 1) * count + 1;
		int end = start + (count - 1);
		
		SearchBranchDTO search = (SearchBranchDTO) req.getSession().getAttribute("branchs");
		
		int BranchCount = 0;
		
		System.out.println("WWWWWWWWWWWWWWWW");
		System.out.println(search);
		System.out.println("WWWWWWWWWWWWWWWW");
		
		if (search == null) {
			System.out.println("null입니다");
			search = new SearchBranchDTO();
			search.setBranchnameInput("");
			search.setBranchareaInput("");
			search.setStart(new BigDecimal(start));
			search.setEnd(new BigDecimal(end));
			BranchCount = allBranchCount;
			System.out.println("1-------" + allBranchCount);
		}else {
			System.out.println("null아님");
			search.setStart(new BigDecimal(start));
			search.setEnd(new BigDecimal(end));
			BranchCount = ss.getMapper(AdminStoreMapper.class).getBranchCount(search);
			
		}
		
		List<BranchDTO> Branch = ss.getMapper(AdminStoreMapper.class).getBranchlist(search);
		System.out.println(Branch);
		System.out.println("@@@@@@@@@@@@@");
		System.out.println(count);
		System.out.println("@@@@@@@@@@@@@");
		System.out.println(allBranchCount);
		int pageCount = (int) Math.ceil(BranchCount / (double) count);
		System.out.println(BranchCount);
		System.out.println(pageCount);
	
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("branchs", Branch);
		req.setAttribute("curPage", pageNo);
		
		System.out.println(Branch);
		
		
	}




	 public void branchSearchbranchname(HttpServletRequest req, SearchBranchDTO b) {
		
	 if(req.getParameter("b_area1") != null) {
		 
		 
		 String b_area1 = req.getParameter("b_area1");
			String b_area2 = req.getParameter("b_area2");
				String BranchareaInput = b_area1 + "\t" + b_area2;
				b.setBranchareaInput(BranchareaInput);
				
				req.getSession(). setAttribute("branchs", b);
	 
	 
	 
	 }	
	 
	 req.getSession(). setAttribute("branchs", b);

		 
	}
	
	
	
	
	
	public void regBranch(MultipartFile file,BranchDTO b, HttpServletRequest req) {
		
		
		

		String b_id = req.getParameter("b_id");
		String b_area1 = req.getParameter("b_area1");
		String b_area2 = req.getParameter("b_area2");
		String b_area = b_area1 + "\t" + b_area2;
		String b_sortation = req.getParameter("b_sortation");
		String b_addr = req.getParameter("b_addr");
		String b_time = req.getParameter("b_time");
		String b_service = req.getParameter("b_service");
		String b_mapdata = req.getParameter("b_mapdata");
		String b_name = req.getParameter("b_name");
		String b_manager = req.getParameter("b_manager");
		String b_managernumber = req.getParameter("b_managernumber");
		String b_branchnumber = req.getParameter("b_branchnumber");
		String b_branchname = req.getParameter("b_branchname");
		String b_cr = req.getParameter("b_cr");
		String b_email = req.getParameter("b_email");

		b.setB_area(b_area);
		
	
		System.out.println(b_id);
		System.out.println(b_sortation);
		System.out.println(b_area);
		System.out.println(b_addr);
		System.out.println(b_name);
		System.out.println(b_time);
		System.out.println(b_service);
		System.out.println(b_mapdata);
		System.out.println(b_manager);
		System.out.println(b_managernumber);
		System.out.println(b_branchname);
		System.out.println(b_branchnumber);
		System.out.println(b_cr);
		System.out.println(b_email);

		
		
		
		
		String fileRealName = b.getFile().getOriginalFilename(); 
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
			b.getFile().transferTo(saveFile);
			b.setB_file(uniqueName+fileExtension);
			AdminStoreMapper mm = ss.getMapper(AdminStoreMapper.class);
			System.out.println("upload successed!");
			req.setAttribute("fileName", uniqueName+fileExtension);
		
			if (mm.regBranch(b) == 1) {
				allBranchCount++;
	            System.out.println("등록성공");
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
		
			
			
		

	

		

/*

	
	public void branchSearcharea(HttpServletRequest req, SearchBranchDTO b, Model m) {
		
		String b_area1 = req.getParameter("b_area1");
	String b_area2 = req.getParameter("b_area2");
		String BranchareaInput = b_area1 + "\t" + b_area2;
		b.setBranchareaInput(BranchareaInput);
		
		System.out.println(BranchareaInput);
		
		
		List<BranchDTO> branch = ss.getMapper(AdminStoreMapper.class).branchSearcharea(b);
		m.addAttribute("branchs", branch);
		System.out.println("---------------------------------");
		System.out.println(m);
	 }
	*/
	public void getbranch(BranchDTO b, HttpServletRequest req) {
		BranchDTO branch = mapper.getbranch(b);
		req.setAttribute("branch1", branch);

	}

	public void updatebranch(MultipartFile file, BranchDTO b, HttpServletRequest req) {
	    String b_area1 = req.getParameter("b_area1");
	    String b_area2 = req.getParameter("b_area2");
	    String b_area = b_area1 + "\t" + b_area2;
	    String b_sortation = req.getParameter("b_sortation");
	    String b_id = b.getB_id();
	    String b_addr = req.getParameter("b_addr");
	    String b_time = req.getParameter("b_time");
	    String b_service = req.getParameter("b_service");
	    String b_mapdata = req.getParameter("b_mapdata");
	    String b_name = req.getParameter("b_name");
	    String b_manager = req.getParameter("b_manager");
	    String b_managernumber = req.getParameter("b_managernumber");
	    String b_branchnumber = req.getParameter("b_branchnumber");
	    String b_branchname = req.getParameter("b_branchname");
	    String b_cr = req.getParameter("b_cr");
	    String b_email = req.getParameter("b_email");

	    b.setB_area(b_area);

	    // 파일 업로드가 되었을 때
	    if (!file.isEmpty()) { 
	        String fileRealName = file.getOriginalFilename(); 
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

	        File saveFile = new File(uploadFolder + "\\" + uniqueName + fileExtension);  // 적용 후

	        try {
	            file.transferTo(saveFile);
	            b.setB_file(uniqueName + fileExtension);
	        } catch (IllegalStateException e) {
	            e.printStackTrace();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    } else { // 파일 업로드를 하지 않았을 때
	        // 기존 DB에 있는 파일명을 유지
	        AdminStoreMapper mm = ss.getMapper(AdminStoreMapper.class);
	        BranchDTO existingBranch = mm.getbranch(b);
	        if (existingBranch != null) {
	            b.setB_file(existingBranch.getB_file());
	        }
	    }

	    AdminStoreMapper mm = ss.getMapper(AdminStoreMapper.class);
	    int updateResult = mm.updatebranch(b);
	    if (updateResult == 1) {
	        allBranchCount++;
	        System.out.println("등록성공");
	        req.setAttribute("r", "등록성공");
	    } else {
	        req.setAttribute("r", "등록 실패");
	    }
	}
		

	

	public void deletebranch(BranchDTO b, HttpServletRequest req) {
		if (mapper.deletebranch(b) == 1) {
			System.out.println("삭제완료");
			allBranchCount--;
		}

	}


	
	
	//public void menuSession(AdminMenuSession menuSession, HttpServletRequest req) {
	//	AdminMenuSession menu = (AdminMenuSession) req.getSession().getAttribute("menuSession");
		//menu.setMenu("store");



	

}
