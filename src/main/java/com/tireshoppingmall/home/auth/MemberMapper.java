package com.tireshoppingmall.home.auth;

import java.util.List;

import com.tireshoppingmall.home.order.CartDTO;
import com.tireshoppingmall.home.order.MainOrderDTO;

public interface MemberMapper {

	int regMember(MemberDTO mDTO);

	String checkMember(MemberDTO mDTO);

	int checkIDkko(String kakaoID);

	AuthUserDTO getMember(MemberDTO mDTO);

	AuthUserDTO getSocialMember(String socialID);

	int regMemberSocial(MemberDTO mDTO);

	List<MyOrderDTO> getMyOrder(AuthUserDTO aDTO);


	int checkPw(MemberDTO mDTO);

	int deleteMember(int u_no);

	int updateInfo(MemberDTO mDTO);

	String idFind(AuthUserDTO aDTO);

	CartDTO getTireInfo(String tireId);
	
	int pwFind(AuthUserDTO aDTO);

	int pwSet(MemberDTO mDTO);

	List<MyOrderDTO> getNonOrder(MainOrderDTO oDTO);

	int phoneNumCheck(String phoneNum);



}
