package com.tireshoppingmall.home.board;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tireshoppingmall.home.auth.AuthUserDTO;
import com.tireshoppingmall.home.auth.MemberDAO;

@Controller
public class BoardController {
	@Autowired
	private BoardFaqDAO bfDAO;
	
	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private BoardQnaDAO bqDAO;
	
	@Autowired
	private BoardNoticeDAO bnDAO;
	
	@Autowired
	private BoardEventDAO beDAO;
	
	@RequestMapping(value = "/board.faq.read", method = RequestMethod.GET)
	public String boardFaqRead(HttpServletRequest req, Model model) {
		req.getSession().setAttribute("FaqIroiro", null);
		bfDAO.readFaq(1, req);
		
		model.addAttribute("content", "main/board/board.jsp");
		model.addAttribute("board_whereAmIOne", "<i class=\"fa-solid fa-chevron-right\"></i> FAQ");
		model.addAttribute("board_whereAmITwo", "FAQ");
		model.addAttribute("board_contents", "board_faq.jsp");
		return "index";
	}
	@RequestMapping(value = "/board.faq.read.search", method = RequestMethod.GET)
	public String boardFaqReadSearch(BoardFaqSelector bfSelector, HttpServletRequest req, Model model) {
		req.getSession().setAttribute("FaqIroiro", bfSelector);
		bfDAO.readFaq(1, req);
		
		model.addAttribute("content", "main/board/board.jsp");
		model.addAttribute("board_whereAmIOne", "<i class=\"fa-solid fa-chevron-right\"></i> FAQ");
		model.addAttribute("board_whereAmITwo", "FAQ");
		model.addAttribute("board_contents", "board_faq.jsp");
		return "index";
	}
	@RequestMapping(value = "/board.faq.read.paging", method = RequestMethod.GET)
	public String boardFaqReadPaging(@RequestParam int pn, HttpServletRequest req, Model model) {
		bfDAO.readFaq(pn, req);
		
		model.addAttribute("content", "main/board/board.jsp");
		model.addAttribute("board_whereAmIOne", "<i class=\"fa-solid fa-chevron-right\"></i> FAQ");
		model.addAttribute("board_whereAmITwo", "FAQ");
		model.addAttribute("board_contents", "board_faq.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/board.qna.check", method = RequestMethod.GET)
	public String boardQnaCheck(HttpServletRequest req, Model model) {
		if (mDAO.loginCheck(req)) {
			AuthUserDTO forU_id = (AuthUserDTO) req.getSession().getAttribute("loginMember");
			
			model.addAttribute("content", "main/board/board.jsp");
			model.addAttribute("board_whereAmIOne", "<i class=\"fa-solid fa-chevron-right\"></i> 1:1문의");
			model.addAttribute("board_whereAmITwo", "1:1문의");
			return "redirect: board.qna.read?u_id=" + forU_id.getU_id();
		} else {
			req.getSession().setAttribute("loginRequiredByQna", "YES");
			return "redirect: login";
		}
	}
	
	@RequestMapping(value = "/board.qna.read", method = RequestMethod.GET)
	public String boardQnaRead(HttpServletRequest req, Model model) {
		bqDAO.readQna(1, req);
		
		model.addAttribute("content", "main/board/board.jsp");
		model.addAttribute("board_whereAmIOne", "<i class=\"fa-solid fa-chevron-right\"></i> 1:1문의");
		model.addAttribute("board_whereAmITwo", "1:1문의");
		model.addAttribute("board_contents", "board_qna_read.jsp");
		return "index";
	}
	@RequestMapping(value = "/board.qna.read.paging", method = RequestMethod.GET)
	public String boardQnaReadPaging(@RequestParam int pn, HttpServletRequest req, Model model) {
		bqDAO.readQna(pn, req);
		
		model.addAttribute("content", "main/board/board.jsp");
		model.addAttribute("board_whereAmIOne", "<i class=\"fa-solid fa-chevron-right\"></i> 1:1문의");
		model.addAttribute("board_whereAmITwo", "1:1문의");
		model.addAttribute("board_contents", "board_qna_read.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/board.qna.readdetail", method = RequestMethod.GET)
	public String boardQnaReaddetail(BoardQnaDTO bq, HttpServletRequest req, Model model) {
		bqDAO.readdetailQna(bq, req);
		
		model.addAttribute("content", "main/board/board.jsp");
		model.addAttribute("board_whereAmIOne", "<i class=\"fa-solid fa-chevron-right\"></i> 1:1문의");
		model.addAttribute("board_whereAmITwo", "1:1문의");
		model.addAttribute("board_contents", "board_qna_readdetail.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/board.qna.create.go", method = RequestMethod.GET)
	public String boardQnaCreateGo(Model model) {
		model.addAttribute("content", "main/board/board.jsp");
		model.addAttribute("board_whereAmIOne", "<i class=\"fa-solid fa-chevron-right\"></i> 1:1문의");
		model.addAttribute("board_whereAmITwo", "1:1문의");
		model.addAttribute("board_contents", "board_qna_create.jsp");
		return "index";
	}
	@RequestMapping(value = "/board.qna.create.do", method = RequestMethod.POST)
	public String boardQnaCreateDo(BoardQnaDTO bq, HttpServletRequest req, Model model) {
		bqDAO.createQna(bq, req);
		
		model.addAttribute("content", "main/board/board.jsp");
		model.addAttribute("board_whereAmIOne", "<i class=\"fa-solid fa-chevron-right\"></i> 1:1문의");
		model.addAttribute("board_whereAmITwo", "1:1문의");
		model.addAttribute("board_contents", "board_qna_complete.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/board.qna.update.go", method = RequestMethod.GET)
	public String boardQnaUpdateGo(BoardQnaDTO bq, HttpServletRequest req, Model model) {
		bqDAO.readdetailQnaForUpdate(bq, req);
		
		model.addAttribute("content", "main/board/board.jsp");
		model.addAttribute("board_whereAmIOne", "<i class=\"fa-solid fa-chevron-right\"></i> 1:1문의");
		model.addAttribute("board_whereAmITwo", "1:1문의");
		model.addAttribute("board_contents", "board_qna_update.jsp");
		return "index";
	}
	@RequestMapping(value = "/board.qna.update.do", method = RequestMethod.POST)
	public String boardQnaUpdateDo(BoardQnaDTO bq, HttpServletRequest req, Model model) {
		bqDAO.updateQna(bq, req);
		
		model.addAttribute("content", "main/board/board.jsp");
		model.addAttribute("board_whereAmIOne", "<i class=\"fa-solid fa-chevron-right\"></i> 1:1문의");
		model.addAttribute("board_whereAmITwo", "1:1문의");
		model.addAttribute("board_contents", "board_qna_complete.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/board.qna.delete", method = RequestMethod.GET)
	public String boardQnaDelete(BoardQnaDTO bq, HttpServletRequest req, Model model) {
		bqDAO.deleteQna(bq, req);
		
		bqDAO.readQna(1, req);
		
		model.addAttribute("content", "main/board/board.jsp");
		model.addAttribute("board_whereAmIOne", "<i class=\"fa-solid fa-chevron-right\"></i> 1:1문의");
		model.addAttribute("board_whereAmITwo", "1:1문의");
		model.addAttribute("board_contents", "board_qna_read.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/board.notice.read", method = RequestMethod.GET)
	public String boardNoticeRead(BoardNoticeDTO bn, HttpServletRequest req, Model model) {
		bnDAO.readNotice(bn, 1, req);
		
		model.addAttribute("content", "main/board/board.jsp");
		model.addAttribute("board_whereAmIOne", "<i class=\"fa-solid fa-chevron-right\"></i> 공지사항");
		model.addAttribute("board_whereAmITwo", "공지사항");
		model.addAttribute("board_contents", "board_notice_read.jsp");
		return "index";
	}
	@RequestMapping(value = "/board.notice.read.paging", method = RequestMethod.GET)
	public String boardNoticeReadPaging(BoardNoticeDTO bn, @RequestParam int pn, HttpServletRequest req, Model model) {
		bnDAO.readNotice(bn, pn, req);
		
		model.addAttribute("content", "main/board/board.jsp");
		model.addAttribute("board_whereAmIOne", "<i class=\"fa-solid fa-chevron-right\"></i> 공지사항");
		model.addAttribute("board_whereAmITwo", "공지사항");
		model.addAttribute("board_contents", "board_notice_read.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/board.notice.readdetail", method = RequestMethod.GET)
	public String boardNoticeReaddetail(BoardNoticeDTO bn, HttpServletRequest req, Model model) {
		bnDAO.readdetailNotice(bn, req);
		
		model.addAttribute("content", "main/board/board.jsp");
		model.addAttribute("board_whereAmIOne", "<i class=\"fa-solid fa-chevron-right\"></i> 공지사항");
		model.addAttribute("board_whereAmITwo", "공지사항");
		model.addAttribute("board_contents", "board_notice_readdetail.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/board.event.read", method = RequestMethod.GET)
	public String boardEventRead(BoardEventDTO be, HttpServletRequest req, Model model) {
		beDAO.readEvent(be, 1, req);
		
		model.addAttribute("content", "main/board/board.jsp");
		model.addAttribute("board_whereAmIOne", "<i class=\"fa-solid fa-chevron-right\"></i> 이벤트");
		model.addAttribute("board_whereAmITwo", "이벤트");
		model.addAttribute("board_contents", "board_event_read.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/board.event.read.paging", method = RequestMethod.GET)
	public String boardNoticeReadPaging(BoardEventDTO be, @RequestParam int pn, HttpServletRequest req, Model model) {
		beDAO.readEvent(be, pn, req);
		
		model.addAttribute("content", "main/board/board.jsp");
		model.addAttribute("board_whereAmIOne", "<i class=\"fa-solid fa-chevron-right\"></i> 이벤트");
		model.addAttribute("board_whereAmITwo", "이벤트");
		model.addAttribute("board_contents", "board_event_read.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/board.event.readdetail", method = RequestMethod.GET)
	public String boardNoticeReaddetail(BoardEventDTO be, HttpServletRequest req, Model model) {
		beDAO.readdetailEvent(be, req);
		
		model.addAttribute("content", "main/board/board.jsp");
		model.addAttribute("board_whereAmIOne", "<i class=\"fa-solid fa-chevron-right\"></i> 이벤트");
		model.addAttribute("board_whereAmITwo", "이벤트");
		model.addAttribute("board_contents", "board_event_readdetail.jsp");
		return "index";
	}
}
