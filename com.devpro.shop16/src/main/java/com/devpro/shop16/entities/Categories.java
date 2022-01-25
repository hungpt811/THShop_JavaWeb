package com.devpro.shop16.entities;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity // để spring biết đây là 1 entity
@Table(name="tbl_category")   // báo cho spring-jpa biết mapping với table nào
public class Categories extends BaseEntity {
	@Column(name = "name", length = 100, nullable = false)
	private String name;
	
	@Column(name = "seo", length = 45, nullable = false)
	private String seo;
	
//	MappedBy là tên của property liên quan đến định nghĩa ManytoOne nào
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "categories", fetch = FetchType.LAZY)
	private Set<Products> products = new HashSet<Products>();
	
//	Khi định nghĩa OneToMany thì luôn luôn cần định nghĩa 2 hàm Utility
	public void addProduct(Products product) {
		this.products.add(product); // thêm product vào trong Set<Product>
		// product phải thuộc đối tượng category đang xét(đang call vào hàm này
		product.setCategories(this);
	}
	
	public void deleteProduct(Products product) {
		this.products.remove(product); // xóa product trong Set<Product>
		// product phải xóa khỏi đối tượng category đang xét(đang call vào hàm này
		product.setCategories(null);
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "parent_id")
	private Categories parent;
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "parent")
	private Set<Categories> childs = new HashSet<Categories>();
	public void addChild(Categories category) {
		this.childs.add(category);
		category.setParent(this);
	}
	public void deleteChild(Categories category) {
		this.childs.remove(category);
		category.setParent(null);
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public Set<Products> getProducts() {
		return products;
	}

	public void setProducts(Set<Products> products) {
		this.products = products;
	}

	public Categories getParent() {
		return parent;
	}

	public void setParent(Categories parent) {
		this.parent = parent;
	}

	public Set<Categories> getChilds() {
		return childs;
	}

	public void setChilds(Set<Categories> childs) {
		this.childs = childs;
	}
	
	
	
}
