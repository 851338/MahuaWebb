package com.manhuaweb.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.manhuaweb.model.CategoryModel;
import com.manhuaweb.model.NewModel;

public class NewMapper1 implements RowMapper<NewModel> {

	@Override
	public NewModel mapRow(ResultSet resultSet) {
		try {
			NewModel news = new NewModel();
			news.setId(resultSet.getLong("id"));
			news.setName(resultSet.getString("name"));
			news.setAuthor(resultSet.getString("author"));
			news.setPublisher(resultSet.getString("publisher"));
			news.setRating(resultSet.getLong("rating"));
			news.setImgUrl(resultSet.getString("imgurl"));
			news.setCategoryId(resultSet.getLong("categoryid"));
			news.setCreatedDate(resultSet.getTimestamp("createddate"));
			news.setCreatedBy(resultSet.getString("createdby"));
			news.setContent(resultSet.getString("content"));
			try {
				CategoryModel cate = new CategoryModel();
				cate.setCode(resultSet.getString("code"));
				cate.setName(resultSet.getString("name"));
				news.setCate(cate);
			} catch (Exception e) {
				System.out.print(e.getMessage());
			}
			return news;
		} catch (SQLException e) {
			return null;
		}	
	}
}
