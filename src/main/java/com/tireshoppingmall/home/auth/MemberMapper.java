package com.tireshoppingmall.home.auth;

import java.util.List;

import com.tireshoppingmall.home.admin.order.OrderDTO;

public interface MemberMapper {

	int regMember(MemberDTO mDTO);

	int checkMember(MemberDTO mDTO);

	int checkIDkko(String kakaoID);

	AuthUserDTO getMember(MemberDTO mDTO);

	AuthUserDTO getSocialMember(String socialID);

	int regMemberSocial(MemberDTO mDTO);

	List<OrderDTO> getMyOrder(AuthUserDTO aDTO);


}
