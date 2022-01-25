package com.devpro.shop16.services;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.shop16.dto.ContactSearchModel;
import com.devpro.shop16.dto.UserSearchModel;
import com.devpro.shop16.entities.Contact;
import com.devpro.shop16.entities.ProductImages;
import com.devpro.shop16.entities.Products;
import com.devpro.shop16.entities.Roles;
import com.devpro.shop16.entities.Users;
import com.github.slugify.Slugify;


@Service
public class UsersService extends BaseService<Users> {
	
	@Override
	protected Class<Users> clazz() {
		return Users.class;
	}
	

	public Users loadUserByUsername(String userName) {
		String sql = "select * from tbl_users u where u.username = '" + userName + "'";
		List<Users> users = this.executeByNativeSQL(sql, 0).getData();
		
		if(users == null || users.size() <= 0) return null;
		return users.get(0);
	}
	
	public PagerData<Users> search_user(UserSearchModel searchModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM ((tbl_users as u inner join tbl_users_roles as ur on u.id = ur.user_id) "
				+ "inner join tbl_roles as r on r.id = ur.role_id) where r.name = 'GUEST'";

		if (searchModel != null) {
		
			// tim kiem san pham theo seachText
			if (!StringUtils.isEmpty(searchModel.keyword)) {
				sql += " and (u.fullname like '%" + searchModel.keyword + "%'" + " or u.username like '%"
						+ searchModel.keyword + "%'" + " or u.email like '%" + searchModel.keyword + "%'" 
						+ " or u.phonenumber like '%" + searchModel.keyword + "%'" + " or u.address like '%"
								+ searchModel.keyword + "%')";
			}
		}

		// chi lay san pham chua xoa
//				sql += " and p.status=1 ";
		return executeByNativeSQL(sql, searchModel == null ? 0 : searchModel.getPage());
		
	}
	
	public PagerData<Users> search_admin(UserSearchModel searchModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM ((tbl_users as u inner join tbl_users_roles as ur on u.id = ur.user_id) "
				+ "inner join tbl_roles as r on r.id = ur.role_id) where r.name = 'ADMIN'";

		if (searchModel != null) {
		
			// tim kiem san pham theo seachText
			if (!StringUtils.isEmpty(searchModel.keyword)) {
				sql += " and (u.fullname like '%" + searchModel.keyword + "%'" + " or u.username like '%"
						+ searchModel.keyword + "%'" + " or u.email like '%" + searchModel.keyword + "%'" 
						+ " or u.phonenumber like '%" + searchModel.keyword + "%'" + " or u.address like '%"
								+ searchModel.keyword + "%')";
			}
		}

		// chi lay san pham chua xoa
//				sql += " and p.status=1 ";
		return executeByNativeSQL(sql, searchModel == null ? 0 : searchModel.getPage());
		
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
	public Users update(Users p)
			throws IllegalStateException, IOException {

		// lấy thông tin cũ của product theo id
		Users userInDb = super.getById(p.getId());
		
		
		userInDb.setFullname(p.getFullname());
		userInDb.setEmail(p.getEmail());
		userInDb.setAddress(p.getAddress());
		userInDb.setPhonenumber(p.getPhonenumber());
		
		// lưu vào database
		return super.saveOrUpdate(userInDb);
	}
	
	
	
	
}
