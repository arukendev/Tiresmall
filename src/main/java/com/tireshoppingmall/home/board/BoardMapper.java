package com.tireshoppingmall.home.board;

import java.util.List;

import com.tireshoppingmall.home.auth.AuthUserDTO;

public interface BoardMapper {
	int getFaqCount(BoardFaqSelector forIroiro);
	
	List<BoardFaqDTO> readFaq(BoardFaqSelector forIroiro);
	
	
	
	int getQnaCount(AuthUserDTO forU_id);

	List<BoardQnaDTO> readQna(AuthUserDTO au);

	BoardQnaDTO readdetailQna(BoardQnaDTO bq);
	BoardQnaReplyDTO readQnaReply(BoardQnaDTO bq);

	int createQna(BoardQnaDTO bq);

	int updateQna(BoardQnaDTO bq);
	
	int deleteQna(BoardQnaDTO bq);
	
	int getNoticeCount(BoardNoticeDTO bn);
	
	List<BoardNoticeDTO> readNotice(BoardNoticeDTO bn);
	
	BoardNoticeDTO readdetailNotice(BoardNoticeDTO bn);
	
	List<BoardEventDTO> readEventModal(BoardEventDTO be);

	int getEventCount(BoardEventDTO be);
	
	List<BoardEventDTO> readEvent(BoardEventDTO be);
	
	BoardEventDTO readdetailEvent(BoardEventDTO be);
	/*
	List<String> readDetailimgs(BoardEventDTO beDTO);
	 */
}