package com.duospace.duospace.company;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("duospace.companyController")
public class CompanyController {

	@RequestMapping(value="/space_company")
	public String reserve(Model model) throws Exception {
		return ".company.space_company";
	}
}
