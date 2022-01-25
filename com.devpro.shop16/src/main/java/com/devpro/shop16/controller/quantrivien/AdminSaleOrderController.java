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

import com.devpro.shop16.controller.BaseController;
import com.devpro.shop16.dto.ShippingModel;
import com.devpro.shop16.entities.Products;
import com.devpro.shop16.entities.SaleOrder;
import com.devpro.shop16.services.PagerData;
import com.devpro.shop16.services.SaleOrderService;


@Controller
public class AdminSaleOrderController extends BaseController {
	@Autowired private SaleOrderService saleOrderService;
	@RequestMapping(value = { "/admin/shipping" }, method = RequestMethod.GET)
	public String shipping(final Model model, final HttpServletRequest request, final HttpServletResponse reponse)
			throws IOException {				
		ShippingModel searchModel = new ShippingModel();
		searchModel.keyword = request.getParameter("keyword");
		searchModel.setPage(getCurrentPage(request));
		
		model.addAttribute("shippingWithPaging", saleOrderService.search_shipping(searchModel));
		model.addAttribute("searchModel", searchModel);
		
		return "quantrivien/donhangdanggiao";
	}
	
	@RequestMapping(value = { "/admin/shipping/{orderID}" }, method = RequestMethod.GET)
	public String shipped(final Model model, final HttpServletRequest request, final HttpServletResponse reponse,
			@PathVariable("orderID") int orderID)
			throws IOException {		
		SaleOrder shipped = saleOrderService.getById(orderID);
		model.addAttribute("shipped", saleOrderService.update(shipped));
		
		return "redirect:/admin/shipping";
	}
	
	
	@RequestMapping(value = { "/admin/shipdetail/{orderCode}" }, method = RequestMethod.GET)
	public String shipDetail(final Model model, final HttpServletRequest request, final HttpServletResponse reponse,
			@PathVariable("orderCode") String orderCode)
			throws IOException {		
		SaleOrder shipDetail = saleOrderService.getShipDetail(orderCode);
		model.addAttribute("shipDetail", shipDetail);
		return "quantrivien/chitietdonhang";
	}
	
	
	@RequestMapping(value = { "/admin/shipped" }, method = RequestMethod.GET)
	public String shipped(final Model model, final HttpServletRequest request, final HttpServletResponse reponse)
			throws IOException {		
		ShippingModel searchModel = new ShippingModel();
		searchModel.keyword = request.getParameter("keyword");
		searchModel.setPage(getCurrentPage(request));
		
		model.addAttribute("shippingWithPaging", saleOrderService.search_shipped(searchModel));
		model.addAttribute("searchModel", searchModel);
		return "quantrivien/donhangdagiao";
	}
	
	@RequestMapping(value = { "/admin/delete/{shipId}" }, method = RequestMethod.GET)
	public String shipdelete(final Model model, final HttpServletRequest request, final HttpServletResponse reponse,
			@PathVariable("shipId") int shipId)
			throws IOException {		
		saleOrderService.deleteById(shipId);
		return "redirect:/admin/shipping";
	}

}
