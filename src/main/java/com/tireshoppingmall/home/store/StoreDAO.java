package com.tireshoppingmall.home.store;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.tireshoppingmall.home.admin.store.AdminStoreMapper;
import com.tireshoppingmall.home.admin.store.BranchDTO;

@Service
public class StoreDAO {
	
	@Autowired
	private SqlSession ss;
	
	
	public void getAStore(HttpServletRequest req, int id) {
		BranchDTO b = ss.getMapper(StoreMapper.class).getAStore(id);
		req.setAttribute("store", b);
	}


	public void getStroeMenu(HttpServletRequest req) {
		List<BranchDTO> stores  =ss.getMapper(AdminStoreMapper.class).getAllBranch();
		
		req.getSession().setAttribute("stores", stores);
		req.getSession().setMaxInactiveInterval(60*60);
		
		req.setAttribute("stores",stores);
	}

}
