package com.tireshoppingmall.home.board;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tireshoppingmall.home.auth.AuthUserDTO;

@Service
public class BoardFaqDAO {
	@Autowired
	private SqlSession ss;
	
	@Autowired
	private BoardFaqCountOption bfco;
	
	public void readFaq(int pageNumber, HttpServletRequest req) {
		BoardFaqSelector forIroiro = (BoardFaqSelector) req.getSession().getAttribute("FaqIroiro");
		int faqCount = ss.getMapper(BoardMapper.class).getFaqCount(forIroiro);	// 게시물수
		int countPerPage = bfco.getFaqCountPerPage();							// 페이지당 게시물수
		int pageCount = (int) Math.ceil(faqCount / (double) countPerPage);		// 페이지수
		
		int begin = (pageNumber - 1) * countPerPage + 1;	// 블록당 첫페이지의숫자?????
		/*
		int end = pageNumber * countPerPage;				// 블록당 마지막페이지의숫자?????
		*/
		int last = begin + (countPerPage - 1);				// 마지막페이지의숫자?????
		if (forIroiro == null) {
			forIroiro = new BoardFaqSelector();
			forIroiro.setF_sortation("");
			forIroiro.setFaqSearchSelection("");
			forIroiro.setFaqSearch("");
			forIroiro.setBegin(new BigDecimal(begin));
			forIroiro.setLast(new BigDecimal(last));
		} else {
			forIroiro.setBegin(new BigDecimal(begin));
			forIroiro.setLast(new BigDecimal(last));
		}
		
		List<BoardFaqDTO> faqs = ss.getMapper(BoardMapper.class).readFaq(forIroiro);
		
		req.setAttribute("pageNumber", pageNumber);

        req.setAttribute("faqCount", faqCount);
        req.setAttribute("countPerPage", countPerPage);
        req.setAttribute("pageCount", pageCount);
        
        req.setAttribute("begin", begin);
        /*
        req.setAttribute("end", end);
        */
        req.setAttribute("last", last);
        
        req.setAttribute("faqs", faqs);
        // 아래의이거괜찮은거냐
        req.setAttribute("faqSearchSelectionAfterSearch", forIroiro.getFaqSearchSelection());
        req.setAttribute("faqSearchAfterSearch", forIroiro.getFaqSearch());
	}
}
