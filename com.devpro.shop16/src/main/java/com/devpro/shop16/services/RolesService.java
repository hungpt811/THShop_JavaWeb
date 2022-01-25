package com.devpro.shop16.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.devpro.shop16.entities.Roles;
import com.devpro.shop16.entities.Users;
@Service
public class RolesService extends BaseService<Roles> {

	@Override
	protected Class<Roles> clazz() {
		return Roles.class;
	}
	
	public void addDedaultRole(Users u) {
		String sql = "SELECT * FROM tbl_roles where name = '" + "GUEST" + "'";
		List<Roles> roles = this.executeByNativeSQL(sql, 0).getData();
		u.addRoles(roles.get(0));
	}
}
