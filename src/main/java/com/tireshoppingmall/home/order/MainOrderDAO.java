package com.tireshoppingmall.home.order;

import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MainOrderDAO {
	
	@Autowired
	private SqlSession ss;

	public void setValues(HttpServletRequest req, MainOrderDTO mODTO) {
		ArrayList<CartDTO> cList = (ArrayList<CartDTO>) req.getSession().getAttribute("cartSession");
		String orderName = cList.get(0).getTg_name() + " " + cList.get(0).getTi_stock() + "EA";
		if (cList.size() > 1) {
			orderName = cList.get(0).getTg_name() + " " + cList.get(0).getTi_stock() + "EA 외" + (cList.size() - 1) + "건";
		}
		String orderProduct = "";
		String uuid = UUID.randomUUID().toString().split("-")[0];
		int priceValue = 0;
		for (CartDTO cartDTO : cList) {
			orderProduct += cartDTO.getTi_id() + "/" + cartDTO.getTi_stock() + ",";
			priceValue += cartDTO.getTi_allpricegp();
		}
		orderProduct = orderProduct.substring(0, orderProduct.length() - 1);
		mODTO.setO_ordernumber(uuid);
		mODTO.setO_ordername(orderName);
		mODTO.setO_product(orderProduct);
		mODTO.setO_price(priceValue + "");
		System.out.println(mODTO);
		ss.getMapper(MainOrderMapper.class).setOrder(mODTO);
	}
	
}
