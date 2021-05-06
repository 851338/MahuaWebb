package com.manhuaweb.dbcon;

import java.util.List;

import com.manhuaweb.model.UserModel;

public interface IUserDBCon extends GenericDBCon<UserModel> {
	UserModel findUsername(String userName);
	void delete(long id);
	int getTotalItem();
	List<UserModel> findAll();
	UserModel findOne(Long id);
	long save(UserModel userModel);
}
