package com.devpro.shop16.services;

import java.io.File;
import java.io.IOException;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.shop16.components.Utilities;
import com.devpro.shop16.dto.ProductSearchModel;
import com.devpro.shop16.entities.Products;

import com.devpro.shop16.entities.ProductImages;
import com.devpro.shop16.entities.Products;
import com.github.slugify.Slugify;

@Service
public class ProductsService extends BaseService<Products> {
	

	public String UPLOAD_FOLDER_ROOT = "F:/eclipse/eclipse-workspace/com.devpro.shop16/src/main/resources/upload/";
	
	@Autowired
	ProductImagesService productImagesService;
	

	
	@Override
	protected Class<Products> clazz() {
		return Products.class;
	}

	private boolean isEmptyUploadFile(MultipartFile[] images) {
		if (images == null || images.length <= 0)
			return true;

		if (images.length == 1 && images[0].getOriginalFilename().isEmpty())
			return true;

		return false;
	}

	private boolean isEmptyUploadFile(MultipartFile image) {
		return image == null || image.getOriginalFilename().isEmpty();
	}
	
	
	public PagerData<Products> search(ProductSearchModel searchModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_products p WHERE 1=1";

		if (searchModel != null) {
			// tìm kiếm theo category
			if(searchModel.categoryId != null && searchModel.categoryId > 0) {
				sql += " and category_id = " + searchModel.categoryId;
			}
		
			//tìm theo seo
			if (!StringUtils.isEmpty(searchModel.seo)) {
				sql += " and p.seo = '" + searchModel.seo + "'";
			}

			// tìm kiếm sản phẩm hot
			if (searchModel.isHot != null) {
//				sql += " and p.is_hot = '" + searchModel.seo + "'";
			}
			
			// tim kiem san pham theo seachText
			if (!StringUtils.isEmpty(searchModel.keyword)) {
				sql += " and (p.title like '%" + searchModel.keyword + "%'" + " or p.detail_description like '%"
						+ searchModel.keyword + "%'" + " or p.short_description like '%" + searchModel.keyword + "%')";
			}
		}

		// chi lay san pham chua xoa
//				sql += " and p.status=1 ";
		return executeByNativeSQL(sql, searchModel == null ? 0 : searchModel.getPage());
		
	}
	
	/**
	 * Dùng để thêm mới sản phẩm
	 * 
	 * @param p
	 * @param productAvatar
	 * @param productPictures
	 * @throws IOException
	 * @throws IllegalStateException
	 */
	@Transactional
	public Products add(Products p, MultipartFile productAvatar, MultipartFile[] productPictures)
			throws IllegalStateException, IOException {

		// kiểm tra xem admin có đẩy avatar lên không ???
		if (!isEmptyUploadFile(productAvatar)) {
			// tạo đường dẫn tới folder chứa avatar
			String pathToFile = UPLOAD_FOLDER_ROOT + "product/avatar/" + productAvatar.getOriginalFilename();

			// lưu avatar vào đường dẫn trên
			productAvatar.transferTo(new File(pathToFile));

			p.setAvatar("product/avatar/" + productAvatar.getOriginalFilename());
		}

		// có đẩy pictures(product_images) ???
		if (!isEmptyUploadFile(productPictures)) {

			// nếu admin đẩy lên thì duyệt tất cả file đẩy lên và lưu trên server
			for (MultipartFile pic : productPictures) {
				// lưu ảnh admin đẩy lên vào server
				pic.transferTo(new File(UPLOAD_FOLDER_ROOT + "product/pictures/" + pic.getOriginalFilename()));

				// tạo mới 1 bản ghi product_images
				ProductImages pi = new ProductImages();
				pi.setPath("product/pictures/" + pic.getOriginalFilename());
				pi.setTitle(pic.getOriginalFilename());

				p.addProductImages(pi);
			}
		}

		//tạo seo
		p.setSeo(new Slugify().slugify(p.getTitle()));
		
		// lưu vào database
		return super.saveOrUpdate(p);
	}

	/**
	 * Cập nhật sản phẩm
	 * 
	 * @param p
	 * @param productAvatar
	 * @param productPictures
	 * @throws IOException
	 * @throws IllegalStateException
	 */
	@Transactional
	public Products update(Products p, MultipartFile productAvatar, MultipartFile[] productPictures)
			throws IllegalStateException, IOException {

		// lấy thông tin cũ của product theo id
		Products productInDb = super.getById(p.getId());

		// có đẩy avartar ??? => xóa avatar cũ đi và thêm avatar mới
		if (!isEmptyUploadFile(productAvatar)) {
			// xóa avatar trong folder lên
			new File(UPLOAD_FOLDER_ROOT + productInDb.getAvatar()).delete();

			// add avartar moi
			productAvatar
					.transferTo(new File(UPLOAD_FOLDER_ROOT + "product/avatar/" + productAvatar.getOriginalFilename()));
			p.setAvatar("product/avatar/" + productAvatar.getOriginalFilename());
		} else {
			// su dung lai avatar cu
			p.setAvatar(productInDb.getAvatar());
		}

		// có đẩy pictures ???
		if (!isEmptyUploadFile(productPictures)) {

			// xóa pictures cũ
			if (productInDb.getProductImages() != null && productInDb.getProductImages().size() > 0) {
				for (ProductImages opi : productInDb.getProductImages()) {
					// xóa avatar trong folder lên
					new File(UPLOAD_FOLDER_ROOT + opi.getPath()).delete();

					// xóa dữ liệu trong database
					productImagesService.delete(opi);
				}
			}

			// thêm pictures mới
			for (MultipartFile pic : productPictures) {
				pic.transferTo(new File(UPLOAD_FOLDER_ROOT + "product/pictures/" + pic.getOriginalFilename()));

				ProductImages pi = new ProductImages();
				pi.setPath("product/pictures/" + pic.getOriginalFilename());
				pi.setTitle(pic.getOriginalFilename());

				p.addProductImages(pi);
			}
		}

		//tạo seo
		p.setSeo(new Slugify().slugify(p.getTitle()));
		
		// lưu vào database
		return super.saveOrUpdate(p);
	}
}
