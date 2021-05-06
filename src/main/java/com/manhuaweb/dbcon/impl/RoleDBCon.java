package com.manhuaweb.dbcon.impl;

import java.util.List;

import com.manhuaweb.dbcon.IRoleDBCon;
import com.manhuaweb.mapper.RoleMapper;
import com.manhuaweb.model.RoleModel;

public class RoleDBCon extends AbstractDBCon<RoleModel> implements IRoleDBCon {

	@Override
	public List<RoleModel> findAll() {
		String sql = "SELECT * FROM role";
		return query(sql, new RoleMapper());
	}

	@Override
	public RoleModel findOne(long id) {
		String sql = "SELECT * FROM role WHERE id = ?";
		List<RoleModel> Role = query(sql, new RoleMapper(), id);
		return Role.isEmpty() ? null : Role.get(0);
	}

    @Override
    public RoleModel findOneByCode(String code) {
		String sql = "SELECT * FROM Role WHERE code = ?";
		List<RoleModel> Role = query(sql, new RoleMapper(), code);
		return Role.isEmpty() ? null : Role.get(0);
    }

}
