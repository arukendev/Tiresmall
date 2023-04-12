package com.tireshoppingmall.home.board;

public class BoardEventCountOption {
	private int eventCountPerPage;
	public BoardEventCountOption() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardEventCountOption(int eventCountPerPage) {
		super();
		this.eventCountPerPage = eventCountPerPage;
	}
	public int getEventCountPerPage() {
		return eventCountPerPage;
	}
	public void setEventCountPerPage(int eventCountPerPage) {
		this.eventCountPerPage = eventCountPerPage;
	}
}
