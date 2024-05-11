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

@Service
public class BranchDAO {

	@Autowired
	private ServletContext servletContext;

	@Autowired
	private SqlSession ss;

	@Autowired
	private BranchOption bo;

	private int allBranchCount;

	public int getAllBranchCount() {
		return allBranchCount;
	}

	public void setAllBranchCount(int allBranchCount) {
		this.allBranchCount = allBranchCount;
	}

	public void calcAllBranchCount() {
		BranchDTO sSel = new BranchDTO("", "", null, null);
		allBranchCount = ss.getMapper(AdminStoreMapper.class).getBranchCount(sSel);
		System.out.println(allBranchCount);
	}

	public void getAllBranch(int pageNo, HttpServletRequest req) {
		int count = bo.getBranchCountPerPage();
		int start = (pageNo - 1) * count + 1;
		int end = start + (count - 1);

		BranchDTO pasing = (BranchDTO) req.getSession().getAttribute("branchDTO");
		int BranchCount = 0;
		
		if (pasing == null) {
			pasing = new BranchDTO();
			pasing.setB_name("");
			pasing.setB_area("");
			pasing.setStart(new BigDecimal(start));
			pasing.setEnd(new BigDecimal(end));
			BranchCount = allBranchCount;
		} else {
			pasing.setStart(new BigDecimal(start));
			pasing.setEnd(new BigDecimal(end));
			BranchCount = ss.getMapper(AdminStoreMapper.class).getBranchCount(pasing);
		}
		
		System.out.println("여기가 문제인가?1");
		System.out.println(pasing.getB_area());
		System.out.println(pasing.getB_name());
		List<BranchDTO> Branch = ss.getMapper(AdminStoreMapper.class).getBranchlist(pasing);

		int pageCount = (int) Math.ceil(BranchCount / (double) count);
		System.out.println(BranchCount);
		System.out.println(pageCount);

		req.setAttribute("pageCount", pageCount);
		req.setAttribute("branchs", Branch);
		req.setAttribute("curPage", pageNo);

		System.out.println(Branch);

	}
	
	public void regBranch(BranchDTO bDTO, HttpServletRequest req) {

		String fileRealName = bDTO.getFile().getOriginalFilename();
		String fileRealName2 = bDTO.getFile2().getOriginalFilename();
		long size = bDTO.getFile().getSize();

		System.out.println("파일명 : " + fileRealName);
		System.out.println("용량크기(byte) : " + size);

		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
		String fileExtension2 = fileRealName2.substring(fileRealName.lastIndexOf("."), fileRealName.length());
		String uploadFolder = servletContext.getRealPath("resources/web/main/store");

		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());
		String[] uuids = uuid.toString().split("-");
		uuid = UUID.randomUUID();
		String[] uuids2 = uuid.toString().split("-");
		
		
		String uniqueName = uuids[0];
		String uniqueName2 = uuids2[0];
		System.out.println("생성된 고유문자열" + uniqueName);
		System.out.println("확장자명" + fileExtension);

		File saveFile = new File(uploadFolder + "\\" + uniqueName + fileExtension); // 적용 후
		File saveFile2 = new File(uploadFolder + "\\" + uniqueName2 + fileExtension2); // 적용 후
		try {
			bDTO.getFile().transferTo(saveFile);
			bDTO.setB_file(uniqueName + fileExtension);
			
			bDTO.getFile2().transferTo(saveFile2);
			bDTO.setB_mainimg(uniqueName2 + fileExtension2);
			
			System.out.println("upload successed!");
			req.setAttribute("fileName", uniqueName + fileExtension);
			req.setAttribute("fileName2", uniqueName2 + fileExtension2);
			
			if (ss.getMapper(AdminStoreMapper.class).regBranch(bDTO) == 1) {
				allBranchCount++;
				System.out.println("등록성공");
				req.setAttribute("r", "등록성공");
			} else {
				req.setAttribute("r", "등록 실패");
			}

		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public void getbranch(BranchDTO bDTO, HttpServletRequest req) {
		BranchDTO branch = ss.getMapper(AdminStoreMapper.class).getbranch(bDTO);

		System.out.println("왜 안나올까 사진이");
		System.out.println(branch.getB_file());

		req.setAttribute("branch", branch);

	}

	public void updatebranch(BranchDTO bDTO, HttpServletRequest req) {
		// 파일 업로드가 되었을 때
		System.out.println(bDTO.getFile());
		System.out.println("111");
		if (bDTO.getFile() != null) {
			String fileRealName = bDTO.getFile().getOriginalFilename();
			long size = bDTO.getFile().getSize();

			System.out.println("파일명 : " + fileRealName);
			System.out.println("용량크기(byte) : " + size);

			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
			String uploadFolder = servletContext.getRealPath("resources/web/main/store");
			
			UUID uuid = UUID.randomUUID();
			System.out.println(uuid.toString());
			String[] uuids = uuid.toString().split("-");

			String uniqueName = uuids[0];
			System.out.println("생성된 고유문자열" + uniqueName);
			System.out.println("확장자명" + fileExtension);

			File saveFile = new File(uploadFolder + "\\" + uniqueName + fileExtension); // 적용 후

			try {
				//기존 사진 삭제
			    new File(uploadFolder + "/" + bDTO.getB_file()).delete();
				bDTO.getFile().transferTo(saveFile);
				bDTO.setB_file(uniqueName + fileExtension);
			}catch (IOException e) {
				e.printStackTrace();
			}
		} else { 
			// 파일 업로드를 하지 않았을 때
			// 기존 DB에 있는 파일명을 유지
			BranchDTO existingBranch = ss.getMapper(AdminStoreMapper.class).getbranch(bDTO);
			if (existingBranch != null) {
				bDTO.setB_file(existingBranch.getB_file());
			}
		}
		
		
		if (bDTO.getFile2() != null) {
			String fileRealName = bDTO.getFile2().getOriginalFilename();
			long size = bDTO.getFile2().getSize();

			System.out.println("파일명 : " + fileRealName);
			System.out.println("용량크기(byte) : " + size);

			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
			String uploadFolder = servletContext.getRealPath("resources/web/main/store");
			
			UUID uuid = UUID.randomUUID();
			System.out.println(uuid.toString());
			String[] uuids = uuid.toString().split("-");

			String uniqueName = uuids[0];
			System.out.println("생성된 고유문자열" + uniqueName);
			System.out.println("확장자명" + fileExtension);

			File saveFile = new File(uploadFolder + "\\" + uniqueName + fileExtension); // 적용 후

			try {
				//기존 사진 삭제
			    new File(uploadFolder + "/" + bDTO.getB_mainimg()).delete();
				bDTO.getFile2().transferTo(saveFile);
				bDTO.setB_mainimg(uniqueName + fileExtension);
			}catch (IOException e) {
				e.printStackTrace();
			}
		} else { 
			// 파일 업로드를 하지 않았을 때
			// 기존 DB에 있는 파일명을 유지
			BranchDTO existingBranch = ss.getMapper(AdminStoreMapper.class).getbranch(bDTO);
			if (existingBranch != null) {
				bDTO.setB_mainimg(existingBranch.getB_mainimg());
			}
		}
		

		if (ss.getMapper(AdminStoreMapper.class).updatebranch(bDTO) == 1) {
			allBranchCount++;
			System.out.println("등록성공");
			req.setAttribute("r", "등록성공");
		} else {
			req.setAttribute("r", "등록 실패");
		}
	}

	public void deletebranch(BranchDTO bDTO, HttpServletRequest req) {
		if (ss.getMapper(AdminStoreMapper.class).deletebranch(bDTO) == 1) {
			System.out.println("삭제완료");
			allBranchCount--;
		}
	}

	public void branchPasing(BranchDTO bDTO, HttpServletRequest req) {
		req.getSession().setAttribute("branchDTO", bDTO);
	}
	
	
}
