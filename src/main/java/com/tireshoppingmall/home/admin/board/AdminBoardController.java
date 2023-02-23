package com.tireshoppingmall.home.admin.board;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tireshoppingmall.home.admin.board.BoardDAO;
import com.tireshoppingmall.home.admin.board.NoticeDTO;
import com.tireshoppingmall.home.admin.board.SearchDTO;

@Controller
public class AdminBoardController {

	@Autowired
	private BoardDAO bDAO;
	
	@Autowired
	private FaqDAO faqDAO;
    
	/* notice DAO */
	
	@RequestMapping(value = "/admin.notice.go", method = RequestMethod.GET)
	public String notice(HttpServletRequest req) {
		
		bDAO.getAllNotice(req);
		req.setAttribute("subMenuPage", "board/board_subMenu.jsp");
		req.setAttribute("contentPage", "board/notice_board.jsp");
		return "admin/master";
	}

	@RequestMapping(value = "/search.do", method = RequestMethod.GET)
	public String search(HttpServletRequest req, SearchDTO sDTO) {
		
		bDAO.search(req, sDTO);
		
		req.setAttribute("subMenuPage", "board/board_subMenu.jsp");
		req.setAttribute("contentPage", "board/notice_board.jsp");
		return "admin/master";
	}

	@RequestMapping(value = "/reg.notice.do", method = RequestMethod.GET)
	public String regNotice(HttpServletRequest req, NoticeDTO nDTO) {
		
		bDAO.regNotice(req, nDTO);
		/*bDAO.getAllNotice(req);*/
		
		/*req.setAttribute("subMenuPage", "board/board_subMenu.jsp");
		req.setAttribute("contentPage", "board/notice_board.jsp");*/
		return "redirect:admin.notice.go";
	}

	@RequestMapping(value = "/update.notice.do", method = RequestMethod.GET)
	public String updateNotice(HttpServletRequest req, NoticeDTO nDTO) {
		
		bDAO.updateNotice(req, nDTO);
		bDAO.getAllNotice(req);
		
		req.setAttribute("subMenuPage", "board/board_subMenu.jsp");
		req.setAttribute("contentPage", "board/notice_board.jsp");
		return "admin/master";
	}

	@RequestMapping(value = "/delete.notice.do", method = RequestMethod.GET)
	public String deleteNotice(HttpServletRequest req, NoticeDTO nDTO) {
		
		bDAO.deleteNotice(req, nDTO);
		bDAO.getAllNotice(req);
		
		req.setAttribute("subMenuPage", "board/board_subMenu.jsp");
		req.setAttribute("contentPage", "board/notice_board.jsp");
		return "admin/master";
	}
	
	/* FAQ DAO */
	
	@RequestMapping(value = "/admin.faq.go", method = RequestMethod.GET)
	public String faq(HttpServletRequest req) {
		
		faqDAO.getAllFaq(req);
		req.setAttribute("subMenuPage", "board/board_subMenu.jsp");
		req.setAttribute("contentPage", "board/faq_board.jsp");
		return "admin/master";
	}
	
	@RequestMapping(value = "/search.faq.do", method = RequestMethod.GET)
	public String searchFaq(HttpServletRequest req, SearchDTO sDTO) {
		
		faqDAO.searchFaq(req, sDTO);
		
		req.setAttribute("subMenuPage", "board/board_subMenu.jsp");
		req.setAttribute("contentPage", "board/faq_board.jsp");
		return "admin/master";
	}

	@RequestMapping(value = "/reg.faq.do", method = RequestMethod.GET)
	public String regFaq(HttpServletRequest req, FaqDTO faqDTO) {
		
		faqDAO.regFaq(req, faqDTO);
		
		return "redirect:admin.faq.go";
	}

	@RequestMapping(value = "/update.faq.do", method = RequestMethod.GET)
	public String updateFaq(HttpServletRequest req, FaqDTO faqDTO) {
		
		faqDAO.updateFaq(req, faqDTO);
		faqDAO.getAllFaq(req);
		
		req.setAttribute("subMenuPage", "board/board_subMenu.jsp");
		req.setAttribute("contentPage", "board/faq_board.jsp");
		return "admin/master";
	}
	
	@RequestMapping(value = "/delete.faq.do", method = RequestMethod.GET)
	public String deleteFaq(HttpServletRequest req, FaqDTO faqDTO) {
		
		faqDAO.deleteFaq(req, faqDTO);
		faqDAO.getAllFaq(req);
		
		req.setAttribute("subMenuPage", "board/board_subMenu.jsp");
		req.setAttribute("contentPage", "board/faq_board.jsp");
		return "admin/master";
	}
	
}
