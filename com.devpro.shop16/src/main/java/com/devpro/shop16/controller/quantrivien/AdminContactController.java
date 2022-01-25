package com.devpro.shop16.controller.quantrivien;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shop16.controller.BaseController;

import com.devpro.shop16.dto.ContactSearchModel;

import com.devpro.shop16.services.ContactService;
@Controller
public class AdminContactController extends BaseController {
	@Autowired
	private ContactService contactService;
	@RequestMapping(value = { "/admin/contact" }, method = RequestMethod.GET)
	public String cate(final Model model, final HttpServletRequest request, final HttpServletResponse reponse)
			throws IOException {
		ContactSearchModel searchModel = new ContactSearchModel();
		searchModel.keyword = request.getParameter("keyword");
		searchModel.setPage(getCurrentPage(request));
		
		model.addAttribute("contactWithPaging", contactService.search(searchModel));
		model.addAttribute("searchModel", searchModel);
		return "quantrivien/lienhe";
	}


}
