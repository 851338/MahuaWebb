package com.manhuaweb.dbcon;

import java.util.List;

import com.manhuaweb.model.RoleModel;

public interface IRoleDBCon extends GenericDBCon<RoleModel> {
	List<RoleModel> findAll();
	RoleModel findOne(long id);
	RoleModel findOneByCode(String code);
}
