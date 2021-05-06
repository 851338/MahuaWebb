package com.manhuaweb.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.manhuaweb.model.CommentModel;
import com.manhuaweb.model.NewModel;

public class CommentMapper implements RowMapper<CommentModel> {

	@Override
	public CommentModel mapRow(ResultSet resultSet) {
		try {
			CommentModel comments = new CommentModel();
			comments.setId(resultSet.getLong("id"));
			comments.setContent(resultSet.getString("content"));
			comments.setUserId(resultSet.getLong("id"));
			comments.setNewId(resultSet.getLong("id"));
			comments.setCreatedDate(resultSet.getTimestamp("createddate"));
			comments.setCreatedBy(resultSet.getString("createdby"));
			if (resultSet.getTimestamp("modifieddate") != null) {
				comments.setModifiedDate(resultSet.getTimestamp("modifieddate"));
			}
			if (resultSet.getString("modifiedby") != null) {
				comments.setModifiedBy(resultSet.getString("modifiedby"));
			}
			return comments;
		} catch (SQLException e) {
			return null;
		}	
	}

}
