package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.model.UserModel;

public interface IUserService {
	UserModel findUsername(String userName);
	void save(UserModel userModel);
}
