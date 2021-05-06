package com.manhuaweb.service.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import com.manhuaweb.dbcon.IRoleDBCon;
import com.manhuaweb.dbcon.IUserDBCon;
import com.manhuaweb.model.RoleModel;
import com.manhuaweb.model.UserModel;
import com.manhuaweb.service.IUserService;

public class UserService implements IUserService {

	@Inject
	private IRoleDBCon roleDBCon;

	@Inject
	private IUserDBCon userDBCon;

	@Override
	public int getTotalItem() {
		return userDBCon.getTotalItem();
	}

	@Override
	public List<UserModel> findAll() {
		return userDBCon.findAll();
	}

	@Override
	public UserModel findUsername(String userName) {
		return userDBCon.findUsername(userName);
	}

	@Override
	public UserModel save(UserModel userModel) {
		userModel.setCreatedDate(new Timestamp(System.currentTimeMillis()));
		Long userId = userDBCon.save(userModel);
		return userDBCon.findOne(userId);
	}

	@Override
	public void delete(long[] ids) {
		for (long id : ids) {
			userDBCon.delete(id);
		}
	}

	@Override
	public UserModel findOne(long id) {
		UserModel userModel = userDBCon.findOne(id);
		RoleModel roleModel = roleDBCon.findOne(userModel.getRoleId());
		userModel.setRoleCode(roleModel.getCode());
		return userModel;
	}
	
	@Override
	public boolean checkUsername(UserModel userModel) {
		List<UserModel> all = userDBCon.findAll();
		for(int i=0;i<all.size();i++) 
			if(userModel.getUserName().equals(all.get(i).getUserName()))
				return false;
		return true;
	}
}
