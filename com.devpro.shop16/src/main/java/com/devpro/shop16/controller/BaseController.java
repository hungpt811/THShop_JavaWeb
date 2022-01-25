package com.devpro.shop16.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.devpro.shop16.entities.Categories;
import com.devpro.shop16.entities.Products;
import com.devpro.shop16.entities.Users;
import com.devpro.shop16.services.CategoriesService;
import com.devpro.shop16.services.ProductsService;

public abstract class BaseController {
	@Autowired
	private CategoriesService categoriesService;
	
	@Autowired
	private ProductsService productsService ;
	
	@ModelAttribute("isLogined")
	public boolean isLogined() {
		boolean isLogined = false;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			isLogined = true;
		}
		return isLogined;
	}
	
	@ModelAttribute("userLogined")
	public Users getUserLogined() {
		Object userLogined = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(userLogined != null && userLogined instanceof UserDetails)
			return (Users) userLogined;
		
		return null;
	}
	@ModelAttribute("categories")
	public List<Categories> getAllCategories() {
		String sql = "SELECT * FROM tbl_category WHERE parent_id IS NULL";
		List<Categories> categoryParents = categoriesService.executeByNativeSQL(sql, 0).getData();
		return categoryParents;
	}

	@ModelAttribute("featuredProduct")
	public List<Products> getFeaturedProduct() {
		String sql = "SELECT * FROM tbl_products WHERE is_hot IS TRUE order by created_date desc limit 8";
		List<Products> featuredProduct = productsService.getByNativeSQL(sql);
		return featuredProduct;
	}
	
	
	@ModelAttribute("newestProduct")
	public List<Products> getNewestProduct() {
		String sql = "SELECT * FROM tbl_products order by created_date desc limit 8";
		List<Products> newestProduct = productsService.getByNativeSQL(sql);
		return newestProduct;
	}
	
	@ModelAttribute("relatedProduct")
	public List<Products> getRelatedProduct() {
		String sql = "SELECT * FROM tbl_products limit 3";
		List<Products> relatedProduct = productsService.getByNativeSQL(sql);
		return relatedProduct;
	}
	
	public int getCurrentPage(HttpServletRequest request) {
		try {
			return Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			return 1;
		}
	}

	public Integer getInteger(HttpServletRequest request, String paramName) {
		try {
			return Integer.parseInt(request.getParameter(paramName));
		} catch (Exception e) {
			return null;
		}
	}
}
