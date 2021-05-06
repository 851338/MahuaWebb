package com.manhuaweb.dbcon.impl;

import java.util.List;

import com.manhuaweb.dbcon.ICommentDBCon;
import com.manhuaweb.mapper.CommentMapper;
import com.manhuaweb.model.CommentModel;
import com.manhuaweb.model.NewModel;

public class CommentDBCon extends AbstractDBCon<NewModel> implements ICommentDBCon{

	@Override
	public Long save(CommentModel commentModel) {
		StringBuilder sql = new StringBuilder("INSERT INTO comment (content, userId,");
		sql.append(" manhuaId,createddate, createdby)");
		sql.append(" VALUES(?, ?, ?, ?, ?)");
		return insert(sql.toString(), commentModel.getContent(), commentModel.getUserId(), 
				commentModel.getNewId(), commentModel.getCreatedDate(), commentModel.getCreatedBy());
	}

	@Override
	public List<CommentModel> findByNewId(Long NewId) {
		String sql = "SELECT * FROM comment WHERE manhuaid = ?";
		return query(sql, new CommentMapper(), NewId);
	}


}
