package com.tireshoppingmall.home.admin.tire;

import java.util.List;
import java.util.Map;

public interface AdminTireMapper {

	int getTireCountByMz(int i);
	
	List<TireDTO> getAllTireGroup(TireDTO paging);

	List<TireDTO> getTireBrandPrint();

	int getTireCount(TireDTO paging);

	List<TireDTO> getTireBrand();
	
	
	TireDTO getOneTireBrand(TireDTO tDTO);

	int getTireBrandCount(String tb_name);

	int deleteTireBrand(TireDTO tb);

	int deleteTireGroup(TireDTO tg);

	List<TireDTO> getTireGroupforDetail(String tirePK);

	int tirePrintOnOff(TireDTO tg);

	int tireSedanRecommend(TireDTO tg);

	int tireSuvRecommend(TireDTO tg);

	int tireGroupReg(TireListDTO tDTO);	//

	int getTireGroupPk(String tg_name);//값 가져오기

	int tierItemReg2(TireListDTO tDTO);

	int tierItemReg(Map<String, String> tireSize);

	List<TireDTO> getTireItem(TireDTO tDTO);

	TireDTO getTireGroupDetail(int tg_id);
	
	int getTireGroupUpdate(TireListDTO tDTO);

	int tireSizeDelete(int ti_id);

	int tireSizeChage(TireDTO tDTO);

	int tireMarckingChange(TireDTO tDTO);

	int tirePriceChange(TireDTO tDTO);

	int tireStockChange(TireDTO tDTO);

	int tireBrandPrintOnOff(TireDTO tDTO);

	
	//타이어 브랜드 이름 변경
	int tireBrandNameChange(TireDTO tDTO);
	//타이어 그룹 브랜드 이름변경
	int tireGroupBrandNameChange(TireDTO tDTO);

	int tireGroupDcrateChange(TireDTO tDTO);

	int tireBrandOrderChange(TireDTO tDTO);

	int regTireBrand(TireDTO tDTO);

	int adminTireSizeNewInsertReg(TireDTO tDTO);

	int tireImgUpdate(TireDTO tDTO);

	int tireImgsUpdate(TireDTO tDTO);

	int adminTireBrandImgChange(TireDTO tDTO);

	

	

	

	


}
