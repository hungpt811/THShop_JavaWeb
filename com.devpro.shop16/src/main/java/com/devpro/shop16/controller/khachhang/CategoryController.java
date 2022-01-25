package com.devpro.shop16.controller.khachhang;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shop16.controller.BaseController;
import com.devpro.shop16.dto.ProductSearchModel;
import com.devpro.shop16.services.CategoriesService;
import com.devpro.shop16.services.ProductsService;


@Controller // tạo một BEAN là một controller
public class CategoryController extends BaseController{
	@Autowired
	private ProductsService productService;

	@Autowired
	private CategoriesService categoriesService;
	@RequestMapping(value = {"/category" }, method = RequestMethod.GET)
	public String category(final Model model, final HttpServletRequest request, final HttpServletResponse reponse)
			throws IOException {
		ProductSearchModel searchModel = new ProductSearchModel();
		searchModel.keyword = request.getParameter("keyword");
		searchModel.setPage(getCurrentPage(request));
		searchModel.categoryId = super.getInteger(request, "categoryId");
		
		model.addAttribute("productsWithPaging", productService.search(searchModel));
		model.addAttribute("searchModel", searchModel);
		return "khachhang/products";
	}
	

	
//	Subcribe
	/**
	 * Sử dụng ajax
	 * 
	 * @param model
	 * @param request
	 * @param response
	 * @param contactModel
	 * @return
	 */
//	@RequestMapping(value = { "/ajax/subcribe" }, method = RequestMethod.POST)
//	public ResponseEntity<Map<String, Object>> ajax_subcribe(final Model model, final HttpServletRequest request,
//			final HttpServletResponse response, final @RequestBody Subscribe sub) {
//		Map<String, Object> jsonResult = new HashMap<String, Object>();
//		jsonResult.put("code", 200);
//		jsonResult.put("message", "Cảm ơn bạn, chúng tôi sẽ liên hệ sớm nhất!");
//		return ResponseEntity.ok(jsonResult);
//	}
}
