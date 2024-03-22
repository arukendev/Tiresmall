package com.tireshoppingmall.home.auth;

import java.io.IOException;
import java.util.HashMap;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.tireshoppingmall.home.order.MainOrderDTO;



@Controller
public class AuthController {
	
	@Autowired
	private MemberDAO mDAO;
	@Autowired
	private LoginSocialDAO lsDAO;
	
	 /* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;
    
    @Autowired
    private JavaMailSender mailSender;
    
    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
    
    @RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
    @ResponseBody
    public String mailCheck(@RequestParam("sm_email") String sm_email) throws Exception{
        int serti = (int)((Math.random()* (99999 - 10000 + 1)) + 10000);
        
        String from = "cwy1231@naver.com";//보내는 이 메일주소
        String to = sm_email;
        String title = "회원가입시 필요한 인증번호 입니다.";
        String content = "[인증번호] "+ serti +" 입니다. <br/> 인증번호 확인란에 기입해주십시오.";
        String num = "";
        try {
        	
        	MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
            
            mailHelper.setFrom(from);
            mailHelper.setTo(to);
            mailHelper.setSubject(title);
            mailHelper.setText(content, true);       
            
            mailSender.send(mail);
            num = Integer.toString(serti);
            
        } catch(Exception e) {
            num = "error";
        }
        return num;
    }
	
	@RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST})
	public String goLogin(HttpSession session,Model model) {
		 /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
        //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
        System.out.println("네이버:" + naverAuthUrl);
        
        //네이버 
        model.addAttribute("url", naverAuthUrl);
        
		return "main/auth/login";
		
	}
	
	@RequestMapping(value = "/authTermsOfUse.go", method = RequestMethod.GET)
	public String authTermsOfUseGo(Model model) {
		return "main/auth/termsOfUse";
	}
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String loginDo(MemberDTO mDTO, HttpServletRequest req,HttpSession session) {
		mDAO.login(mDTO,req);
		
		//로그인 실패할 경우
		if (!mDAO.loginCheck(req)) {
			String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
	        System.out.println("네이버:" + naverAuthUrl);
	        req.setAttribute("url", naverAuthUrl);
			return "forward:/login";
		}
		
		// 로그인페이지를통하여들어온경우:	로그인후에 홈화면으로
		if (req.getSession().getAttribute("loginRequiredByQna") == null) {
			req.setAttribute("content", "main/home/home.jsp");
			return "redirect:/";
		// 1:1문의페이지를통하여들어온경우:	로그인후에 1:1문의화면으로
		} else {
			req.getSession().setAttribute("loginRequiredByQna", null);	
			return "redirect: board.qna.check";
		}
		
		
		
		
		
		
	}
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logoutDo(MemberDTO mDTO, HttpServletRequest req) {
		
		mDAO.logout(req);
		mDAO.loginCheck( req);
		req.setAttribute("content", "main/home/home.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/updateInfo", method = RequestMethod.GET)
	public String updateInfo(MemberDTO mDTO, HttpServletRequest req,Model model,AuthUserDTO aDTO) {
		
		if (mDAO.loginCheck( req)) {
			AuthUserDTO m = (AuthUserDTO) req.getSession().getAttribute("loginMember");
			mDTO.setU_id(m.getU_id());
			
			 System.out.println(mDAO.updateInfo(mDTO)); 
			if (mDAO.updateInfo(mDTO)>=1) {

				
					lsDAO.login(m.getU_id(), req);
					aDTO = (AuthUserDTO) req.getSession().getAttribute("loginMember");
					model.addAttribute("content", "main/auth/myProfile.jsp");
					model.addAttribute("board_whereAmIOne", "<i class=\"fa-solid fa-chevron-right\"></i> myProfile");
					model.addAttribute("board_whereAmITwo", "나의 회원정보");
//		    	System.out.println(aDTO.getMc_brand());
//		    	System.out.println(aDTO.getMc_carname());
//		    	System.out.println(aDTO.getMc_number());
//		    	System.out.println(aDTO.getMc_year());
					model.addAttribute("personalInfomation",aDTO);
					model.addAttribute("profile_contents", "profileInfo.jsp");
					return "index";
				
			}
		}
		
		req.setAttribute("content", "main/home/home.jsp");
		return "index";
	}
	@RequestMapping(value = "/deleteMember", method = RequestMethod.GET)
	public String deleteMember(MemberDTO mDTO, HttpServletRequest req) {
		int u_no = Integer.parseInt(req.getParameter("u_no"));
		if (mDAO.loginCheck(req)) {
			mDAO.deleteMember(req,u_no);
			req.setAttribute("content", "main/home/home.jsp");
			return "index";
		}
		req.setAttribute("content", "main/home/home.jsp");
		return "index";
	}
	
	
	
	
	@RequestMapping(value = "/authReg.go", method = RequestMethod.GET)
	public String authRegGo(HttpServletRequest req) {
		
		return "main/auth/authReg";
	}
	@RequestMapping(value = "/authRegSocial.go", method = RequestMethod.GET)
	public String authRegSOGo(HttpServletRequest req,MemberDTO mDTO) {
		System.out.println(req.getParameter("socialID"));
		if(mDTO.getMc_number() =="") {
			mDTO.setMc_number("차량없음");
		}
		return "main/auth/authRegSocial";
	}
	
	
	@RequestMapping(value = "/authReg.do", method = RequestMethod.POST)
	public String authRegDo(HttpServletRequest req,MemberDTO mDTO) {
		mDAO.regMember(req,mDTO);
		
		mDAO.login(mDTO,req);
		mDAO.loginCheck( req);
		req.setAttribute("content", "main/home/home.jsp");
		return "redirect:/";
	}
	@RequestMapping(value = "/authRegSocial.do", method = RequestMethod.POST)
	public String authRegSocialDo(HttpServletRequest req,MemberDTO mDTO) {
				//회원가입 성공하면
			if (lsDAO.regMemberSocial(req,mDTO)) {
				String socialID =  mDTO.getU_id();
				lsDAO.login(socialID,req);
				mDAO.loginCheck(req);   
				req.setAttribute("content", "main/home/home.jsp");
				return "redirect:/"; //본인 원하는 경로 설정}
			}
			req.setAttribute("content", "main/home/home.jsp");
			return "redirect:/"; //본인 원하는 경로 설정}
		
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int idCheck(@RequestParam("id") String id,Model model) {
		
		int cnt = lsDAO.checkIdkko(id);
		System.out.println("cnt : " + cnt);
		return cnt;
	}
	
	@ResponseBody
	@RequestMapping(value = "/phoneNumberCheck", method = RequestMethod.POST)
	public int phoneNumberCheck(@RequestParam("phoneNum") String phoneNum,Model model) {
		System.out.println("phoneNum : " + phoneNum);
		
		int cnt = mDAO.phoneNumCheck(phoneNum);
		System.out.println("cnt : " + cnt);
		return cnt;
	}
	
	
	
	
	@ResponseBody
	@RequestMapping(value = "/pwFind", method = RequestMethod.POST)
	public int pwFind(@Param("idInput") String idInput
			,@Param("emailInput") String emailInput
			,AuthUserDTO aDTO) {
		
		aDTO.setU_id(idInput);
		aDTO.setI_email(emailInput);
		
		int cnt = mDAO.pwFind(aDTO);
		System.out.println("cnt : " + cnt);
		return cnt;
	}
	@ResponseBody
	@RequestMapping(value = "/idFind", method = RequestMethod.POST)
	public String idFind(@Param("nameInput") String nameInput
			,@Param("phoneNumInput") String phoneNumInput
			,AuthUserDTO aDTO) {

		System.out.println("name" + nameInput);
		System.out.println("num" + phoneNumInput);
		aDTO.setI_name(nameInput);
		aDTO.setI_phoneNum(phoneNumInput);
		
		String findID= mDAO.idFind(aDTO);
		System.out.println("findID : " + findID);
		return findID;
	}
	
	@RequestMapping(value = "/pwNewSet", method = RequestMethod.POST)
	public String findEmailGo(MemberDTO mDTO,String pwNewSet) {
		System.out.println("--------아디"+mDTO.getU_id());
		System.out.println("--------비번"+mDTO.getPw_password());
		
		if (mDAO.setPassword(mDTO) ==1) {
			System.out.println("성공");
			return "main/auth/pwFindResult";
		}

		
		
		return "rediect:/findEmail.go";
	}
	
	
	
	@RequestMapping(value = "/findEmail.go", method = RequestMethod.GET)
	public String findEmailGo(Model model) {
		return "main/auth/authFind";
	}
	
	
	@RequestMapping(value = "/login/getKakaoAuthUrl" , method = RequestMethod.GET)
	public @ResponseBody String getKakaoAuthUrl(
			HttpServletRequest request) throws Exception {
		System.out.println("1");
		// sb.append("&client_id=9ac97206ae6044bf6edfb9749a0e5e62");d1b1a9018632bd600689694eb9153b75
		String reqUrl = 
				"https://kauth.kakao.com/oauth/authorize"
				+ "?client_id=d1b1a9018632bd600689694eb9153b75"		//나중에 바꿔야함
				+ "&redirect_uri=http://localhost/home/login/oauth_kakao"  
				+ "&response_type=code";
		
		System.out.println(reqUrl);
		return reqUrl;
	}
	
	// 카카오 연동정보 조회
	@RequestMapping(value = "/login/auth_kakao")
	public String oauthKakao(
			@RequestParam(value = "code", required = false) String code
			, Model model,HttpServletRequest req,RedirectAttributes rttr,MemberDTO mDTO) throws Exception {
		System.out.println("여긴 옴???111");
			
		System.out.println("#########" + code);
        String access_Token = lsDAO.getAccessToken(code);
        System.out.println("###access_Token#### : " + access_Token);
        
        
        HashMap<String, Object> userInfo = lsDAO.getUserInfo(access_Token);
       //System.out.println("###access_Token#### : " + access_Token);
        System.out.println("###userInfo#### : " + userInfo.get("email"));
        System.out.println("###nickname#### : " + userInfo.get("nickname"));
       System.out.println("###KAKAOID#### : " + userInfo.get("kakaoID"));
       
        JsonObject kakaoInfo =  new JsonObject();
        model.addAttribute("kakaoInfo", kakaoInfo);
        //model.addAttribute("kakaoID", userInfo.get("kakaoID"));
        
        String socialID = (String) userInfo.get("kakaoID");
        System.out.println("반환값 : "+ lsDAO.checkIdkko(socialID));
        
        //반환값이 1이면 기존 가입한 회원, 0이면 가입하지 않은 회원
        if (lsDAO.checkIdkko(socialID)==1) {
        	lsDAO.login(socialID,req);
        	mDAO.loginCheck(req);   
        	model.addAttribute("content", "main/home/home.jsp");
               return "redirect:/"; //본인 원하는 경로 설정
		}else {
			
			rttr.addFlashAttribute("socialID", socialID);
			return "redirect:/authRegSocial.go";
		}
        
       
	}
	
   
    //네이버 로그인 성공시 callback호출 메소드
    @RequestMapping(value = "/users/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session
    		,HttpServletRequest req,RedirectAttributes rttr , MemberDTO mDTO)throws IOException {
    	
        System.out.println("여기는 callback");
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
        apiResult = naverLoginBO.getUserProfile(oauthToken);
        System.out.println(naverLoginBO.getUserProfile(oauthToken).toString());
        model.addAttribute("result", apiResult);
        System.out.println("result"+apiResult);
       
        JsonElement element = JsonParser.parseString(apiResult);
        
        JsonObject object = element.getAsJsonObject();
        JsonObject info = object.getAsJsonObject("response");
        
        String email = info.get("email").getAsString();
        String id = info.get("id").getAsString().substring(0,9)+"N";
        String name = info.get("name").getAsString();
        String phoneNum = info.get("mobile").getAsString().replaceAll("[^0-9]","");
        mDTO.setI_email(email);
        mDTO.setU_id(id);
        mDTO.setI_name(name);
        mDTO.setI_phoneNum(phoneNum);
        mDTO.setU_logintype("3");
        mDTO.setMc_brand("empty");
        mDTO.setMc_carname("empty");
        mDTO.setMc_number("empty");
        mDTO.setMc_year("2014");
        

      //반환값이 1이면 기존 가입한 회원, 0이면 가입하지 않은 회원
        if (lsDAO.checkIdkko(id)==1) {
        	System.out.println("로그인 성공");
        	lsDAO.login(id,req);
        	mDAO.loginCheck(req);   
        	model.addAttribute("content", "main/home/home.jsp");
            return "redirect:/"; //본인 원하는 경로 설정
		} else {
			//회원가입 성공하면
			if (lsDAO.regMemberSocial(req,mDTO)) {
				lsDAO.login(id,req);
				mDAO.loginCheck(req);   
				req.setAttribute("content", "main/home/home.jsp");
				return "redirect:/"; //본인 원하는 경로 설정}
			}
			req.setAttribute("content", "main/home/home.jsp");
			return "redirect:/"; //본인 원하는 경로 설정}
		}
    }


    @RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String myProfileGo(HttpServletRequest req, AuthUserDTO aDTO) {
    	req.setAttribute("content", "main/auth/myProfile.jsp");
    	req.setAttribute("profile_contents", "myOrderList.jsp");
		
		aDTO = (AuthUserDTO) req.getSession().getAttribute("loginMember");
		if (aDTO == null) {
			return "redirect:/";
		}
		mDAO.getMyOrder(req,aDTO);
		
		return "index";
	}
    
    @RequestMapping(value = "/profile.myInfo", method = RequestMethod.GET)
    public String myProfileInfoGo(HttpServletRequest req,Model model,AuthUserDTO aDTO) {
    	
    	
    	
    	mDAO.getMyInfo(req,model,aDTO);
    	
    	aDTO = (AuthUserDTO) req.getSession().getAttribute("loginMember");
    	model.addAttribute("content", "main/auth/myProfile.jsp");
    	
    	if (aDTO == null) {
			return "redirect:/";
		}
    	System.out.println(aDTO.getMc_brand());
    	System.out.println(aDTO.getMc_carname());
    	System.out.println(aDTO.getMc_number());
    	System.out.println(aDTO.getMc_year());
    	
    	
    	model.addAttribute("personalInfomation",aDTO);
    	model.addAttribute("profile_contents", "profileInfo.jsp");
    	
    	return "index";
    }
    
    @RequestMapping(value = "/nonmember.go", method = RequestMethod.POST)
    public String getNonOrder(HttpServletRequest req, MainOrderDTO oDTO) {
    	
    	mDAO.getNonOrder(req, oDTO);
    	req.setAttribute("content", "main/auth/non_member.jsp");
    	
    	return "index";
    }
    









}
	
	
	

