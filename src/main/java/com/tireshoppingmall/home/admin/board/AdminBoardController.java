package com.tireshoppingmall.home.admin.board;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tireshoppingmall.home.admin.board.BoardDAO;
import com.tireshoppingmall.home.admin.board.NoticeDTO;
import com.tireshoppingmall.home.admin.board.SearchDTO;

@Controller
public class AdminBoardController {

	private boolean noticeFirstReq;
	private boolean faqFirstReq;
	private boolean qnaFirstReq;

	@Autowired
	private BoardDAO bDAO;

	@Autowired
	private FaqDAO faqDAO;

	@Autowired
	private QnaDAO qnaDAO;

	public AdminBoardController() {
		noticeFirstReq = true;
		faqFirstReq = true;
		qnaFirstReq = true;
	}

	/* notice DAO */

	@RequestMapping(value = "/admin.notice.go", method = RequestMethod.GET)
	public String notice(HttpServletRequest req) {

		if (noticeFirstReq) {
			bDAO.calcAllNoticeCount();
			noticeFirstReq = false;
		}
		SearchDTO.clearSearch(req);
		bDAO.getNotice(1, req);
		/* bDAO.getAllNotice(req); */

		req.setAttribute("subMenuPage", "board/board_subMenu.jsp");
		req.setAttribute("contentPage", "board/notice_board.jsp");
		return "admin/master";
	}

	@RequestMapping(value = "/search.do", method = RequestMethod.GET)
	public String search(HttpServletRequest req, SearchDTO sDTO) {
		
		bDAO.searchBoard(sDTO, req);
		bDAO.getNotice(1, req);
		req.setAttribute("subMenuPage", "board/board_subMenu.jsp");
		req.setAttribute("contentPage", "board/notice_board.jsp");
		return "admin/master";
	}

	@RequestMapping(value = "/reg.notice.do", method = RequestMethod.GET)
	public String regNotice(HttpServletRequest req, NoticeDTO nDTO) {

		bDAO.regNotice(req, nDTO);
		/* bDAO.getAllNotice(req); */

		/*
		 * req.setAttribute("subMenuPage", "board/board_subMenu.jsp");
		 * req.setAttribute("contentPage", "board/notice_board.jsp");
		 */
		return "redirect:admin.notice.go";
	}

	@RequestMapping(value = "/update.notice.do", method = RequestMethod.GET)
	public String updateNotice(HttpServletRequest req, NoticeDTO nDTO) {

		bDAO.updateNotice(req, nDTO);
//		bDAO.getAllNotice(req);
 		bDAO.getNotice(1, req);

		req.setAttribute("subMenuPage", "board/board_subMenu.jsp");
		req.setAttribute("contentPage", "board/notice_board.jsp");
		return "admin/master";
	}

	@RequestMapping(value = "/delete.notice.do", method = RequestMethod.GET)
	public String deleteNotice(HttpServletRequest req, NoticeDTO nDTO) {

		bDAO.deleteNotice(req, nDTO);
//		bDAO.getAllNotice(req);
		bDAO.getNotice(1, req);

		req.setAttribute("subMenuPage", "board/board_subMenu.jsp");
		req.setAttribute("contentPage", "board/notice_board.jsp");
		return "admin/master";
	}

	@RequestMapping(value = "/notice.page.change", method = RequestMethod.GET)
	public String Paging(HttpServletRequest req, @RequestParam int p) {
		System.out.println(req.getParameter("p"));
		bDAO.getNotice(p, req);

		req.setAttribute("subMenuPage", "board/board_subMenu.jsp");
		req.setAttribute("contentPage", "board/notice_board.jsp");
		return "admin/master";
	}

	/* FAQ DAO */

	
	@RequestMapping(value = "/admin.faq.go", method = RequestMethod.GET)
	public String faq(HttpServletRequest req) {

		if (faqFirstReq) {
			faqDAO.calcAllFaqCount();
			faqFirstReq = false;
		}
		SearchDTO.clearSearch(req);
		faqDAO.getFaq(1, req);
		/* bDAO.getAllNotice(req); */

		req.setAttribute("subMenuPage", "board/board_subMenu.jsp");
		req.setAttribute("contentPage", "board/faq_board.jsp");
		return "admin/master";
	}

	@RequestMapping(value = "/search.faq.do", method = RequestMethod.GET)
	public String searchFaq(HttpServletRequest req, SearchDTO sDTO) {

		faqDAO.searchFaq(sDTO, req);
		faqDAO.getFaq(1, req);
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
		/*faqDAO.getAllFaq(req);*/
		faqDAO.getFaq(1, req);
		
		req.setAttribute("subMenuPage", "board/board_subMenu.jsp");
		req.setAttribute("contentPage", "board/faq_board.jsp");
		return "admin/master";
	}

	@RequestMapping(value = "/delete.faq.do", method = RequestMethod.GET)
	public String deleteFaq(HttpServletRequest req, FaqDTO faqDTO) {

		faqDAO.deleteFaq(req, faqDTO);
		/*faqDAO.getAllFaq(req);*/
		faqDAO.getFaq(1, req);
		
		req.setAttribute("subMenuPage", "board/board_subMenu.jsp");
		req.setAttribute("contentPage", "board/faq_board.jsp");
		return "admin/master";
	}

	@RequestMapping(value = "/faq.page.change", method = RequestMethod.GET)
	public String PagingFaq(HttpServletRequest req, @RequestParam int p) {
		System.out.println(req.getParameter("p"));
		faqDAO.getFaq(p, req);

		req.setAttribute("subMenuPage", "board/board_subMenu.jsp");
		req.setAttribute("contentPage", "board/faq_board.jsp");
		return "admin/master";
	}
	
	/* QNA DAO */

	@RequestMapping(value = "/admin.qna.go", method = RequestMethod.GET)
	public String qna(HttpServletRequest req) {

		if (qnaFirstReq) {
			qnaDAO.calcAllQnaCount();
			qnaFirstReq = false;
		}
		SearchDTO.clearSearch(req);
		qnaDAO.getQna(1 ,req);
		
		req.setAttribute("subMenuPage", "board/board_subMenu.jsp");
		req.setAttribute("contentPage", "board/qna_board.jsp");
		return "admin/master";
	}

	@RequestMapping(value = "/search.qna.do", method = RequestMethod.GET)
	public String searchQnA(SearchDTO SearchDTO, HttpServletRequest req) {
		qnaDAO.searchQnA(SearchDTO, req);
		qnaDAO.getQna(1 ,req);
		
		req.setAttribute("subMenuPage", "board/board_subMenu.jsp");
		req.setAttribute("contentPage", "board/qna_board.jsp");
		return "admin/master";
	}

	@RequestMapping(value = "/qna.reply.reg.do", method = RequestMethod.GET)
	public String insertQnAReply(QnaReplyDTO qnaReplyDTO, HttpServletRequest req) {
		System.out.println(qnaReplyDTO.toString());
		qnaDAO.insertQnAReply(qnaReplyDTO, req);
		req.setAttribute("subMenuPage", "board/board_subMenu.jsp");
		req.setAttribute("contentPage", "board/qna_board.jsp");
		return "redirect:admin.qna.go";
	}

	@ResponseBody
	@RequestMapping(value = "/get.reply.do", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public QnaReplyDTO getReply(QnaReplyDTO qnaReplyDTO, HttpServletRequest req) {

		return qnaDAO.getReply(qnaReplyDTO);
	}

	@RequestMapping(value = "/qna.page.change", method = RequestMethod.GET)
	public String pagingQna(HttpServletRequest req, @RequestParam int p) {
		qnaDAO.getQna(p, req);
		
		req.setAttribute("subMenuPage", "board/board_subMenu.jsp");
		req.setAttribute("contentPage", "board/qna_board.jsp");
		return "admin/master";
	}
}
