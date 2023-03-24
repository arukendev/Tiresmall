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
		req.setAttribute("orders", ss.getMapper(MemberMapper.class).getMyOrder(aDTO)); 
		
	
	/*	try {
			
			int count = oo.getOrderCountPerPage();
			int start = (pageNo - 1) * count + 1;
			int end = start + (count - 1);

			OrderSearchDTO orderSearch = (OrderSearchDTO) req.getSession().getAttribute("orderSearchDTO");
			int orderCount = 0;
			if (orderSearch == null) {
				orderSearch = new OrderSearchDTO(new BigDecimal(start), new BigDecimal(end), "", "", "", "", "");
				orderCount = allOrderCount;
				System.out.println("null이면---" + allOrderCount);
			} else {
				orderSearch.setStart(new BigDecimal(start));
				orderSearch.setEnd(new BigDecimal(end));
				orderCount = ss.getMapper(AdminOrderMapper.class).getOrderCount(orderSearch);
			}

			List<OrderDTO> orders = ss.getMapper(AdminOrderMapper.class).getOrder(orderSearch);
			for (OrderDTO order : orders) {
				ArrayList<TireDTO> order_tires = new ArrayList<TireDTO>();
//				order.getO_product(); 4/2, 6/2
				String splitProduct[] = order.getO_product().split(","); // 1/2,2/2
				for (String product : splitProduct) {
					int tirePK = Integer.parseInt(product.charAt(0) + ""); // 4 , 6
					int tireCount = product.charAt(2);
					List<TireDTO> tireListDto = ss.getMapper(AdminTireMapper.class).getTireGroupforDetail(tirePK);
						for (TireDTO tDto : tireListDto) {
							tDto.setTi_count(Integer.parseInt(product.charAt(2) + ""));
							order_tires.add(tDto);
							
							System.out.println(tDto);
						}
						System.out.println(tireCount);
					
				}
				order.setO_products(order_tires);
				
			}

			int pageCount = (int) Math.ceil(orderCount / (double) count);
			req.setAttribute("orders", orders);
			req.setAttribute("pageCount", pageCount);
			req.setAttribute("curPage", pageNo);

			} catch (Exception e) {
				e.printStackTrace();
				System.err.println("실패---------------------");
			}*/
		
		
		
		
		
		
		
		
		
		
		
		
		
		
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

	public String idFind(String name, int phoneNum) {

		return ss.getMapper(MemberMapper.class).idFind(name,phoneNum);
	}

	
	
	 
	
	
	
	
	
	
	
	
	
	
	
}
