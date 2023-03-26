package com.tireshoppingmall.home;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tireshoppingmall.home.auth.AuthUserDTO;

@Service
public class HomeDAO {
	
	@Autowired
	private SqlSession ss;

	public void checkAdmin(HttpServletRequest req) {
		if (req.getSession().getAttribute("loginMember") != null) {
			AuthUserDTO aDTO = (AuthUserDTO) req.getSession().getAttribute("loginMember");
			HomeGradeCheck hgc = ss.getMapper(HomeMapper.class).checkAdmin(aDTO);
			req.getSession().setAttribute("homegradecheck", hgc);
		}
	}
	
}
