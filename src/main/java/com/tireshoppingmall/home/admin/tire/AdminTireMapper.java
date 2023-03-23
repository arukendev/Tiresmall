package com.tireshoppingmall.home.admin.tire;

import java.util.List;
import java.util.Map;

public interface AdminTireMapper {

	int getTireCountByMz(int i);
	
	List<TireDTO> getAllTireGroup(TireDTO paging);

	int getTireCount(TireDTO paging);

	List<TireDTO> getTireBrand();

	int getTireBrandCount(String tb_name);

	int deleteTireBrand(TireDTO tb);

	int deleteTireGroup(TireDTO tg);

	List<TireDTO> getTireGroupforDetail(int tirePK);//어디서 씀????

	int tirePrintOnOff(TireDTO tg);

	int tireSedanRecommend(TireDTO tg);

	int tireSuvRecommend(TireDTO tg);

	int tireGroupReg(TireListDTO tDTO);	//

	int getTireGroupPk(String tg_name);//값 가져오기

	int tierItemReg2(TireListDTO tDTO);

	int tierItemReg(Map<String, String> tireSize);

	List<TireDTO> getTireItem(TireDTO tDTO);

	TireDTO getTireGroupDetail(int tg_id);

	int tireSizeDelete(int ti_id);
	
	int tireNameChage(TireDTO tDTO);

	int tireTextChage(TireDTO tDTO);

	int tireSizeChage(TireDTO tDTO);

	int tireMarckingChange(TireDTO tDTO);

	int tirePriceChange(TireDTO tDTO);

	int tireStockChange(TireDTO tDTO);

	int tireBrandPrintOnOff(TireDTO tDTO);

	int tireSBrandNameChange(TireDTO tDTO);

	int tireGroupDcrateChange(TireDTO tDTO);

}
