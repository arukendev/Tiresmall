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
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tireshoppingmall.home.admin.auth.AuthDTO;
import com.tireshoppingmall.home.order.CartDTO;

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
		ProductDTO product = ss.getMapper(ProductMapper.class).getProduct(pDTO);
		String[] detailImg = product.getTg_detail().split("!");
		request.setAttribute("product", product);
		request.setAttribute("detailImg", detailImg);
	}

	public Sizes getProductSizes(HttpServletRequest request, ProductDTO pDTO) {
		return new Sizes(ss.getMapper(ProductMapper.class).getProductSizes(pDTO));
	}
		

	public String kakaoPayReady(ProductDTO productDTO, HttpServletRequest req) {
		try {
			AuthDTO authDTO = (AuthDTO)req.getSession().getAttribute("authDTO");
			URL address;
			address = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection conn = (HttpURLConnection) address.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "KakaoAK 6dc69e58bf698dd1b7727e7001cb05c1");
			conn.setDoOutput(true);
			// 보내줘야할것
			// 상품이름,사용자 아이디, 상품 갯수, 총 결제 금액, 승인 url, 취소 url, 실패 url

			String stuffname = ""; // 상품이름
			String itemName = ""; // 결제창에 보일 이름
			int totalprice = 0; // 총액
			int stuffamount = 1; // 상품개수
			String userid = ""; // 사용자 id

			String cartNumbers[] = req.getParameter("items").split(",");
			req.getSession().setAttribute("cartNumbers", req.getParameter("items"));
			CartDTO cDTO;
/*
			for (int i = 0; i < cartNumbers.length; i++) {
				cDTO = new CartDTO();

				int cart_id = Integer.parseInt(cartNumbers[i]);
				cDTO.setSc_cart_id(cart_id);
				// 실제 Cart 객체
				CartDTO targetDTO = ss.getMapper(StuffMapper.class).getOrderItem(cDTO);

				totalprice += targetDTO.getS_price() * targetDTO.getSc_amount();
				stuffamount += targetDTO.getSc_amount();

				if (i == 0) {

					itemName = targetDTO.getS_title().replace("<b>", "").replace("</b>", "");

				}

			}
		
			if ((cartNumbers.length - 1) > 0) {
				itemName += " 외 " + (cartNumbers.length - 1) + "개";

			}
	*/
			itemName = URLEncoder.encode(itemName, "utf-8");

			PaymentDTO paymentDTO = new PaymentDTO("TC0ONETIME", "partner_order_id", authDTO.getU_id(), itemName,
					String.valueOf(stuffamount), String.valueOf(totalprice), "0",
					"http://localhost/home/go.stuff.buy", "http://localhost/home/go.stuff.payment",
					"http://localhost/home/go.stuff.payment");
			// System.out.println(paymentDTO.toString());

			OutputStream send = conn.getOutputStream();
			DataOutputStream dataSend = new DataOutputStream(send);
			dataSend.writeBytes(paymentDTO.toString());
			dataSend.close();
			int result = conn.getResponseCode();
			InputStream receive;
			if (result == 200) {
				receive = conn.getInputStream();
				req.getSession().setAttribute("paymentDTO", paymentDTO);
				// System.out.println(receive);
			} else {
				receive = conn.getErrorStream();
				// System.out.println(receive);
			}
			InputStreamReader read = new InputStreamReader(receive);
			BufferedReader change = new BufferedReader(read);

			String jsonData = change.readLine();
			System.out.println(jsonData);
			JSONParser jp = new JSONParser();
			JSONObject jo = (JSONObject) jp.parse(jsonData);
			req.getSession().setAttribute("jsonData", jsonData);
			req.getSession().setAttribute("partner_user_id", authDTO.getU_id());
			req.getSession().setAttribute("tid", jo.get("tid"));
			String redirectUrl = (String) jo.get("next_redirect_pc_url");
			dataSend.writeBytes(paymentDTO.toString());
			return redirectUrl;

		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}

	public String kakaoPopup(ProductDTO productDTO, HttpServletRequest req) {
		try {
			AuthDTO authDTO = (AuthDTO)req.getSession().getAttribute("authDTO");
			
			// 유저의 주소를 session으로
			System.out.println("카카오페이 팝업 이전!!");
			System.out.println(productDTO.toString());

			if (authDTO != null) {
				req.getSession().setAttribute("addr", productDTO);
				System.out.println("세선 설정 완료 !!");
			}
			
			URL address;
			address = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection conn = (HttpURLConnection) address.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "KakaoAK 9f00a6c37ca4dae0706159881b447cec");
			conn.setDoOutput(true);
			// 보내줘야할것
			// 상품이름,사용자 아이디, 상품 갯수, 총 결제 금액, 승인 url, 취소 url, 실패 url
			
			String stuffname = ""; // 상품이름
			String itemName = ""; // 결제창에 보일 이름
			int totalprice = 0; // 총액
			
			int stuffamount = req.getSession().getAttribute("amount") == null ? 1 : Integer.parseInt(req.getSession().getAttribute("amount").toString()); // 상품개수
			String userid = ""; // 사용자 id
			
			String item = req.getParameter("items");
			System.out.println("items : " + item);
			req.getSession().setAttribute("cartNumbers", item);
			// ,
		/*
			if (item.contains(",")) {
				// 장바구니
				String cartNumbers[] = item.split(",");

				CartDTO cDTO;

				for (int i = 0; i < cartNumbers.length; i++) {
					cDTO = new CartDTO();

					int cart_id = Integer.parseInt(cartNumbers[i]);
					cDTO.setSc_cart_id(cart_id);

					// 실제 Cart 객체
					CartDTO targetDTO = ss.getMapper(StuffMapper.class).getOrderItem(cDTO);

					totalprice += targetDTO.getS_price() * targetDTO.getSc_amount();
					stuffamount += targetDTO.getSc_amount();

					if (i == 0) {
						targetDTO.setS_title(targetDTO.getS_title().replace("<b>", "").replace("</b>", ""));
						itemName = targetDTO.getS_title();
					}

				}
				
				if ((cartNumbers.length - 1) > 0) {
					itemName += " 외 " + (cartNumbers.length - 1) + "개";
				}

			} else {
				// 바로구매
				StuffDTO s = new StuffDTO();
				s.setS_no(Integer.parseInt(item));
				
				goBuyNow(s, req);
				
				StuffDTO sDTO = (StuffDTO) req.getAttribute("sDTO");
				itemName = sDTO.getS_title().replace("<b>", "").replace("</b>", "");
				totalprice = Integer.parseInt(sDTO.getS_price());
				stuffamount = 1;
			}
*/
			itemName = URLEncoder.encode(itemName, "utf-8");

			PaymentDTO paymentDTO = new PaymentDTO("TC0ONETIME", "partner_order_id", authDTO.getU_id(), itemName,
					String.valueOf(stuffamount), String.valueOf(totalprice), "0",
					"http://localhost:8080/camping/go.stuff.buy.popup",
					"http://localhost:8080/camping/go.stuff.payment.popup",
					"http://localhost:8080/camping/go.stuff.payment.popup");

			OutputStream send = conn.getOutputStream();
			DataOutputStream dataSend = new DataOutputStream(send);
			dataSend.writeBytes(paymentDTO.toString());
			dataSend.close();
			int result = conn.getResponseCode();
			InputStream receive;
			if (result == 200) {
				req.getSession().setAttribute("paymentDTO", paymentDTO);
				receive = conn.getInputStream();
				// System.out.println(receive);
			} else {
				receive = conn.getErrorStream();
				// System.out.println(receive);
			}
			InputStreamReader read = new InputStreamReader(receive);
			BufferedReader change = new BufferedReader(read);
			String jsonData = change.readLine();
			// System.out.println(jsonData);
			req.getSession().setAttribute("jsonData", jsonData);
			JSONParser jp = new JSONParser();
			JSONObject jo = (JSONObject) jp.parse(jsonData);
			req.getSession().setAttribute("partner_user_id", authDTO.getU_id());
			req.getSession().setAttribute("tid", jo.get("tid"));
//				"cid=TC0ONETIME" \
//				--data-urlencode "tid=T1234567890123456789" \
//				--data-urlencode "partner_order_id=partner_order_id" \
//				--data-urlencode "partner_user_id=partner_user_id" \
//				--data-urlencode "pg_token=xxxxxxxxxxxxxxxxxxxx"

			return jsonData;

		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}

	}

}
