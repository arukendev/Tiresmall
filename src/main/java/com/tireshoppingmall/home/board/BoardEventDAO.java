package com.tireshoppingmall.home.board;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardEventDAO {
	@Autowired
	private SqlSession ss;
	
	@Autowired
	private BoardEventCountOption beco;

	public void readEventModal(BoardEventDTO be, HttpServletRequest req) {
		List<BoardEventDTO> events = ss.getMapper(BoardMapper.class).readEventModal(be);
		req.setAttribute("events", events);
	}
	
	public void readEvent(BoardEventDTO be, int pageNumber, HttpServletRequest req) {
		/*
		BoardNoticeSelector forIroiro = (BoardNoticeSelector) req.getSession().getAttribute("NoticeIroiro");
		int noticeCount = ss.getMapper(BoardMapper.class).getNoticeCount(forIroiro);	// 게시물수
		 */
		
		//
		int eventCount = ss.getMapper(BoardMapper.class).getEventCount(be);	// 게시물수
		
		int countPerPage = beco.getEventCountPerPage();									// 페이지당 게시물수
		int pageCount = (int) Math.ceil(eventCount / (double) countPerPage);				// 페이지수
		
		int begin = (pageNumber - 1) * countPerPage + 1;	// 블록당 첫페이지의숫자?????
		/*
		int end = pageNumber * countPerPage;				// 블록당 마지막페이지의숫자?????
		 */
		int last = begin + (countPerPage - 1);				// 마지막페이지의숫자?????
		be.setBegin(new BigDecimal(begin));
		be.setLast(new BigDecimal(last));
		
		List<BoardEventDTO> events = ss.getMapper(BoardMapper.class).readEvent(be);
		
        req.setAttribute("pageNumber", pageNumber);

        req.setAttribute("eventCount", eventCount);
        req.setAttribute("countPerPage", countPerPage);
        req.setAttribute("pageCount", pageCount);
        
        req.setAttribute("begin", begin);
        /*
        req.setAttribute("end", end);
        */
        req.setAttribute("last", last);
        
        req.setAttribute("events", events);
	}
	
	public void readdetailEvent(BoardEventDTO beDTO, HttpServletRequest req) {
		BoardEventDTO event = (BoardEventDTO) ss.getMapper(BoardMapper.class).readdetailEvent(beDTO);
		
		req.setAttribute("event", event);
		req.setAttribute("detailimgs", event.getE_detailimg().split("!"));
	}
}
