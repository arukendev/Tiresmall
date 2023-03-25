package com.tireshoppingmall.home.auth;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.tireshoppingmall.home.admin.order.AdminOrderMapper;
import com.tireshoppingmall.home.admin.order.OrderDTO;
import com.tireshoppingmall.home.admin.order.OrderSearchDTO;
import com.tireshoppingmall.home.admin.tire.AdminTireMapper;
import com.tireshoppingmall.home.admin.tire.TireDTO;
import com.tireshoppingmall.home.auth.MemberDTO;
import com.tireshoppingmall.home.auth.MemberMapper;
import com.tireshoppingmall.home.order.CartDTO;
import com.tireshoppingmall.home.order.MainOrderDTO;


	

@Service
public class MemberDAO {
	
	@Autowired
	private SqlSession ss;
	
	public void regMember(HttpServletRequest req, MemberDTO mDTO) {
		System.out.println("값-------"+mDTO.getMc_number());
		if(ss.getMapper(MemberMapper.class).regMember(mDTO)>=3) {
			System.out.println("가입성공");
			System.out.println(mDTO.getMc_year());
			req.setAttribute("resultMem", "가입성공");
		}else {
			req.setAttribute("resultMem", "가입실패");
		}
	}

	public void login(MemberDTO mDTO, HttpServletRequest req) {
		System.out.println("아디"+mDTO.getU_id());
		System.out.println("비번"+mDTO.getPw_password());
		//성공시 비밀번호 반환 실패시 널
		String checkMemberInDB = ss.getMapper(MemberMapper.class).checkMember(mDTO);
		
		
		System.out.println("0--------!!"+checkMemberInDB);
		if (checkMemberInDB != null ) {
			System.out.println("-----------아이디 성공");
				System.out.println("값이 뭘까"+mDTO.getMc_number() +"이사이에");
				if (checkMemberInDB.equals(mDTO.getPw_password())) {
					System.out.println("비밀번호 성공");
					AuthUserDTO member = ss.getMapper(MemberMapper.class).getMember(mDTO);
					
					req.getSession().setAttribute("loginMember", member);
					req.getSession().setMaxInactiveInterval(60 * 10);
				}
			
		} else {
			req.setAttribute("resultMem", "Can not find user");
			System.out.println("2--------!!아이디 체크 실패");
		}	
	}

	public boolean loginCheck(HttpServletRequest req) {
		AuthUserDTO m = (AuthUserDTO) req.getSession().getAttribute("loginMember");
		if (m != null) {
			return true;
		}
		return false;
	}

	public void logout(HttpServletRequest req) {
		req.getSession().setAttribute("loginMember", null);		
	}

	public void getMyOrder(HttpServletRequest req, AuthUserDTO aDTO) {
		System.out.println(aDTO.getU_no());
		String tireId = null;
		String quantity = null;
		ArrayList<CartDTO> productList = new ArrayList<CartDTO>();
		List<MainOrderDTO> orders = ss.getMapper(MemberMapper.class).getMyOrder(aDTO);
		req.setAttribute("orders", orders);
		System.out.println(orders);
		if (orders.size() != 0) {
			for (MainOrderDTO oDTO : orders) {
				String[] products = oDTO.getO_product().split(",");
				for (String product : products) {
					tireId = product.split("/")[0];
					quantity = product.split("/")[1];
					System.out.println(tireId);
					CartDTO cDTO = ss.getMapper(MemberMapper.class).getTireInfo(tireId);
					cDTO.setTi_stock(Integer.parseInt(quantity));
					productList.add(cDTO);
				}
			}
		}
		req.setAttribute("productList", productList);
		System.out.println(productList);
	}

	public void deleteMember(HttpServletRequest req, int u_no) {
		
		
		if (ss.getMapper(MemberMapper.class).deleteMember(u_no) ==1 ) {
			System.out.println("삭제완료");
			logout(req);
		} 
		
		
		
		
		
		
		
	}

	public int updateInfo(MemberDTO mDTO) {
		
		return ss.getMapper(MemberMapper.class).updateInfo(mDTO);
	}

	public String idFind(AuthUserDTO aDTO) {
		
		return ss.getMapper(MemberMapper.class).idFind(aDTO);
	}

	
	
	 
	
	
	
	
	
	
	
	
	
	
	
}
