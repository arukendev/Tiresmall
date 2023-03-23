package com.tireshoppingmall.home.board;

import java.util.List;

import com.tireshoppingmall.home.auth.AuthUserDTO;

public interface BoardMapper {
	int getFaqCount(BoardFaqSelector forIroiro);
	
	List<BoardFaqDTO> readFaq(BoardFaqSelector forIroiro);
	
	
	
	int getQnaCount(AuthUserDTO forU_id);

	List<BoardQnaDTO> readQna(AuthUserDTO auDTO);

	BoardQnaDTO readdetailQna(BoardQnaDTO a);
	BoardQnaReplyDTO readQnaReply(BoardQnaDTO a);

	int createQna(BoardQnaDTO a);

	int updateQna(BoardQnaDTO a);
	
	int deleteQna(BoardQnaDTO a);
	
	

	List<BoardEventDTO> readEvent(BoardEventDTO e);
}