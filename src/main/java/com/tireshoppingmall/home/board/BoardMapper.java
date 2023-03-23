package com.tireshoppingmall.home.board;

import java.util.List;

import com.tireshoppingmall.home.auth.AuthUserDTO;

public interface BoardMapper {
	int getFaqCount(BoardFaqSelector forIroiro);
	
	List<BoardFaqDTO> readFaq(BoardFaqSelector forIroiro);
	
	
	
	int getQnaCount(AuthUserDTO forU_id);

	List<BoardQnaDTO> readQna(AuthUserDTO auDTO);

	BoardQnaDTO readdetailQna(BoardQnaDTO bqDTO);
	BoardQnaReplyDTO readQnaReply(BoardQnaDTO bqDTO);

	int createQna(BoardQnaDTO bqDTO);

	int updateQna(BoardQnaDTO bqDTO);
	
	int deleteQna(BoardQnaDTO bqDTO);
	
	
	
	int getNoticeCount(BoardNoticeSelector forIroiro);
	
	List<BoardNoticeDTO> readNotice(BoardNoticeSelector forIroiro);
	
	BoardNoticeDTO readdetailNotice(BoardNoticeDTO bnDTO);
	
	
	
	int getEventCount(BoardEventSelector forIroiro);
	
	List<BoardEventDTO> readEvent(BoardEventDTO beDTO);
	
	BoardEventDTO readdetailEvent(BoardEventDTO beDTO);
}