package com.devpro.shop16.controller.quantrivien;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {
	@RequestMapping(value = {"/admin"}, method = RequestMethod.GET)
	public String admin(final Model model, final HttpServletRequest request, final HttpServletResponse reponse)
			throws IOException{
//			return "quantrivien/home";
			return "quantrivien/index";
		
	}
}
