package com.devpro.shop16.controller.quantrivien;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.shop16.controller.BaseController;
import com.devpro.shop16.dto.ProductSearchModel;
import com.devpro.shop16.entities.Categories;
import com.devpro.shop16.entities.Products;
import com.devpro.shop16.services.CategoriesService;
import com.devpro.shop16.services.ProductsService;

@Controller
public class AdminProductController extends BaseController {
	@Autowired
	private ProductsService productService;

	@Autowired
	private CategoriesService categoriesService;
	@RequestMapping(value = { "/admin/addproduct" }, method = RequestMethod.GET)
	public String addproduct(final Model model, final HttpServletRequest request, final HttpServletResponse reponse)
			throws IOException {
		Products product = new Products();
		model.addAttribute("product", product);
		// đẩy danh sách categories xuống
		model.addAttribute("categories", categoriesService.findAll());
		return "quantrivien/themmathang";
	}
	
	@RequestMapping(value = { "/admin/product" }, method = RequestMethod.GET)
	public String product(final Model model, final HttpServletRequest request, final HttpServletResponse reponse)
			throws IOException {
		ProductSearchModel searchModel = new ProductSearchModel();
		searchModel.keyword = request.getParameter("keyword");
		searchModel.setPage(getCurrentPage(request));
		searchModel.categoryId = super.getInteger(request, "categoryId");
		
		model.addAttribute("productsWithPaging", productService.search(searchModel));
		model.addAttribute("searchModel", searchModel);
		return "quantrivien/sanpham";
	}
	
	
//	@RequestMapping(value = { "/admin/product" }, method = RequestMethod.POST) public
//	  String product_post(final Model model, 
//			  final HttpServletRequest request,
//			  final HttpServletResponse reponse, 
//			  final @ModelAttribute("adminProduct") AdminProduct product,
//			  final @RequestParam("attachment") MultipartFile attachment) throws IOException {
//	  
//	  attachment.transferTo(new File("F:/eclipse/eclipse-workspace/com.devpro.shop16/src/main/resources/upload/" 
//			  					+ attachment.getOriginalFilename()));
//	  product.setImg("F:/eclipse/eclipse-workspace/com.devpro.shop16/src/main/resources/upload/" 
//			  					+ attachment.getOriginalFilename());  
//	  
//	  model.addAttribute("TB", "Cập nhật sản phẩm " + product.getName() + " thành công!"); 
//	  // load lai input
//	  model.addAttribute("adminProduct", new AdminProduct());
//	  return "quantrivien/sanpham"; 
//
//		}
	
	@RequestMapping(value = "admin/product/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") int id) {
		productService.deleteById(id);
		return "redirect:/admin/product";
	}
	
	@RequestMapping(value = { "/admin/addproduct/{productId}" }, method = RequestMethod.GET)
	public String product(final Model model, 
			final HttpServletRequest request, 
			final HttpServletResponse reponse,
			@PathVariable("productId") int productId)
			throws IOException {
//		lấy sản phẩm trong db
		Products product = productService.getById(productId);
		model.addAttribute("product", product);
		// đẩy danh sách categories xuống
//		model.addAttribute("categories", categoriesService.findAll());
		return "quantrivien/themmathang";
	}

	

	@RequestMapping(value = { "/admin/addproduct" }, method = RequestMethod.POST)
	public String product_post(final Model model, final HttpServletRequest request, final HttpServletResponse reponse,
			final @ModelAttribute("product") Products product,
			@RequestParam("productAvatar") MultipartFile productAvatar, // hứng file đẩy lên
			@RequestParam("productPictures") MultipartFile[] productPictures // hứng file đẩy lên
	) throws IOException {

		// cần kiểm tra xem id của product
		// = null || = 0 thì thêm mới
		// ngược lại là chỉnh sửa
		if (product.getId() == null || product.getId() <= 0) { // thêm mới
			productService.add(product, productAvatar, productPictures);
		} else { // chỉnh sửa
			productService.update(product, productAvatar, productPictures);
		}

		model.addAttribute("TB", "Cập nhật sản phẩm " + product.getTitle() + " thành công!");

//		return "quantrivien/themmathang";
		return "redirect:/admin/product"; 

	}

	/**
	 * Sử dụng ajax
	 * 
	 * @param model
	 * @param request
	 * @param response
	 * @param contactModel
	 * @return
	 * @throws IOException
	 * @throws IllegalStateException
	 */
//	@RequestMapping(value = { "/ajax/product" }, method = RequestMethod.POST)
//	public ResponseEntity<Map<String, Object>> ajax_product(final Model model, final HttpServletRequest request,
//			final HttpServletResponse response, final @RequestBody AdminProduct adminProduct)
//			throws IllegalStateException, IOException {
//		Map<String, Object> jsonResult = new HashMap<String, Object>();
//		jsonResult.put("code", 200);
//		jsonResult.put("message", "Cập nhật sản phẩm " + adminProduct.getName() + " thành công!");
//		return ResponseEntity.ok(jsonResult);
//	}
}
