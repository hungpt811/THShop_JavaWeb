package com.devpro.shop16.controller.quantrivien;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.shop16.controller.BaseController;

import com.devpro.shop16.dto.UserSearchModel;
import com.devpro.shop16.entities.Products;
import com.devpro.shop16.entities.Users;
import com.devpro.shop16.services.UsersService;

@Controller
public class AdminUserController extends BaseController {
	@Autowired
	private UsersService usersService;
	
	@RequestMapping(value = { "/admin/account" }, method = RequestMethod.GET)
	public String user(final Model model, final HttpServletRequest request, final HttpServletResponse reponse)
			throws IOException {
		UserSearchModel searchModel = new UserSearchModel();
		searchModel.keyword = request.getParameter("keyword");
		searchModel.setPage(getCurrentPage(request));
		
		model.addAttribute("usertWithPaging", usersService.search_user(searchModel));
		model.addAttribute("searchModel", searchModel);
		return "quantrivien/accountManager";
	}
	
	
	@RequestMapping(value = { "/admin/adminAccount" }, method = RequestMethod.GET)
	public String admin(final Model model, final HttpServletRequest request, final HttpServletResponse reponse)
			throws IOException {
		UserSearchModel searchModel = new UserSearchModel();
		searchModel.keyword = request.getParameter("keyword");
		searchModel.setPage(getCurrentPage(request));
		
		model.addAttribute("usertWithPaging", usersService.search_admin(searchModel));
		model.addAttribute("searchModel", searchModel);
		return "quantrivien/accountManager";
	}
	
	@RequestMapping(value = { "/admin/editAccount/{accountId}" }, method = RequestMethod.GET)
	public String user_id(final Model model, 
			final HttpServletRequest request, 
			final HttpServletResponse reponse,
			@PathVariable("accountId") int accountId)
			throws IOException {
//		lấy sản phẩm trong db
		Users user = usersService.getById(accountId);
		model.addAttribute("user", user);

		return "quantrivien/editAccount";
	}
	
	@RequestMapping(value = { "/admin/editAccount" }, method = RequestMethod.POST)
	public String user_post(final Model model, final HttpServletRequest request, final HttpServletResponse reponse,
			final @ModelAttribute("user") Users user ) throws IOException {

				if (user.getId() != null || user.getId() > 0) { // thêm mới
				 // chỉnh sửa
					usersService.update(user);
				}
		return "redirect:/admin/account"; 

	}
	
	
	

}
