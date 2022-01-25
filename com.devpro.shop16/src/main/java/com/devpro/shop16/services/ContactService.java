package com.devpro.shop16.services;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.devpro.shop16.dto.CategorySearchModel;
import com.devpro.shop16.dto.ContactSearchModel;
import com.devpro.shop16.entities.Categories;
import com.devpro.shop16.entities.Contact;
@Service
public class ContactService extends BaseService<Contact> {

	@Override
	protected Class<Contact> clazz() {
		return Contact.class;
	}
	public PagerData<Contact> search(ContactSearchModel searchModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_contact p order by created_date desc";

		if (searchModel != null) {
		
			// tim kiem san pham theo seachText
			if (!StringUtils.isEmpty(searchModel.keyword)) {
				sql += " and (p.first_name like '%" + searchModel.keyword + "%'" + " or p.last_name like '%"
						+ searchModel.keyword + "%'" + " or p.email like '%" + searchModel.keyword + "%'" 
						+ " or p.message like '%" + searchModel.keyword + "%')";
			}
		}

		// chi lay san pham chua xoa
//				sql += " and p.status=1 ";
		return executeByNativeSQL(sql, searchModel == null ? 0 : searchModel.getPage());
		
	}
}
