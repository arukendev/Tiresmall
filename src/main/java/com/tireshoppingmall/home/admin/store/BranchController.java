package com.tireshoppingmall.home.admin.store;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BranchController {
	
	private boolean firstReq;

	@Autowired
	private BranchDAO sDAO;

	public BranchController() {
		firstReq = true;
	}

	//admin.store.go
	@RequestMapping(value = "/admin.store.go", method = RequestMethod.GET)
	public String companyGo(HttpServletRequest req) {
		if (firstReq) {
			sDAO.calcAllBranchCount();
			firstReq = false;
		}
		
		BranchDTO.clearSearch(req);
		sDAO.getAllBranch(1, req);
	
		req.setAttribute("contentPage", "store/branch.jsp");
		return "admin/master";
	}
	
	
	@RequestMapping(value = "/admin.store.search.do", method = RequestMethod.GET)
	public String branchSearchbranchname(BranchDTO bDTO, HttpServletRequest req) {
	
		sDAO.branchPasing(bDTO,req);
		sDAO.getAllBranch(1, req);
		
		req.setAttribute("contentPage", "store/branch.jsp");
		return "admin/master";
	}

	
	@RequestMapping(value = "/branch.page.change", method = RequestMethod.GET)
	public String PagingBranch(HttpServletRequest req, @RequestParam int p) {

		sDAO.getAllBranch(p, req);

		req.setAttribute("contentPage", "store/branch.jsp");
		return "admin/master";
	}
	
	

	@RequestMapping(value = "/admin.store.reg.go", method = RequestMethod.GET)
	public String storeRegGo(HttpServletRequest req) {

		req.setAttribute("contentPage", "store/branchReg.jsp");	
		return "admin/master";
	}
	@RequestMapping(value = "/admin.store.reg.do", method = RequestMethod.POST)
	public String storeRegDo(BranchDTO bDTO, HttpServletRequest req) {

		sDAO.regBranch(bDTO, req);
		sDAO.getAllBranch(1, req);
		
		
		req.setAttribute("contentPage", "store/branch.jsp");
		return "admin/master";
	}
	
	@RequestMapping(value = "/admin.store.update.go", method = RequestMethod.GET)
	public String branchupdateGo(BranchDTO bDTO, HttpServletRequest req) {
		sDAO.getbranch(bDTO,req);
		
		req.setAttribute("contentPage", "store/branchReg.jsp");
		return "admin/master";

	}


	@RequestMapping(value = "/admin.store.update.do", method = RequestMethod.POST)
	public String branchupdateDo(BranchDTO bDTO, HttpServletRequest req) {
		sDAO.updatebranch(bDTO, req);
		sDAO.getAllBranch(1, req);
	//	bDAO.getAllBranch(m);


		req.setAttribute("contentPage", "store/branch.jsp");
		return "admin/master";

	}

	@RequestMapping(value = "/admin.store.delete.go", method = RequestMethod.GET)
	public String branchdelete(BranchDTO bDTO, HttpServletRequest req) {

		sDAO.deletebranch(bDTO, req);
		sDAO.getAllBranch(1, req);
	//	bDAO.getAllBranch(m);

		req.setAttribute("contentPage", "store/branch.jsp");
		return "admin/master";

	}

}
