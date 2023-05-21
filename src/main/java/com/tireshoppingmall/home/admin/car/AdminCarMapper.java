package com.tireshoppingmall.home.admin.car;

import java.util.List;

public interface AdminCarMapper {

	int getCarCount(CarDTO startend);
	
	List<CarDTO> getAllCar(CarDTO paging);
	
	CarDTO getCar(CarDTO c);

	List<CarDTO> getAllCar();

	int regCar(CarDTO c);

	int updatecar(CarDTO c);

	int deletecar(CarDTO c);
	
	//차 브랜드
	List<CarDTO> getAllCarBrands();
	
	int getallBrandCount(String cb_name);

	int regbrand(CarDTO c);
	
	int deletebrand(CarDTO c);

	int updatebrand(CarDTO c);


	int updatebrandcar(CarDTO c);

	



	
}
