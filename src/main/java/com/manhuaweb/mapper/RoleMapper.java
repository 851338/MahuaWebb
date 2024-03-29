package com.manhuaweb.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.manhuaweb.model.RoleModel;

public class RoleMapper implements RowMapper<RoleModel> {

	@Override
	public RoleModel mapRow(ResultSet resultSet) {
		try {
			RoleModel role = new RoleModel();
			role.setId(resultSet.getLong("id"));
			role.setCode(resultSet.getString("code"));
			role.setName(resultSet.getString("name"));
			return role;
		} catch (SQLException e) {
			return null;
		}
	}
}
