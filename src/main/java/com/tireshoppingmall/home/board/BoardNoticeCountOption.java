package com.tireshoppingmall.home.board;

public class BoardNoticeCountOption {
	private int noticeCountPerPage;
	public BoardNoticeCountOption() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardNoticeCountOption(int noticeCountPerPage) {
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
