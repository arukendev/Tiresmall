package com.tireshoppingmall.home.auth;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tireshoppingmall.home.admin.car.AdminCarMapper;
import com.tireshoppingmall.home.admin.car.CarDTO;
import com.tireshoppingmall.home.order.CartDTO;
import com.tireshoppingmall.home.order.MainOrderDTO;


	

@Service
public class MemberDAO {
	
	@Autowired
	private SqlSession ss;
	
	public void regMember(HttpServletRequest req, MemberDTO mDTO) {
		System.out.println("값-------"+mDTO.getMc_number());
		if(mDTO.getMc_number() == null) {
			mDTO.setMc_number("");
			mDTO.setMc_brand("");
			mDTO.setMc_carname("");
			mDTO.setMc_year("0");
		}
		mDTO.setU_logintype("1");
		
		if(ss.getMapper(MemberMapper.class).regMember(mDTO) >= 3) {
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
					System.out.println(member.getU_id());
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
		req.getSession().setAttribute("homegradecheck", null);		
	}

	public void getMyOrder(HttpServletRequest req, AuthUserDTO aDTO) {
		System.out.println(aDTO.getU_no());
		List<MyOrderDTO> orders = ss.getMapper(MemberMapper.class).getMyOrder(aDTO);
		List<CartDTO> tireList = null;
		if (orders.size() != 0) {
			
			for (MyOrderDTO mDTO : orders) {
				String[] products = mDTO.getO_product().split(",");
				tireList = new ArrayList<CartDTO>();
				for (String product : products) {
					String tireId = product.split("/")[0];
					String tireStock = product.split("/")[1];
					System.out.println(tireId);
					CartDTO cDTO = ss.getMapper(MemberMapper.class).getTireInfo(tireId);
					cDTO.setTi_stock(Integer.parseInt(tireStock));
					tireList.add(cDTO);
				}
				mDTO.setProductList(tireList);
			}
			req.setAttribute("orders", orders);
			System.out.println(orders);
		}
	}
	
	public void getNonOrder(HttpServletRequest req, MainOrderDTO oDTO) {
		System.out.println(oDTO.getO_phone());
		List<MyOrderDTO> orders = ss.getMapper(MemberMapper.class).getNonOrder(oDTO);
		List<CartDTO> tireList = null;
		if (orders.size() != 0) {
			for (MyOrderDTO mDTO : orders) {
				String[] products = mDTO.getO_product().split(",");
				tireList = new ArrayList<CartDTO>();
				for (String product : products) {
					String tireId = product.split("/")[0];
					String tireStock = product.split("/")[1];
					System.out.println(tireId);
					CartDTO cDTO = ss.getMapper(MemberMapper.class).getTireInfo(tireId);
					cDTO.setTi_stock(Integer.parseInt(tireStock));
					tireList.add(cDTO);
				}
				mDTO.setProductList(tireList);
			}
			req.setAttribute("orders", orders);
		}
		
	}

	public void deleteMember(HttpServletRequest req, int u_no) {
		
		if (ss.getMapper(MemberMapper.class).deleteMember(u_no) == 1) {
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

	public int phoneNumCheck(String phoneNum) {
		System.out.println("카운트 값 : " + ss.getMapper(MemberMapper.class).phoneNumCheck(phoneNum));
		return ss.getMapper(MemberMapper.class).phoneNumCheck(phoneNum);		
	}

	public void getMyInfo(HttpServletRequest req, Model model, AuthUserDTO aDTO) {
		//여기서 차 브랜드 가져오기
    	
    	
    	List<CarDTO> carBrand =  ss.getMapper(AdminCarMapper.class).getAllCarBrands();
    	req.setAttribute("carBrand", carBrand);
    	
    	
    	
		
	}

	

	
	
	 
	
	
	
	
	
	
	
	
	
	
	
}
