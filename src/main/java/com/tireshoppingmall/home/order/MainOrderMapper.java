package com.tireshoppingmall.home.order;

import java.util.List;

public interface MainOrderMapper {

	int setOrder(MainOrderDTO mODTO);

	List<CarName> getCarName();

	List<CarBrand> getCarBrand();

}
