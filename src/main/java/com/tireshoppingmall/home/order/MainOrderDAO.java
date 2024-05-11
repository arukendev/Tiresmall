package com.tireshoppingmall.home.order;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tireshoppingmall.home.admin.store.AdminStoreMapper;
import com.tireshoppingmall.home.admin.store.BranchDTO;
import com.tireshoppingmall.home.store.StoreMapper;

@Service
public class MainOrderDAO {
	
	@Autowired
	private SqlSession ss;
	
	public void getCarInfo(HttpServletRequest req) {
		ArrayList<CarYear> carYears = new ArrayList<CarYear>();
		//현재 날짜 가져오기
		LocalDate now = LocalDate.now();
		int year = now.getYear(); //올해 년도
		//차종 제조 년도 
		for (int i = year; i > 2000; i--) {
			CarYear carYear = new CarYear();
			carYear.setCarYear(i);
			carYears.add(carYear);
		}
		List<CarName> carNames = ss.getMapper(MainOrderMapper.class).getCarName();
		List<CarBrand> carBrands = ss.getMapper(MainOrderMapper.class).getCarBrand();
	
		
		
		req.setAttribute("store", ss.getMapper(AdminStoreMapper.class).getAllBranch());
		req.setAttribute("carYears", carYears);
		req.setAttribute("carNames", carNames);
		req.setAttribute("carBrands", carBrands);
	}

	public void setValues(HttpServletRequest req, MainOrderDTO mODTO) {
		System.out.println("뭐길래???");
		System.out.println(req.getSession().getAttribute("cartSession"));

		
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
		if (ss.getMapper(MainOrderMapper.class).setOrder(mODTO) == 1) {
			System.out.println("등록성공");
			cList.clear();
		} else {
			System.out.println("등록실패");
		}
	}

	public BranchDTO payStoreChage(int id) {
		return ss.getMapper(StoreMapper.class).getAStore(id);
	}


	
}
