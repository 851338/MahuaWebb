package com.laptrinhjavaweb.dao;

import com.laptrinhjavaweb.model.UserModel;

public interface IUserDAO extends GenericDAO<UserModel> {
	UserModel findUsername(String userName);
	long save(UserModel userModel);
}
