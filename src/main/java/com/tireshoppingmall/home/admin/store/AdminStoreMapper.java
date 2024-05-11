package com.tireshoppingmall.home.admin.store;

import java.util.List;

public interface AdminStoreMapper {
	
	int getBranchCount(BranchDTO search);
	
	List<BranchDTO> getBranchlist(BranchDTO paging);

	List<BranchDTO> getAllBranch();

	int regBranch(BranchDTO b);

	List<BranchDTO> branchSearchbranchname(BranchDTO b);

	BranchDTO getbranch(BranchDTO b);

	int updatebranch(BranchDTO b);


	int deletebranch(BranchDTO b);

	List<BranchDTO> getBranch(BranchDTO search);

	

	
}
