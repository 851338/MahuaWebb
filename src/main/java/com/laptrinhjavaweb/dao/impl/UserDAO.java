package com.laptrinhjavaweb.dao.impl;

import java.util.List;

import com.laptrinhjavaweb.dao.IUserDAO;
import com.laptrinhjavaweb.mapper.UserMapper;
import com.laptrinhjavaweb.model.UserModel;

public class UserDAO extends AbstractDAO<UserModel> implements IUserDAO {

	@Override
	public UserModel findUsername(String userName) {
		StringBuilder sql = new StringBuilder("SELECT * FROM user AS u");
		sql.append(" INNER JOIN role AS r ON r.id = u.roleid");
		sql.append(" WHERE username = ?");
		List<UserModel> users = query(sql.toString(), new UserMapper(), userName);
		return users.isEmpty() ? null : users.get(0);
	}

	@Override
	public long save(UserModel userModel) {
		StringBuilder sql = new StringBuilder("INSERT INTO user (username, password,");
		sql.append(" fullname, createddate, roleid, status)");
		sql.append(" VALUES(?, ?, ?, ?, ?, ?)");
		return insert(sql.toString(), userModel.getUserName(), userModel.hashPassword(userModel.getPassword()),
				userModel.getFullName(), userModel.getCreatedDate(), 2, 1);
	}

}
