package com.manhuaweb.service;

import java.util.List;

import com.manhuaweb.model.UserModel;

public interface IUserService {
	UserModel findUsername(String userName);
	UserModel save(UserModel userModel);
	void delete(long[] ids);
	List<UserModel> findAll();
	int getTotalItem();
	UserModel findOne(long id);
	boolean checkUsername(UserModel userModel);
}
