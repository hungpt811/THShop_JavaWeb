package com.devpro.shop16.controller.khachhang;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.devpro.shop16.controller.BaseController;
import com.devpro.shop16.entities.Contact;
import com.devpro.shop16.services.ContactService;

@Controller
public class ContactController extends BaseController {
	@RequestMapping(value = { "/contact" }, method = RequestMethod.GET)
	public String contact(final Model model, final HttpServletRequest request, final HttpServletResponse reponse)
			throws IOException {
		Contact contact = new Contact();

		model.addAttribute("contact", contact);
		return "khachhang/contact";
	}


	@Autowired
	private ContactService contactService;

	@RequestMapping(value = { "/contact" }, method = RequestMethod.POST)
	public String post_sf(final Model model, 
			final HttpServletRequest request, 
			final HttpServletResponse reponse,
			final @ModelAttribute("contact") Contact contact,
			RedirectAttributes ra) throws IOException {

//		model.addAttribute("TB",
//				"Cảm ơn " + contact.getFirst_name() + ", chúng tôi sẽ liên hệ với bạn trong thời gian sớm nhất");
		contactService.saveOrUpdate(contact);
		ra.addFlashAttribute("flag","showAlert");
//		 load lại để làm mới input
		model.addAttribute("contact", new Contact());
		return "khachhang/contact";
	}


	
	

}
