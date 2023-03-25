package com.tireshoppingmall.home.admin.board;

import java.util.List;

import com.tireshoppingmall.home.admin.auth.AuthDTO;
import com.tireshoppingmall.home.admin.board.NoticeDTO;
import com.tireshoppingmall.home.admin.board.SearchDTO;

public interface AdminBoardMapper {

	List<NoticeDTO> getAllNotice();

	List<NoticeDTO> searchAllNotice(SearchDTO sDTO);

	int regNotice(NoticeDTO nDTO);

	int updateNotice(NoticeDTO nDTO);

	boolean deleteNotice(NoticeDTO nDTO);

	List<FaqDTO> getAllFaq();

	List<FaqDTO> searchAllFaq(SearchDTO sDTO);

	int regFaq(FaqDTO faqDTO);

	int updateFaq(FaqDTO faqDTO);

	boolean deleteFaq(FaqDTO faqDTO);

	List<QnaDTO> getAllQna();

	List<QnaDTO> searchQnA(SearchDTO SearchDTO);

	int countQnAReply(QnaReplyDTO qnaReplyDTO);
	int insertQnAReply(QnaReplyDTO qnaReplyDTO);
	void updateQna(QnaReplyDTO qnaReplyDTO);
	int updateQnAReply(QnaReplyDTO qnaReplyDTO);

	QnaReplyDTO getReply(QnaReplyDTO qnaReplyDTO);
	
	int getNoticeCount(SearchDTO search);

	List<NoticeDTO> getNotice(SearchDTO search);

	int getFaqCount(SearchDTO search);

	List<FaqDTO> getFaq(SearchDTO search);

	int getQnaCount(SearchDTO search);

	List<QnaDTO> getQna(SearchDTO search);

	int getEventCount(SearchDTO sSel);

	List<EventDTO> getEvent(SearchDTO search);

	int switchPopup(EventDTO eventDTO);

	EventDTO eventDetail(EventDTO eventDTO);

	int eventUpdate(EventDTO eventDTO);

	int eventDelete(EventDTO eventDto);

	int eventReg(EventDTO eventDto);

	
}
