package com.tireshoppingmall.home.admin.car;

import java.util.List;

public interface AdminCarMapper {

	int getCarCount(CarDTO startend);
	
	List<CarDTO> getAllCar(CarDTO paging);
	
	CarDTO getCar(CarDTO c);

	List<CarDTO> getAllCar();

	int regCar(CarDTO c);
	
	int getBrandId(String c_brand);

	int updatecar(CarDTO c);

	int deletecar(CarDTO c);
	
	//차 브랜드
	List<CarDTO> getAllCarBrands();
	
	int getallBrandCount(int i);

	int regbrand(CarDTO c);
	
	int deletebrand(CarDTO c);

	int updatebrand(CarDTO c);


	int updatebrandcar(CarDTO c);

	int carBrandNameChange(CarDTO c);

	String getBrnadName(int c_cb_id);

	int carBrandChange(CarDTO c);

	

	



	
}
