package com.laptrinhjavaweb.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.laptrinhjavaweb.model.NewModel;

public class NewMapper implements RowMapper<NewModel> {

	@Override
	public NewModel mapRow(ResultSet resultSet) {
		try {
			NewModel news = new NewModel();
			news.setId(resultSet.getLong("id"));
			news.setName(resultSet.getString("name"));
			news.setAuthor(resultSet.getString("author"));
			news.setPublisher(resultSet.getString("publisher"));
			news.setImgUrl(resultSet.getString("imgurl"));
			news.setType(resultSet.getString("type"));
			news.setCreatedDate(resultSet.getTimestamp("createddate"));
			news.setCreatedBy(resultSet.getString("createdby"));
			news.setContent(resultSet.getString("content"));
			if (resultSet.getTimestamp("modifieddate") != null) {
				news.setModifiedDate(resultSet.getTimestamp("modifieddate"));
			}
			if (resultSet.getString("modifiedby") != null) {
				news.setModifiedBy(resultSet.getString("modifiedby"));
			}
			return news;
		} catch (SQLException e) {
			return null;
		}	
	}
}
