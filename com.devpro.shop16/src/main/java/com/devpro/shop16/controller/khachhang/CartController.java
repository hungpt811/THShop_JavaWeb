package com.devpro.shop16.controller.khachhang;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shop16.controller.BaseController;
import com.devpro.shop16.dto.Cart;
import com.devpro.shop16.dto.CartItem;
import com.devpro.shop16.dto.ProductSearchModel;
import com.devpro.shop16.entities.Products;
import com.devpro.shop16.entities.SaleOrder;
import com.devpro.shop16.entities.SaleOrderProducts;
import com.devpro.shop16.entities.Users;
import com.devpro.shop16.services.PagerData;
import com.devpro.shop16.services.ProductsService;
import com.devpro.shop16.services.SaleOrderService;

@Controller
public class CartController extends BaseController {
	@Autowired
	private ProductsService productService;
	@Autowired
	private SaleOrderService saleOrderService;
	
	@RequestMapping(value = { "/cart/deleteProduct/{productID}" }, method = RequestMethod.GET)
	public String deleteProduct(final Model model, final HttpServletRequest request, final HttpServletResponse reponse,
			@PathVariable("productID") int productID)
			throws IOException {		
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng.
		Cart cart = null;
		// kiểm tra xem session có tồn tại đối tượng nào tên là "cart"
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();
		for (int i = 0; i < cartItems.size(); i++) {
			if (cartItems.get(i).getProductId() == productID) {				
				cart.getCartItems().remove(cartItems.get(i));	
			}
		}
		
		// tính tổng tiền
		this.calculateTotalPrice(request);
//		for (CartItem item : cartItems) {
//			if (item.getProductId() == productID) {				
//				cart.getCartItems().remove(item);	
//				continue;
//			}
//		}	
		session.setAttribute("cart", cart);
		session.setAttribute("totalItems", getTotalItems(request));		
		return "redirect:/cart";
	}

	@RequestMapping(value = { "/cart/delivery" }, method = RequestMethod.POST)
	public String cartFinish(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {

		// Thông tin khách hàng
		String customerFullName = request.getParameter("customerFullName");
		String customerAddress = request.getParameter("customerAddress");
		String customerEmail = request.getParameter("customerEmail");
		String customerPhone = request.getParameter("customerPhone");
		String total = request.getParameter("totalCart");
		// tạo hóa đơn
		SaleOrder saleOrder = new SaleOrder();

		// kiểm tra xem khách hàng có phải đã login hay chưa?
		if(super.isLogined()) {
			Users userLogined = super.getUserLogined();
			saleOrder.setUser(userLogined); //khóa ngoại user_id
			saleOrder.setCustomerName(userLogined.getUsername());
			saleOrder.setCustomerEmail(userLogined.getEmail());
			saleOrder.setCustomerAddress(userLogined.getAddress());
			saleOrder.setCustomerPhone(String.valueOf(userLogined.getPhonenumber()));
			saleOrder.setTotal(BigDecimal.valueOf(Double.valueOf(total)));
		} else {
		saleOrder.setCustomerName(customerFullName);
		saleOrder.setCustomerEmail(customerEmail);
		saleOrder.setCustomerAddress(customerAddress);
		saleOrder.setCustomerPhone(customerPhone);
		saleOrder.setTotal(BigDecimal.valueOf(Double.valueOf(total)));
		}		

		// mã hóa đơn
		saleOrder.setCode(String.valueOf(System.currentTimeMillis()));

//		if(getUserLogined() != null) {
//			
//		}

		// kết các sản phẩm trong giỏ hàng cho hóa đơn
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		for (CartItem cartItem : cart.getCartItems()) {
			SaleOrderProducts saleOrderProducts = new SaleOrderProducts();
			saleOrderProducts.setProduct(productService.getById(cartItem.getProductId()));
			saleOrderProducts.setQuantity(cartItem.getQuantity());

			// sử dụng hàm tiện ích add hoặc remove đới với các quan hệ onetomany
			saleOrder.addSaleOrderProducts(saleOrderProducts);
		}

		// lưu vào cơ sở dữ liệu
		saleOrderService.saveOrUpdate(saleOrder);

		// xóa dữ liệu giỏ hàng trong session
		session.setAttribute("cart", null);
		session.setAttribute("totalItems", "0");
		return "redirect:/index";
	}

	@RequestMapping(value = { "/cart" }, method = RequestMethod.GET)
	public String cartView(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		return "khachhang/cart";
	}
	
	@RequestMapping(value = { "/product/{productSeo}" }, method = RequestMethod.GET)
	public String productDetails(final Model model, final HttpServletRequest request, final HttpServletResponse response,
			@PathVariable("productSeo") String productSeo)
			throws IOException {

		ProductSearchModel searchModel = new ProductSearchModel();
		searchModel.seo = productSeo;

		PagerData<Products> products = productService.search(searchModel);
		Products product = products.getData().get(0);
		
		model.addAttribute("product", product);
	
		return "khachhang/product_detail";
		
	}

	@RequestMapping(value = { "/cart/delivery" }, method = RequestMethod.GET)
	public String cartDelivery(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		return "khachhang/delivery";
	}
	
//	@RequestMapping(value = { "/ajax/deleteProduct" }, method = RequestMethod.POST)
//	public ResponseEntity<Map<String, Object>> ajax_deleteProduct(final Model model,
//			final HttpServletRequest request, final HttpServletResponse response,
//			final @RequestBody CartItem cartItem) {
//
//		// để lấy session sử dụng thông qua request
//		// session tương tự như kiểu Map và được lưu trên main memory.
//		HttpSession session = request.getSession();
//
//		// Lấy thông tin giỏ hàng.
//		Cart cart = null;
//		// kiểm tra xem session có tồn tại đối tượng nào tên là "cart"
//		if (session.getAttribute("cart") != null) {
//			cart = (Cart) session.getAttribute("cart");
//		} else {
//			cart = new Cart();
//			session.setAttribute("cart", cart);
//		}
//		// Lấy danh sách sản phẩm có trong giỏ hàng
//		List<CartItem> cartItems = cart.getCartItems();
//		for (CartItem item : cartItems) {
//			if (item.getProductId() == cartItem.getProductId()) {				
//				cart.getCartItems().remove(item);
//			}
//		}
//		session.setAttribute("cart", cart);
//		cartItems = cart.getCartItems();
//		// trả về kết quả
//		Map<String, Object> jsonResult = new HashMap<String, Object>();
//		jsonResult.put("code", 200);
//		jsonResult.put("status", "TC");
//		jsonResult.put("message", "Xóa sản phẩm thành công!");
//		return ResponseEntity.ok(jsonResult);
//	}

	@RequestMapping(value = { "/ajax/reduceProductQuantity" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_ReduceProductQuantity(final Model model,
			final HttpServletRequest request, final HttpServletResponse response,
			final @RequestBody CartItem cartItem) {

		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng.
		Cart cart = null;
		// kiểm tra xem session có tồn tại đối tượng nào tên là "cart"
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		// kiểm tra nếu có trong giỏ hàng thì tăng số lượng

		int curentProductQuantity = 0;
		for (CartItem item : cartItems) {
			if (item.getProductId() == cartItem.getProductId()) {
				curentProductQuantity = item.getQuantity() - 1;
				if (curentProductQuantity >= 1) {
					item.setQuantity(curentProductQuantity);
				}else {
					item.setQuantity(1);
					
				}
			}
		}
		// tính tổng tiền
		this.calculateTotalPrice(request);

		// trả về kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		jsonResult.put("totalPrice", cart.getTotalPrice());
		jsonResult.put("curentProductQuantity", curentProductQuantity);

		session.setAttribute("totalItems", getTotalItems(request));
		return ResponseEntity.ok(jsonResult);
	}

	@RequestMapping(value = { "/ajax/updateProductQuantity" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_UpdateProductQuantity(final Model model,
			final HttpServletRequest request, final HttpServletResponse response,
			final @RequestBody CartItem cartItem) {

		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng.
		Cart cart = null;
		// kiểm tra xem session có tồn tại đối tượng nào tên là "cart"
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		// kiểm tra nếu có trong giỏ hàng thì tăng số lượng

		int curentProductQuantity = 0;
		for (CartItem item : cartItems) {
			if (item.getProductId() == cartItem.getProductId()) {
				curentProductQuantity = item.getQuantity() + 1;
				item.setQuantity(curentProductQuantity);
			}
		}
		// tính tổng tiền
		this.calculateTotalPrice(request);

		// trả về kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		jsonResult.put("totalPrice", cart.getTotalPrice());
		jsonResult.put("curentProductQuantity", curentProductQuantity);

		session.setAttribute("totalItems", getTotalItems(request));
		return ResponseEntity.ok(jsonResult);
	}

	@RequestMapping(value = { "/ajax/addToCart" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_AddToCart(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody CartItem cartItem) {

		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng.
		Cart cart = null;
		// kiểm tra xem session có tồn tại đối tượng nào tên là "cart"
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		// kiểm tra nếu có trong giỏ hàng thì tăng số lượng
		boolean isExists = false;
		for (CartItem item : cartItems) {
			if (item.getProductId() == cartItem.getProductId()) {
				isExists = true;
				item.setQuantity(item.getQuantity() + cartItem.getQuantity());
			}
		}

		// nếu sản phẩm chưa có trong giỏ hàng
		if (!isExists) {
			Products productInDb = productService.getById(cartItem.getProductId());

			cartItem.setProductName(productInDb.getTitle());
			cartItem.setPriceUnit(productInDb.getPrice());
			cartItem.setAvatar(productInDb.getAvatar());
			
			cart.getCartItems().add(cartItem);
		}

		// tính tổng tiền
		this.calculateTotalPrice(request);

		// trả về kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalProducts", getTotalProducts(request));
		jsonResult.put("totalItems", getTotalItems(request));	

		session.setAttribute("totalItems", getTotalItems(request));
		session.setAttribute("totalProducts",getTotalProducts(request));
		return ResponseEntity.ok(jsonResult);
	}

	private int getTotalItems(final HttpServletRequest request) {
		HttpSession httpSession = request.getSession();

		if (httpSession.getAttribute("cart") == null) {
			return 0;
		}

		Cart cart = (Cart) httpSession.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();

		int total = 0;
		for (CartItem item : cartItems) {
			total += item.getQuantity();
		}

		return total;
	}
	
	
	private int getTotalProducts(final HttpServletRequest request) {
		HttpSession httpSession = request.getSession();

		if (httpSession.getAttribute("cart") == null) {
			return 0;
		}

		Cart cart = (Cart) httpSession.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();

		int total = cartItems.size();
	
		return total;
	}

	private void calculateTotalPrice(final HttpServletRequest request) {

		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng.
		Cart cart = null;
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();
		BigDecimal total = BigDecimal.ZERO;

		for (CartItem ci : cartItems) {
			total = total.add(ci.getPriceUnit().multiply(BigDecimal.valueOf(ci.getQuantity())));
		}

		cart.setTotalPrice(total);
	}
}
