package com.tireshoppingmall.home.admin.board;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class AdminBoardController {

	private boolean noticeFirstReq;
	private boolean faqFirstReq;
	private boolean qnaFirstReq;

	private boolean eventFirstReq;
	
	@Autowired
	private BoardDAO bDAO;

	@Autowired
	private FaqDAO faqDAO;

	@Autowired
	private QnaDAO qnaDAO;
	
	@Autowired
	private EventDAO eventDAO;

	public AdminBoardController() {
		noticeFirstReq = true;
		faqFirstReq = true;
		qnaFirstReq = true;
		eventFirstReq = true;
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
	
	/*event DAO*/
	
	@RequestMapping(value = "/admin.event.go", method = RequestMethod.GET)
	public String event(HttpServletRequest req) {
		
		if (eventFirstReq) {
			eventDAO.calcAllEventCount();
			System.out.println("총량: " + eventDAO.getAllEventCount());
			eventFirstReq = false;
		}
		SearchDTO.clearSearch(req);
		eventDAO.getEvent(1, req);
		
		req.setAttribute("subMenuPage", "board/board_subMenu.jsp");
		req.setAttribute("contentPage", "board/event_board.jsp");
		return "admin/master";
		
	}
	
	@RequestMapping(value = "/event.page.change", method = RequestMethod.GET)
	public String pagingEvent(HttpServletRequest req, @RequestParam int p) {
		eventDAO.getEvent(p, req);
		
		req.setAttribute("subMenuPage", "board/board_subMenu.jsp");
		req.setAttribute("contentPage", "board/event_board.jsp");
		return "admin/master";
	}

	@ResponseBody
	@RequestMapping(value = "/event.switch.popup", method = RequestMethod.GET)
	public int eventSwitchPopup(HttpServletRequest req, EventDTO eventDTO) {
		return eventDAO.switchPopup(eventDTO);
	}

	@RequestMapping(value = "/event.detail", method = RequestMethod.GET)
	public String eventDetail(HttpServletRequest req, EventDTO eventDTO) {
		eventDAO.eventDetail(eventDTO, req);
		
		req.setAttribute("subMenuPage", "board/board_subMenu.jsp");
		req.setAttribute("contentPage", "board/event_detail.jsp");
		return "admin/master";
	}

	
	@ResponseBody
	@RequestMapping(value = "/event.detail.update", method = RequestMethod.POST)
	public int eventDetailUpdate(HttpServletRequest req, EventDTO eventDTO) {
		return eventDAO.updateEvent(eventDTO);
	}

	@ResponseBody
	@RequestMapping(value = "/event.detail.updateFile", method = RequestMethod.POST)
	public String eventDetailUpdateFile(MultipartHttpServletRequest mf, EventDTO eventDto) {
		return eventDAO.updateImg(mf, eventDto);
	}

	@ResponseBody
	@RequestMapping(value = "/event.delete", method = RequestMethod.GET)
	public int eventDelete(EventDTO eventDto, HttpServletRequest req) {
		return eventDAO.deleteEvent(eventDto, req);
	}

	
    @InitBinder
    protected void initBinder(WebDataBinder binder){
        DateFormat  dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat,true));
    }
	
	
	@RequestMapping(value = "/event.reg", method = RequestMethod.POST)
	public String eventReg(@RequestParam(value="mainimg") MultipartFile mainimg,@RequestParam(value="detailimg[]") List<MultipartFile> detailimg, EventDTO eventDto) {
		eventDAO.regEvent(mainimg, detailimg, eventDto);
		
		return "redirect:admin.event.go";
	}
	
}
