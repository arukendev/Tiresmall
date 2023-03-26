package com.tireshoppingmall.home.board;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tireshoppingmall.home.auth.AuthUserDTO;

@Service
public class BoardQnaDAO {
	@Autowired
	private SqlSession ss;
	
	@Autowired
	private BoardQnaCountOption bqco;
	
	public void readQna(int pageNumber, HttpServletRequest req) {
		AuthUserDTO forU_idBeginLast = (AuthUserDTO) req.getSession().getAttribute("loginMember");
		int qnaCount = ss.getMapper(BoardMapper.class).getQnaCount(forU_idBeginLast);	// 게시물수
		int countPerPage = bqco.getQnaCountPerPage();									// 페이지당 게시물수
		int pageCount = (int) Math.ceil(qnaCount / (double) countPerPage);				// 페이지수
		
		int begin = (pageNumber - 1) * countPerPage + 1;	// 블록당 첫페이지의숫자?????
		/*
		int end = pageNumber * countPerPage;				// 블록당 마지막페이지의숫자?????
		 */
		int last = begin + (countPerPage - 1);				// 마지막페이지의숫자?????
		forU_idBeginLast.setBegin(new BigDecimal(begin));
		forU_idBeginLast.setLast(new BigDecimal(last));
		
		List<BoardQnaDTO> qnas = ss.getMapper(BoardMapper.class).readQna(forU_idBeginLast);
        for (BoardQnaDTO qna : qnas) {
            qna.setQ_reply(ss.getMapper(BoardMapper.class).readQnaReply(qna));
        }
        
        req.setAttribute("pageNumber", pageNumber);

        req.setAttribute("qnaCount", qnaCount);
        req.setAttribute("countPerPage", countPerPage);
        req.setAttribute("pageCount", pageCount);
        
        req.setAttribute("begin", begin);
        /*
        req.setAttribute("end", end);
        */
        req.setAttribute("last", last);
        
        req.setAttribute("qnas", qnas);
	}
	
	public void readdetailQna(BoardQnaDTO bqDTO, HttpServletRequest req) {
		BoardQnaDTO qna = (BoardQnaDTO) ss.getMapper(BoardMapper.class).readdetailQna(bqDTO);
		
		/*
		String q_txt = qna.getQ_txt();
		qna.setQ_txt(q_txt.replace("<br>", "\r\n"));
		*/
		
		qna.setQ_reply(ss.getMapper(BoardMapper.class).readQnaReply(bqDTO));
		
		req.setAttribute("qna", qna);
	}
	
	public void createQna(BoardQnaDTO bqDTO, HttpServletRequest req) {
		String q_txt = bqDTO.getQ_txt();
		bqDTO.setQ_txt(q_txt.replace("\r\n", "<br>"));
		
		if (ss.getMapper(BoardMapper.class).createQna(bqDTO) == 1) {
			req.setAttribute("result", "create성공");
		} else {
			req.setAttribute("result", "create실패");
		}
	}
	
	public void readdetailQnaForUpdate(BoardQnaDTO bqDTO, HttpServletRequest req) {
		BoardQnaDTO qna = (BoardQnaDTO) ss.getMapper(BoardMapper.class).readdetailQna(bqDTO);
		
		String q_txt = qna.getQ_txt();
		qna.setQ_txt(q_txt.replace("<br>", "\r\n"));
		
		qna.setQ_reply(ss.getMapper(BoardMapper.class).readQnaReply(bqDTO));
		
		req.setAttribute("qna", qna);
	}
	public void updateQna(BoardQnaDTO bqDTO, HttpServletRequest req) {
		String q_txt = bqDTO.getQ_txt();
		bqDTO.setQ_txt(q_txt.replace("\r\n", "<br>"));
		
		if (ss.getMapper(BoardMapper.class).updateQna(bqDTO) == 1) {
			req.setAttribute("result", "update성공");
		} else {
			req.setAttribute("result", "update실패");
		}
	}
	
	public void deleteQna(BoardQnaDTO bqDTO, HttpServletRequest req) {
		if (ss.getMapper(BoardMapper.class).deleteQna(bqDTO) == 1) {
			req.setAttribute("result", "delete성공");
		} else {
			req.setAttribute("result", "delete실패");
		}
	}
}