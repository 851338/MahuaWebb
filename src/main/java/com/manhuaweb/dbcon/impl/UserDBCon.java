package com.manhuaweb.dbcon.impl;

import java.util.List;

import com.manhuaweb.dbcon.IUserDBCon;
import com.manhuaweb.mapper.UserMapper;
import com.manhuaweb.mapper.UserMapper1;
import com.manhuaweb.model.UserModel;

public class UserDBCon extends AbstractDBCon<UserModel> implements IUserDBCon {

	@Override
	public UserModel findUsername(String userName) {
		StringBuilder sql = new StringBuilder("SELECT * FROM user AS u");
		sql.append(" INNER JOIN role AS r ON r.id = u.roleid");
		sql.append(" WHERE username = ?");
		List<UserModel> users = query(sql.toString(), new UserMapper(), userName);
		return users.isEmpty() ? null : users.get(0);
	}

	@Override
	public void delete(long id){
		String sql = "DELETE FROM user WHERE id = ?";
		update(sql, id);
	}
	
	@Override
	public int getTotalItem() {
		String sql = "SELECT count(*) FROM user";
		return count(sql);
	}
	
	@Override
	public List<UserModel> findAll() {
		StringBuilder sql = new StringBuilder("SELECT * FROM user");
		return query(sql.toString(), new UserMapper1());
	}
	
	@Override
	public UserModel findOne(Long id) {
		String sql = "SELECT * FROM user WHERE id = ?";
		List<UserModel> users = query(sql, new UserMapper1(), id);
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
