package com.devpro.shop16.controller.khachhang;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.devpro.shop16.controller.BaseController;
import com.devpro.shop16.dto.Cart;
import com.devpro.shop16.dto.CartItem;
import com.devpro.shop16.dto.CategorySearchModel;
import com.devpro.shop16.dto.ProductSearchModel;
import com.devpro.shop16.entities.Categories;
import com.devpro.shop16.entities.Contact;
import com.devpro.shop16.entities.ProductImages;
import com.devpro.shop16.entities.Products;
import com.devpro.shop16.entities.Subcribe;
import com.devpro.shop16.entities.Users;
import com.devpro.shop16.services.CategoriesService;
import com.devpro.shop16.services.PagerData;
import com.devpro.shop16.services.ProductsService;
import com.devpro.shop16.services.SubcribeService;
import com.devpro.shop16.services.UsersService;

@Controller
public class HomeController extends BaseController {
	@Autowired
	private ProductsService productService;

	@Autowired
	private CategoriesService categoriesService;

	@RequestMapping(value = { "/", "/index" }, method = RequestMethod.GET)
	public String home(final Model model, final HttpServletRequest request, final HttpServletResponse reponse)
			throws IOException {
		ProductSearchModel searchModel = new ProductSearchModel();

		searchModel.keyword = request.getParameter("keyword");
		searchModel.setPage(getCurrentPage(request));
		searchModel.categoryId = super.getInteger(request, "categoryId");

		model.addAttribute("productsWithPaging", productService.search(searchModel));
		model.addAttribute("searchModel", searchModel);

		return "khachhang/index2";
	}

	@Autowired
	UsersService usersService;

	@RequestMapping(value = { "/user/info" }, method = RequestMethod.GET)
	public String user_get(final Model model, final HttpServletRequest request, final HttpServletResponse reponse)
			throws IOException {
		model.addAttribute("userInfo", getUserLogined());
		return "khachhang/user_profile";
	}

	@RequestMapping(value = { "/user/info" }, method = RequestMethod.POST)
	public String user_post(final Model model, final HttpServletRequest request, final HttpServletResponse reponse,
			RedirectAttributes ra, final @ModelAttribute("userInfo") Users userInfo) throws IOException {
		model.addAttribute("userInfo", usersService.update(userInfo));
		getUserLogined().setFullname(userInfo.getFullname());
		getUserLogined().setEmail(userInfo.getEmail());
		getUserLogined().setAddress(userInfo.getAddress());
		getUserLogined().setPhonenumber(userInfo.getPhonenumber());
		ra.addFlashAttribute("message", "Cập nhật thông tin tài khoản thành công!");
		return "khachhang/user_profile";
	}

	/*
	 * @RequestMapping(value = { "/{categorySeo}" }, method = RequestMethod.GET)
	 * public String categoryDetails(final Model model, final HttpServletRequest
	 * request, final HttpServletResponse response,
	 * 
	 * @PathVariable("categorySeo") String categorySeo) throws IOException {
	 * 
	 * CategorySearchModel searchModel = new CategorySearchModel(); searchModel.seo
	 * = categorySeo;
	 * 
	 * PagerData<Categories> categories = categoriesService.search(searchModel);
	 * Categories category = categories.getData().get(0);
	 * 
	 * model.addAttribute("category", category);
	 * 
	 * return "khachhang";
	 * 
	 * }
	 */

	@Autowired
	private SubcribeService subcribeService;

	/**
	 * Sử dụng ajax
	 * 
	 * @param model
	 * @param request
	 * @param response
	 * @param subcribe
	 * @return
	 */
	@RequestMapping(value = { "/ajax/index" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_subcribe(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody Subcribe subcribe) {
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		subcribeService.saveOrUpdate(subcribe);
		jsonResult.put("code", 200);
		jsonResult.put("message", "Đăng ký thành công!");
		jsonResult.put("mail", subcribe.getEmail());
		jsonResult.put("message2", "Địa chỉ email không đúng định dạng.");

		return ResponseEntity.ok(jsonResult);
	}

}
