package com.devpro.shop16.services;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.shop16.dto.CategorySearchModel;
import com.devpro.shop16.dto.ProductSearchModel;
import com.devpro.shop16.entities.Categories;
import com.devpro.shop16.entities.ProductImages;
import com.devpro.shop16.entities.Products;
import com.github.slugify.Slugify;

@Service
public class CategoriesService extends BaseService<Categories> {

	
	@Override
	protected Class<Categories> clazz() {
		return Categories.class;
	}
	
	public PagerData<Categories> search(CategorySearchModel searchModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_category p WHERE 1=1";

		if (searchModel != null) {
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
				sql += " and (p.name like '%" + searchModel.keyword + "%'" 
							+ " or p.seo like '%" + searchModel.keyword + "%')";
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
	public Categories add(Categories p)
			throws IllegalStateException, IOException {

		//tạo seo
		p.setSeo(new Slugify().slugify(p.getName()));
		
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
	public Categories update(Categories p)
			throws IllegalStateException, IOException {

		// lấy thông tin cũ của product theo id
		Categories categoryInDb = super.getById(p.getId());
		
		
		p.setParent(categoryInDb.getParent());
		
		//tạo seo
		p.setSeo(new Slugify().slugify(p.getName()));
		
		// lưu vào database
		return super.saveOrUpdate(p);
	}
	
}
