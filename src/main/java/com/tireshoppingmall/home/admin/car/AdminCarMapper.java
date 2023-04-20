package com.tireshoppingmall.home.admin.car;

import java.util.List;

public interface AdminCarMapper {

	int getCarCount(CarDTO startend);
	
	List<CarDTO> getAllCar(CarDTO paging);
	
	List<CarDTO> getAllCarBrands();
	
	CarDTO getCar(CarDTO c);

	List<CarDTO> getAllCar();

	int regCar(CarDTO c);

	int updatecar(CarDTO c);

	int deletecar(CarDTO c);

	int deletebrand(CarDTO c);


	int regbrand(CarDTO c);


	List<CarDTO> getallBrandCount(CarDTO c);


	int deletebrandcar(CarDTO c);


	int updatebrand(CarDTO c);


	int updatebrandcar(CarDTO c);


	int carprintOnOff(CarDTO c);


	
}
