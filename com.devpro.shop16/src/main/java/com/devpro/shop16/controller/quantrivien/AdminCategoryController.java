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
import com.devpro.shop16.dto.CategorySearchModel;
import com.devpro.shop16.dto.ProductSearchModel;
import com.devpro.shop16.entities.Categories;
import com.devpro.shop16.entities.Products;
import com.devpro.shop16.services.CategoriesService;
import com.devpro.shop16.services.ProductsService;
@Controller
public class AdminCategoryController extends BaseController {

	@Autowired
	private CategoriesService categoriesService;
	@RequestMapping(value = { "/admin/addcategory" }, method = RequestMethod.GET)
	public String addcate(final Model model, final HttpServletRequest request, final HttpServletResponse reponse)
			throws IOException {
		Categories category = new Categories();
		model.addAttribute("category", category);
		return "quantrivien/themdanhmuc";
	}
	
	
	@RequestMapping(value = { "/admin/deleteCate/{cateID}" }, method = RequestMethod.GET)
	public String deletecate(final Model model, final HttpServletRequest request, final HttpServletResponse reponse,
			@PathVariable("cateID") int cateID)
			throws IOException {		
		categoriesService.deleteById(cateID);
		return "redirect:/admin/category";
	}
	
	@RequestMapping(value = { "/admin/category" }, method = RequestMethod.GET)
	public String cate(final Model model, final HttpServletRequest request, final HttpServletResponse reponse)
			throws IOException {
		CategorySearchModel searchModel = new CategorySearchModel();
		searchModel.keyword = request.getParameter("keyword");
		searchModel.setPage(getCurrentPage(request));
		
		model.addAttribute("categoriesWithPaging", categoriesService.search(searchModel));
		model.addAttribute("searchModel", searchModel);
		return "quantrivien/danhmuc";
	}

	
	
	
	@RequestMapping(value = { "/admin/addcategory/{cateId}" }, method = RequestMethod.GET)
	public String cate(final Model model, 
			final HttpServletRequest request, 
			final HttpServletResponse reponse,
			@PathVariable("cateId") int cateId)
			throws IOException {
		Categories category = categoriesService.getById(cateId);
		model.addAttribute("category", category);
		return "quantrivien/themdanhmuc";
	}
	
	@RequestMapping(value = { "/admin/addsubcategory/{cateId}" }, method = RequestMethod.GET)
	public String subcate(final Model model, 
			final HttpServletRequest request, 
			final HttpServletResponse reponse,
			@PathVariable("cateId") int cateId)
			throws IOException {
		Categories category = categoriesService.getById(cateId);
		model.addAttribute("category", category);
		return "quantrivien/themdanhmuccon";
	}
	
	@RequestMapping(value = { "/admin/addsubcategory" }, method = RequestMethod.POST)
	public String addsubcate(final Model model, 
			final HttpServletRequest request, 
			final HttpServletResponse reponse,
			final @ModelAttribute("category") Categories category)
			throws IOException {
		String subName = request.getParameter("subname");
		Categories subCate = new Categories();
		subCate.setName(subName);
		category.addChild(subCate);
		categoriesService.add(subCate);	
		return "redirect:/admin/category";
	}


	

	@RequestMapping(value = { "/admin/addcategory" }, method = RequestMethod.POST)
	public String cate_post(final Model model, final HttpServletRequest request, final HttpServletResponse reponse,
			final @ModelAttribute("category") Categories category ) throws IOException {

		// cần kiểm tra xem id của product
		// = null || = 0 thì thêm mới
		// ngược lại là chỉnh sửa
		if (category.getId() == null || category.getId() <= 0) { // thêm mới
			categoriesService.add(category);
		} else { // chỉnh sửa
			categoriesService.update(category);
		}

		model.addAttribute("TB", "Cập nhật sản phẩm " + category.getName() + " thành công!");

		return "redirect:/admin/category"; 

	}

}
