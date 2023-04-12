package com.tireshoppingmall.home;

import com.tireshoppingmall.home.auth.AuthUserDTO;

public interface HomeMapper {

	HomeGradeCheck checkAdmin(AuthUserDTO aDTO);

}
