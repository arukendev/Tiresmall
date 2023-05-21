package com.tireshoppingmall.home.admin.auth;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class AuthDAO {
	
	@Autowired
	private SqlSession ss;
	
	@Autowired						// 주입 할려면 SC에서 추가해줘야함
	private AuthOption no; 		// 한 페이지에 몇개 보여줄지 
	
	private int allAuthCount;
	
	public int getAllAuthCount() {
		return allAuthCount;
	}

	public void setAllAuthCount(int allAuthCount) {
		this.allAuthCount = allAuthCount;
	}

	public void calcAllAuthCount() {
        AuthDTO startEnd = new AuthDTO();
        startEnd.setU_id("");
        startEnd.setI_name("");
        allAuthCount = ss.getMapper(AdminAuthMapper.class).getAuthCount(startEnd);
    }
	
	public void getAllAuth(int pageNo,HttpServletRequest req) {
		int count = no.getAuthCountPerPage();
		int start = (pageNo - 1) * count + 1;
		int end = start + (count - 1);
		
		AuthDTO paging = (AuthDTO)req.getSession().getAttribute("authDTO");
		int authCount = 0;
		
		if (paging == null) {
			paging = new AuthDTO();
			paging.setU_id("");
			paging.setI_name("");
			paging.setMc_number(null);
			paging.setI_grade(0);
			paging.setStart(new BigDecimal(start));
			paging.setEnd(new BigDecimal(end));
			authCount = allAuthCount;
		}else {
			paging.setStart(new BigDecimal(start));
			paging.setEnd(new BigDecimal(end));
			authCount = ss.getMapper(AdminAuthMapper.class).getAuthCount(paging);
		}
	
		List<AuthDTO> manyAuth = ss.getMapper(AdminAuthMapper.class).getAuth(paging);
	
		int pageCount = (int) Math.ceil(authCount / (double) count);
	
		req.setAttribute("count", count);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("manyAuth", manyAuth);
		req.setAttribute("curPage", pageNo);
	}

	public void authDelete(HttpServletRequest req, AuthDTO aDTO) {
		if(ss.getMapper(AdminAuthMapper.class).authDelete(aDTO)==1) {
			req.setAttribute("r", "삭제 성공");
			allAuthCount--;
		}
		
	}

	public void updateAuth(HttpServletRequest req, AuthDTO aDTO) {
		if(ss.getMapper(AdminAuthMapper.class).authUpdate(aDTO)==1) {
			req.setAttribute("r", "수정 성공");
		}else {
			req.setAttribute("r", "수정 실패");
		}
	}

	public void authPasing(AuthDTO aDTO, HttpServletRequest req) {
		req.getSession().setAttribute("authDTO", aDTO);
	}

}
