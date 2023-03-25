package com.tireshoppingmall.home.board;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tireshoppingmall.home.auth.AuthUserDTO;

@Service
public class BoardNoticeDAO {
	@Autowired
	private SqlSession ss;
	
	@Autowired
	private BoardNoticeCountOption bnco;
	
	public void readNotice(BoardNoticeDTO bn, int pageNumber, HttpServletRequest req) {
		/*
		BoardNoticeSelector forIroiro = (BoardNoticeSelector) req.getSession().getAttribute("NoticeIroiro");
		int noticeCount = ss.getMapper(BoardMapper.class).getNoticeCount(forIroiro);	// 게시물수
		 */
		
		//
		int noticeCount = ss.getMapper(BoardMapper.class).getNoticeCount(bn);	// 게시물수
		
		int countPerPage = bnco.getNoticeCountPerPage();									// 페이지당 게시물수
		int pageCount = (int) Math.ceil(noticeCount / (double) countPerPage);				// 페이지수
		
		int begin = (pageNumber - 1) * countPerPage + 1;	// 블록당 첫페이지의숫자?????
		/*
		int end = pageNumber * countPerPage;				// 블록당 마지막페이지의숫자?????
		 */
		int last = begin + (countPerPage - 1);				// 마지막페이지의숫자?????
		bn.setBegin(new BigDecimal(begin));
		bn.setLast(new BigDecimal(last));
		
		List<BoardNoticeDTO> notices = ss.getMapper(BoardMapper.class).readNotice(bn);
		
        req.setAttribute("pageNumber", pageNumber);

        req.setAttribute("noticeCount", noticeCount);
        req.setAttribute("countPerPage", countPerPage);
        req.setAttribute("pageCount", pageCount);
        
        req.setAttribute("begin", begin);
        /*
        req.setAttribute("end", end);
        */
        req.setAttribute("last", last);
        
        req.setAttribute("notices", notices);
	}
	
	public void readdetailNotice(BoardNoticeDTO bnDTO, HttpServletRequest req) {
		BoardNoticeDTO notice = (BoardNoticeDTO) ss.getMapper(BoardMapper.class).readdetailNotice(bnDTO);
		
		req.setAttribute("notice", notice);
	}
}
