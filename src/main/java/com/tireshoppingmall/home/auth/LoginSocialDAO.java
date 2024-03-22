package com.tireshoppingmall.home.auth;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.tireshoppingmall.home.auth.MemberDTO;
import com.tireshoppingmall.home.auth.MemberMapper;


	

@Service
public class LoginSocialDAO {
	
	@Autowired
	private SqlSession ss;
	
	 //------------------------------------------카카오 ---------------------------------------------------------------
	//https://developers.kakao.com/docs/latest/ko/kakaologin/rest-api#request-code
	 //토큰발급
	
		public String getAccessToken (String authorize_code) {
			System.out.println("여긴 오나? 2");
	        String access_Token = "";
	        String refresh_Token = "";
	        String reqURL = "https://kauth.kakao.com/oauth/token";
	        try {
	            URL url = new URL(reqURL);

	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

	            //  URL연결은 입출력에 사용 될 수 있고, POST 혹은 PUT 요청을 하려면 setDoOutput을 true로 설정해야함.
	            conn.setRequestMethod("POST");
	            conn.setDoOutput(true);

	            //	POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
	            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	            StringBuilder sb = new StringBuilder();
	            sb.append("grant_type=authorization_code");
	            //sb.append("&client_id=9ac97206ae6044bf6edfb9749a0e5e62");  //본인이 발급받은 key
	            // sb.append("&client_id=0b3e3ccd649011c1da5feee5f25fa010");  //이번에 바꾼 key  REST API 키  나중에 이걸로해야
	            sb.append("&client_id=d1b1a9018632bd600689694eb9153b75");  //test  REST API 키
	            sb.append("&redirect_uri=http://localhost/home/login/oauth_kakao");     // 본인이 설정해 놓은 경로
	            sb.append("&code=" + authorize_code);	
	            bw.write(sb.toString());
	            bw.flush();

	            //    결과 코드가 200이라면 성공
	            int responseCode = conn.getResponseCode();
	            System.out.println("responseCode : " + responseCode);

	            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	            String line = "";
	            String result = "";

	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	            System.out.println("response body : " + result);

	            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
				JsonParser parser = new JsonParser();
	            JsonElement element = parser.parse(result);

	            access_Token = element.getAsJsonObject().get("access_token").getAsString();
	            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

	            System.out.println("access_token : " + access_Token);
	            System.out.println("refresh_token : " + refresh_Token);

	            br.close();
	            bw.close();
	        } catch (Exception e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }

	        return access_Token;
	    }
	
	
		 //유저정보조회
	    public HashMap<String, Object> getUserInfo (String access_Token) {

	        //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
	        HashMap<String, Object> userInfo = new HashMap<String, Object>();
	        String reqURL = "https://kapi.kakao.com/v2/user/me";
	        try {
	            URL url = new URL(reqURL);
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	            conn.setRequestMethod("GET");

	            //    요청에 필요한 Header에 포함될 내용
	            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

	            int responseCode = conn.getResponseCode();
	            System.out.println("responseCode : " + responseCode);

	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

	            String line = "";
	            String result = "";

	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	            System.out.println("유저정보response body : " + result);
	            String[]resultSplit = result.split(",|:");
	            String kakaoID =  resultSplit[1];
	            System.out.println(kakaoID);
	            		
	            JsonParser parser = new JsonParser();
	            JsonElement element = parser.parse(result);

	            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

	            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	            String email = kakao_account.getAsJsonObject().get("email").getAsString();
	            
	            userInfo.put("accessToken", access_Token);
	            userInfo.put("nickname", nickname);
	            userInfo.put("email", email);
	            userInfo.put("kakaoID", kakaoID);

	        } catch (Exception e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }

	        return userInfo;
	    }


		public int checkIdkko(String ID) {
			
			return ss.getMapper(MemberMapper.class).checkIDkko(ID);
			
		}


		public void login(String socialID, HttpServletRequest req) {
			
			System.out.println("소셜아이디 : " + socialID);
			AuthUserDTO member = ss.getMapper(MemberMapper.class).getSocialMember(socialID);
			req.getSession().setAttribute("loginMember", member);
			req.getSession().setMaxInactiveInterval(60 * 10);
				
				
		}


		public Boolean regMemberSocial(HttpServletRequest req, MemberDTO mDTO) {
			
			if(mDTO.getMc_number()==null) {
				mDTO.setMc_number("");
				mDTO.setMc_brand("");
				mDTO.setMc_carname("");
				mDTO.setMc_year("0");
			}
			
			
			if(ss.getMapper(MemberMapper.class).regMemberSocial(mDTO)>=3) {
				System.out.println("가입성공");
				req.setAttribute("resultMem", "가입성공");
				return true;
			}else {
				req.setAttribute("resultMem", "가입실패");
				return false;
			}			
		}


		
	
	
	
	
	
	
	
	
	
	
}
