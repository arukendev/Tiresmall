package com.tireshoppingmall.home.admin.board;

import org.springframework.stereotype.Service;

@Service
public class NoticeOption {

	private int noticeCountPerPage;

	public NoticeOption() {
		// TODO Auto-generated constructor stub
	}
	
	public NoticeOption(int noticeCountPerPage) {
		super();
		this.noticeCountPerPage = noticeCountPerPage;
	}

	public int getNoticeCountPerPage() {
		return noticeCountPerPage;
	}

	public void setNoticeCountPerPage(int noticeCountPerPage) {
		this.noticeCountPerPage = noticeCountPerPage;
	}
	
	
	
}
