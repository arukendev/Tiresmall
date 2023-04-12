package com.tireshoppingmall.home.auth;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.lang.reflect.Member;
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


	

@Service
public class MemberDAO {
	
	@Autowired
	private SqlSession ss;
	
	public void regMember(HttpServletRequest req, MemberDTO mDTO) {
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
				}else {
					req.setAttribute("result_login", " 비밀번호를 잘못 입력했습니다.\r\n" + 
							"입력하신 내용을 다시 확인해주세요.");
					System.out.println("2--------!!비밀번호 체크 실패");
				}
			
		} else {
			req.setAttribute("result_login", "아이디 또는 비밀번호를 잘못 입력했습니다.\r\n" + 
					"입력하신 내용을 다시 확인해주세요.");
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
		req.setAttribute("orders", ss.getMapper(MemberMapper.class).getMyOrder(aDTO)); 
		
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

	public int pwFind(AuthUserDTO aDTO) {
		
		return ss.getMapper(MemberMapper.class).pwFind(aDTO);
	}

	public int setPassword(MemberDTO mDTO) {
		
		return ss.getMapper(MemberMapper.class).pwSet(mDTO);
	}

	
	
	 
	
	
	
	
	
	
	
	
	
	
	
}
