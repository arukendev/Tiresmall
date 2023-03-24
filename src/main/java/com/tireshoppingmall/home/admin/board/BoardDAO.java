package com.tireshoppingmall.home.admin.board;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardDAO {

	@Autowired
	private SqlSession ss;
	
	@Autowired						// 주입 할려면 SC에서 추가해줘야함
	private NoticeOption no; 		// 한 페이지에 몇개 보여줄지 
	
	private int allNoticeCount;
	
	public int getAllNoticeCount() {
		return allNoticeCount;
	}

	public void setAllNoticeCount(int allNoticeCount) {
		this.allNoticeCount = allNoticeCount;
	}
	public void calcAllNoticeCount() {
		SearchDTO sSel = new SearchDTO("","", null, null,"","");
		allNoticeCount = ss.getMapper(AdminBoardMapper.class).getNoticeCount(sSel);
		System.out.println(allNoticeCount);
	}
	

	public void getNotice(int pageNo, HttpServletRequest req) {
		int count = no.getNoticeCountPerPage();
		int start = (pageNo - 1) * count + 1;
		int end = start + (count - 1);
		
		SearchDTO search = (SearchDTO) req.getSession().getAttribute("searchDTO");
		int noticeCount = 0;
		if (search == null) {
			search = new SearchDTO();
			search.setTitleInput("");
			search.setStart(new BigDecimal(start));
			search.setEnd(new BigDecimal(end));
			noticeCount = allNoticeCount;
			System.out.println("1-------" + allNoticeCount);
		}else {
			search.setStart(new BigDecimal(start));
			search.setEnd(new BigDecimal(end));
			noticeCount = ss.getMapper(AdminBoardMapper.class).getNoticeCount(search);
		}
		List<NoticeDTO> notices = ss.getMapper(AdminBoardMapper.class).getNotice(search);
		int pageCount = (int) Math.ceil(noticeCount / (double) count);
	
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("notices", notices);
		req.setAttribute("curPage", pageNo);
		req.setAttribute("searchVal", search.getTitleInput());
	}
	

	/*	public void getAllNotice(HttpServletRequest req) {
		
		List<NoticeDTO> notice = ss.getMapper(AdminBoardMapper.class).getAllNotice();
		req.setAttribute("notice", notice);
		
	}*/

	/*public void search(HttpServletRequest req, SearchDTO sDTO) {
			String[] option = {"","안내","매장","프로모션"};
			sDTO.setSelectOption(option[Integer.parseInt(req.getParameter("selectOption"))]);
			List<NoticeDTO> notice = ss.getMapper(AdminBoardMapper.class).searchAllNotice(sDTO);
			req.setAttribute("notice", notice);
	}*/

	public void regNotice(HttpServletRequest req, NoticeDTO nDTO) {
		String n_txt = nDTO.getN_txt();
		nDTO.setN_txt(n_txt.replace("\r\n", "<br>"));
		
		if(ss.getMapper(AdminBoardMapper.class).regNotice(nDTO) == 1) {
			req.setAttribute("regR", "등록 성공");
			allNoticeCount++;
		}else {
			req.setAttribute("regR", "등록 실패");
		}
		
	}

	public void updateNotice(HttpServletRequest req, NoticeDTO nDTO) {
		String n_txt = nDTO.getN_txt();
		nDTO.setN_txt(n_txt.replace("\r\n", "<br>"));
		
		if(ss.getMapper(AdminBoardMapper.class).updateNotice(nDTO) >= 1) {
			req.setAttribute("updateR", "업데이트 성공");
		}else {
			req.setAttribute("updateR", "업데이트 실패");
		}
		
	}

	public void deleteNotice(HttpServletRequest req, NoticeDTO nDTO) {
		if(ss.getMapper(AdminBoardMapper.class).deleteNotice(nDTO)) {
			System.out.println("삭제 성공");
			allNoticeCount--;
		} else {
			System.err.println("삭제 실패");
		}
		
	}
	
	public void searchBoard(SearchDTO sDTO, HttpServletRequest req) {

		req.getSession().setAttribute("searchDTO", sDTO);
		
	}
	
	
}
