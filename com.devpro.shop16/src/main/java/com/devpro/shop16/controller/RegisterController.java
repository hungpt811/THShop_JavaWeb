package com.devpro.shop16.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shop16.entities.Roles;
import com.devpro.shop16.entities.Users;
import com.devpro.shop16.services.RolesService;
import com.devpro.shop16.services.UsersService;

@Controller
public class RegisterController extends BaseController {
	@RequestMapping(value = {"/register"}, method = RequestMethod.GET)
	public String register(final Model model, final HttpServletRequest request, final HttpServletResponse reponse)
			throws IOException{
		Users regUser = new Users();

		model.addAttribute("regUser", regUser);
		return "register";
	}
	@Autowired
	UsersService usersService;
	
	@Autowired 
	RolesService rolesService;
	
	@RequestMapping(value = { "/register" }, method = RequestMethod.POST)
	public String post_register(final Model model, 
			final HttpServletRequest request, 
			final HttpServletResponse reponse,
			final @ModelAttribute("regUser") Users regUser) throws IOException {

		model.addAttribute("TB_SUCCESS", "Register Successfull!");
		regUser.setPassword(new BCryptPasswordEncoder(4).encode(regUser.getPassword()));	
		rolesService.addDedaultRole(regUser);
		usersService.saveOrUpdate(regUser);
//		 load lại để làm mới input
		model.addAttribute("regUser", new Users());		
		return "redirect:/login";
	}
	
}
