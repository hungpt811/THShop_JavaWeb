package com.devpro.shop16.components;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

import com.devpro.shop16.entities.Categories;
import com.devpro.shop16.entities.Products;
import com.devpro.shop16.services.CategoriesService;
import com.github.slugify.Slugify;
@Component
public class ApplicationStartup implements ApplicationListener<ApplicationEvent> {

	@Autowired // inject 1 bean vào trong 1 bean khác
	private CategoriesService categoriesService;
	
	/*
	 * Khi ưng dụng chạy xong sẽ chạy vào hàm này
	 */
	
	@Override
	public void onApplicationEvent(final ApplicationEvent event) {
//		System.out.println("Begin");
		this.seedNikeCategory();
//		System.out.println("End");
	}

	private void seedNikeCategory() {
//		Kiểm tra xem đã có nike trong bảng tbl_category hay chưa?
		Categories nikeCate = categoriesService.getOneByNativeSQL("SELECT * FROM tbl_category WHERE name = 'nike'");
		
//		Nếu không có thì thêm mới
		if(nikeCate == null) {
			// tạo mới
			nikeCate = new Categories();
			nikeCate.setName("nike");			
			
			// thêm danh sách sản phẩm cho nike cate
			for (int i = 0; i < 3; i++) {
				Products p = new Products();
				p.setTitle("Nike Title "+ i);
				p.setShortDes("Nike ShortDes "+ i);
				p.setDetailDes("Nike DetailsDes "+ i);
				p.setPrice(new BigDecimal("1000"));
				p.setCreatedDate(new Date());
				
				// gọi hàm utility trong onetomany
				nikeCate.addProduct(p);
			}
			// ngược lại chỉnh sửa ngày
			
		}else {
			nikeCate.setUpdatedDate(new Date());
			nikeCate.setSeo(new Slugify().slugify("giay nike-" + System.currentTimeMillis()));
		}
		
		categoriesService.saveOrUpdate(nikeCate);
	}
	
	
}
