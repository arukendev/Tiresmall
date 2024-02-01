package com.tireshoppingmall.home.product;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tireshoppingmall.home.admin.auth.AuthDTO;
import com.tireshoppingmall.home.admin.car.CarDTO;

@Service
public class ProductDAO {
	
	@Autowired
	private SqlSession ss;
	
	@Autowired
	private ProductGroupOption pgo;
	
	private int allProductGroupCount;
	
	public int getAllProductGroupCount() {
		return allProductGroupCount;
	}

	public void setAllProductGroupCount(int allProductGroupCount) {
		this.allProductGroupCount = allProductGroupCount;
	}



	public void getProductGroup(int pageNo, HttpServletRequest request) {
		
		int count = pgo.getProductGroupCountPerPage();	// 지금 16
        int start = (pageNo - 1) * count + 1;
        int end = start + (count - 1);
        
        ProductSelector search = (ProductSelector) request.getSession().getAttribute("search");
        int productGroupCount = 0;

        if (search == null) {
            search = new ProductSelector("", "", new BigDecimal(start), new BigDecimal(end));
            productGroupCount = allProductGroupCount;
        } else {
            search.setStart(new BigDecimal(start));
            search.setEnd(new BigDecimal(end));
            productGroupCount = ss.getMapper(ProductMapper.class).getProductGroupCount(search);
        }

        List<ProductGroupDTO> pGroups = ss.getMapper(ProductMapper.class).getProductGroup(search);
        for (ProductGroupDTO pGroup : pGroups) {
        		if(ss.getMapper(ProductMapper.class).getMinInchOfGroup(pGroup)!=null) {
				pGroup.setMinInch(Integer.parseInt(ss.getMapper(ProductMapper.class).getMinInchOfGroup(pGroup)));
        		}
        		if(ss.getMapper(ProductMapper.class).getMaxInchOfGroup(pGroup)!=null) {
        			pGroup.setMaxInch(Integer.parseInt(ss.getMapper(ProductMapper.class).getMaxInchOfGroup(pGroup)));
        		}
        		if(ss.getMapper(ProductMapper.class).getMinPriceOfGroup(pGroup)!=null) {
        			pGroup.setMinPrice(Integer.parseInt(ss.getMapper(ProductMapper.class).getMinPriceOfGroup(pGroup)));
        		}
        		if(ss.getMapper(ProductMapper.class).getMaxPriceOfGroup(pGroup)!=null) {
        			pGroup.setMaxPrice(Integer.parseInt(ss.getMapper(ProductMapper.class).getMaxPriceOfGroup(pGroup)));
        		}
		}
        
        int pageCount = (int) Math.ceil(productGroupCount / (double) count);
        request.setAttribute("pageCount", pageCount);
        request.setAttribute("theNumber", productGroupCount);
        request.setAttribute("pGroups", pGroups);
        request.setAttribute("curPage", pageNo);
		
	}

	public void searchProductGroup(String b, HttpServletRequest request) {
		ProductSelector search = new ProductSelector(b, "", new BigDecimal(0), new BigDecimal(0));
		request.getSession().setAttribute("search", search);
	}
	
	public void calcAllProductGroupCount() {
		ProductSelector pSel = new ProductSelector("", "", null, null);
		allProductGroupCount = ss.getMapper(ProductMapper.class).getProductGroupCount(pSel);
		System.out.println(allProductGroupCount);
	}

	public void clearSearch(HttpServletRequest request) {
		request.getSession().setAttribute("search", null);
	}

	public void searchProductGroup(String b, String t, HttpServletRequest request) {
		ProductSelector search = new ProductSelector(b, t, new BigDecimal(0), new BigDecimal(0));
		request.getSession().setAttribute("search", search);
	}

	public ProductGroups getProductGroupJson(int pageNo, HttpServletRequest request) {
		int count = pgo.getProductGroupCountPerPage();
        int start = (pageNo - 1) * count + 1;
        int end = start + (count - 1);
		
        ProductSelector search = (ProductSelector) request.getSession().getAttribute("search");
        int productGroupCount = 0;
        
        search.setStart(new BigDecimal(start));
        search.setEnd(new BigDecimal(end));
        productGroupCount = ss.getMapper(ProductMapper.class).getProductGroupCount(search);
        
		List<ProductGroupDTO> pGroups = ss.getMapper(ProductMapper.class).getProductGroup(search);
		
        for (ProductGroupDTO pGroup : pGroups) {
    		if(ss.getMapper(ProductMapper.class).getMinInchOfGroup(pGroup)!=null) {
			pGroup.setMinInch(Integer.parseInt(ss.getMapper(ProductMapper.class).getMinInchOfGroup(pGroup)));
    		}
    		if(ss.getMapper(ProductMapper.class).getMaxInchOfGroup(pGroup)!=null) {
    			pGroup.setMaxInch(Integer.parseInt(ss.getMapper(ProductMapper.class).getMaxInchOfGroup(pGroup)));
    		}
    		if(ss.getMapper(ProductMapper.class).getMinPriceOfGroup(pGroup)!=null) {
    			pGroup.setMinPrice(Integer.parseInt(ss.getMapper(ProductMapper.class).getMinPriceOfGroup(pGroup)));
    		}
    		if(ss.getMapper(ProductMapper.class).getMaxPriceOfGroup(pGroup)!=null) {
    			pGroup.setMaxPrice(Integer.parseInt(ss.getMapper(ProductMapper.class).getMaxPriceOfGroup(pGroup)));
    		}
        }
        
        int pageCount = (int) Math.ceil(productGroupCount / (double) count);
		return new ProductGroups(pGroups, pageCount, productGroupCount, pageNo);
	}

	public void getProduct(HttpServletRequest request, ProductDTO pDTO) {
		
		if(pDTO.getTi_inch() != 0) {
			System.out.println("여기옴");	
			
			ProductDTO searchProduct = ss.getMapper(ProductMapper.class).getProductOneSize(pDTO);
			
			searchProduct.setResult_price(Integer.parseInt(request.getParameter("result_price")));
			
			System.out.println(searchProduct.getResult_price());
			request.setAttribute("searchProduct", searchProduct);
			
		}else {
			System.out.println("오면 안되는곳에 옴");
		}
		
		ProductDTO product = ss.getMapper(ProductMapper.class).getProduct(pDTO);
		String[] detailImg = product.getTg_detail().split("!");
		request.setAttribute("product", product);
		request.setAttribute("detailImg", detailImg);
		
		
	}

	public Sizes getProductSizes(HttpServletRequest request, ProductDTO pDTO) {
		return new Sizes(ss.getMapper(ProductMapper.class).getProductSizes(pDTO));
	}
		

	public String kakaoPopup(PaymentDTO paymentDTO, HttpServletRequest req) {
		try {
			System.out.println(paymentDTO.toString());
			AuthDTO authDTO = (AuthDTO)req.getSession().getAttribute("authDTO");
			String authId = "0";
			if(authDTO != null) {
			authId = authDTO.getU_id();
			}
			URL address;
			address = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection conn = (HttpURLConnection) address.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "KakaoAK aac0993bc3eb0ca5c638aa1ceb85fcdf");
			conn.setDoOutput(true);
			String itemName = paymentDTO.getItem_name(); // 결제창에 보일 이름
			paymentDTO.setItem_name(itemName = URLEncoder.encode(itemName, "utf-8"));
			paymentDTO.setCid("TC0ONETIME");
			paymentDTO.setPartner_order_id("tiresmall");
			paymentDTO.setApproval_url("http://localhost/home/kakao.popup.approve.go");
			paymentDTO.setFail_url("http://localhost/home/kakao.popup.fail");
			paymentDTO.setCancel_url("http://localhost/home/kakao.popup.cancle");

			OutputStream send = conn.getOutputStream();
			DataOutputStream dataSend = new DataOutputStream(send);
			dataSend.writeBytes(paymentDTO.toString());
			dataSend.close();
			int result = conn.getResponseCode();
			InputStream receive;
			if (result == 200) {
				receive = conn.getInputStream();
				req.getSession().setAttribute("paymentDTO", paymentDTO);
			} else {
				receive = conn.getErrorStream();
			}
			InputStreamReader read = new InputStreamReader(receive);
			BufferedReader change = new BufferedReader(read);

			String jsonData = change.readLine();
			System.out.println(jsonData);
			JSONParser jp = new JSONParser();
			JSONObject jo = (JSONObject) jp.parse(jsonData);
			req.getSession().setAttribute("jsonData", jsonData);
			req.getSession().setAttribute("partner_user_id", authId);
			req.getSession().setAttribute("tid", jo.get("tid"));
			String redirectUrl = (String) jo.get("next_redirect_pc_url");
			System.out.println(redirectUrl);
			dataSend.writeBytes(paymentDTO.toString());
			return jsonData;

		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}

	
	public void kakaoApprove(HttpServletRequest req) {
		try {
			String tid = (String) req.getSession().getAttribute("tid");
			String pg_token = req.getParameter("pg_token");
			System.out.println(tid);
			System.out.println(pg_token);
			URL address;
			address = new URL("https://kapi.kakao.com/v1/payment/approve");
			HttpURLConnection conn = (HttpURLConnection) address.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "KakaoAK aac0993bc3eb0ca5c638aa1ceb85fcdf");
			conn.setDoOutput(true);

			String jsonData = (String) req.getSession().getAttribute("jsonData");
			System.out.println("넘겨받은 jsonData : " + jsonData);
			JSONParser jp = new JSONParser();
			JSONObject jo = (JSONObject) jp.parse(jsonData);
			String params = "cid=TC0ONETIME&tid=" + tid + "&partner_order_id=tiresmall" + "&partner_user_id="
					+ req.getSession().getAttribute("partner_user_id") + "&pg_token=" + pg_token;
			System.out.println("==============");
			System.out.println(params);
			OutputStream send = conn.getOutputStream();
			DataOutputStream dataSend = new DataOutputStream(send);
			dataSend.writeBytes(params);
			dataSend.flush();
			dataSend.close();

			System.out.println(conn.getResponseCode());
			System.out.println("카카오페이 로직 종료");
				
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 타이어 검색
	public void getTireSeachProductGroup(HttpServletRequest request, ProductDTO pDTO) {
		
		
		List<ProductDTO> joinDTO = new ArrayList<ProductDTO>();
		
		pDTO.setTi_width(pDTO.getFront_tire_width());
		pDTO.setTi_ratio(pDTO.getFront_tire_ratio());
		pDTO.setTi_inch(pDTO.getFront_tire_inch());
		
		
		List<ProductDTO> resultFrontpDTO = ss.getMapper(ProductMapper.class).getTireGroup(pDTO);
		for (ProductDTO p : resultFrontpDTO) {
			//할인 가격
			int result_price = p.getTi_pricefac() * (100-p.getTg_dcrate()) / 100;
			p.setResult_price((int) Math.ceil((result_price/100)*100));
		} 
		joinDTO.addAll(resultFrontpDTO);
		
		if(pDTO.getRear_tire_width()!=0) {
			System.out.println("앞 타이어랑 뒤 타이어랑 다름");
			
			pDTO.setTi_width(pDTO.getRear_tire_width());
			pDTO.setTi_ratio(pDTO.getRear_tire_ratio());
			pDTO.setTi_inch(pDTO.getRear_tire_inch());
			
			List<ProductDTO> resultRearpDTO = ss.getMapper(ProductMapper.class).getTireGroup(pDTO);
			for (ProductDTO p : resultRearpDTO) {
				//할인 가격
				int result_price = p.getTi_pricefac() * (100-p.getTg_dcrate()) / 100;
				p.setResult_price((int) Math.ceil((result_price/100)*100));
			}
			joinDTO.addAll(resultRearpDTO);
		}
		
		request.setAttribute("searchDo", 1);
		request.setAttribute("pGroups", joinDTO);
		request.setAttribute("count", joinDTO.size());

	}

	public List<CarDTO> getProductCarBrand() {
		return ss.getMapper(ProductMapper.class).getCarAllBrand();
	}

	public List<CarDTO> getProductCarName(CarDTO cDTO) {
		return ss.getMapper(ProductMapper.class).getCarAllName(cDTO);
	}

	public List<CarDTO> getProductCarTireSize(CarDTO cDTO) {
		return ss.getMapper(ProductMapper.class).getCarAllTireSize(cDTO);
	}

}
