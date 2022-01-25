package com.devpro.shop16.entities;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;



@Entity
@Table(name = "tbl_products")
public class Products extends BaseEntity {
	@Column(name = "title", length = 100, nullable = false)
	private String title;
	@Column(name = "short_description", length = 3000, nullable = false)
	private String shortDes;
	@Column(name = "detail_description", length = 3000, nullable = false, columnDefinition = "LONGTEXT")
	private String detailDes;

	@Column(name = "price", precision = 13, scale = 2, nullable = false)
	private BigDecimal price;
	@Column(name = "seo", length = 1000, nullable = true)
	private String seo;
	@Column(name = "avatar", length = 200, nullable = true)
	private String avatar;
	
	@Column(name = "is_hot", nullable = true)
	private Boolean isHot = Boolean.FALSE;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id")	// định nghĩa khóa ngoại bằng @JoinColumn
	private Categories categories;
	
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "product", fetch = FetchType.LAZY)
	private Set<ProductImages> productImages = new HashSet<ProductImages>();
	
//	Khi định nghĩa OneToMany thì luôn luôn cần định nghĩa 2 hàm Utility
	public void addProductImages(ProductImages productImages) {
		this.productImages.add(productImages); 
		productImages.setProduct(this);;
	}
	
	public void deleteProductImages(ProductImages productImages) {
		this.productImages.remove(productImages); 		
		productImages.setProduct(null);;
	}
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getShortDes() {
		return shortDes;
	}

	public void setShortDes(String shortDes) {
		this.shortDes = shortDes;
	}

	public String getDetailDes() {
		return detailDes;
	}

	public void setDetailDes(String detailDes) {
		this.detailDes = detailDes;
	}


	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public Categories getCategories() {
		return categories;
	}

	public void setCategories(Categories categories) {
		this.categories = categories;
	}

	public Set<ProductImages> getProductImages() {
		return productImages;
	}

	public void setProductImages(Set<ProductImages> productImages) {
		this.productImages = productImages;
	}

	public Boolean getIsHot() {
		return isHot;
	}

	public void setIsHot(Boolean isHot) {
		this.isHot = isHot;
	}

}
