package com.tireshoppingmall.home;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tireshoppingmall.home.admin.tire.TireDAO;
import com.tireshoppingmall.home.board.BoardEventDAO;
import com.tireshoppingmall.home.board.BoardEventDTO;
import com.tireshoppingmall.home.board.BoardNoticeDAO;
import com.tireshoppingmall.home.board.BoardNoticeDTO;
import com.tireshoppingmall.home.store.StoreDAO;

@Controller
public class HomeController {
	
	@Autowired
	private HomeDAO hDAO;
	
	@Autowired
	private BoardNoticeDAO bnDAO;
	
	@Autowired
	private BoardEventDAO beDAO;
	
	@Autowired
	private StoreDAO sDAO;
	
	@Autowired 
	private TireDAO tDAO;

	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(BoardNoticeDTO bn, BoardEventDTO be, HttpServletRequest req) {
		hDAO.checkAdmin(req);
		bnDAO.readNotice(bn, 1, req);
		beDAO.readEventModal(be, req);
		
		tDAO.getTireBrandMenu(req);
		sDAO.getStroeMenu(req);
		
		req.setAttribute("eventModal", "../board/board_event_modal.jsp");
		req.setAttribute("content", "main/home/home.jsp");
		return "index";
	}
	
	
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String goJoin() {
		
		return "main/auth/termsOfUse";
		
	}
	
	@RequestMapping(value = "/board.home", method = RequestMethod.GET)
	public String boardHome(HttpServletRequest req) {
		req.setAttribute("content", "main/board/board.jsp");
		req.setAttribute("board_contents", "board_home.jsp");
		req.setAttribute("board_whereAmIOne", "");
		req.setAttribute("board_whereAmITwo", "고객센터");
		return "index";
	}
	
	@RequestMapping(value = "/search.size", method = RequestMethod.GET)
	public String goSearchSize(HttpServletRequest req) {
		req.setAttribute("content", "main/search/search_size.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/search.car", method = RequestMethod.GET)
	public String goSearchCar(HttpServletRequest req) {
		req.setAttribute("content", "main/search/search_car.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/search.product", method = RequestMethod.GET)
	public String goSearchProduct(HttpServletRequest req) {
		req.setAttribute("content", "main/search/search_product.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/store", method = RequestMethod.GET)
	public String goStore(HttpServletRequest req, @RequestParam int id) {
		sDAO.getAStore(req, id);
		req.setAttribute("content", "main/store/store.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/non-member", method = RequestMethod.GET)
	public String goNonMember(HttpServletRequest req) {
		req.setAttribute("content", "main/auth/non_member.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/termsAndConditionsOfUse", method = RequestMethod.GET)
	public String goTerms(HttpServletRequest req) {
		req.setAttribute("content", "main/home/terms.jsp");
		return "index";
	}
	@RequestMapping(value = "/PrivacyPolicy", method = RequestMethod.GET)
	public String goPrivacyPolicy(HttpServletRequest req) {
		req.setAttribute("content", "main/home/PrivacyPolicy.jsp");
		return "index";
	}
	
	
	
	
}
