package com.laptrinhjavaweb.service.impl;

import java.sql.Timestamp;

import javax.inject.Inject;

import com.laptrinhjavaweb.dao.IUserDAO;
import com.laptrinhjavaweb.model.UserModel;
import com.laptrinhjavaweb.service.IUserService;

public class UserService implements IUserService {


	@Inject
	private IUserDAO userDAO;

	
	@Override
	public UserModel findUsername(String userName) {
		return userDAO.findUsername(userName);
	}
	
	@Override
	public void save(UserModel userModel){
		userModel.setCreatedDate(new Timestamp(System.currentTimeMillis()));
		userDAO.save(userModel);
	}
}
