package com.tireshoppingmall.home.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardEventDAO {
	@Autowired
	private SqlSession ss;

	public void readEvent(BoardEventDTO e, HttpServletRequest req) {
		List<BoardEventDTO> events = ss.getMapper(BoardMapper.class).readEvent(e);
		req.setAttribute("events", events);
	}
}
