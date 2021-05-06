package com.manhuaweb.service.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import com.manhuaweb.dbcon.ICommentDBCon;
import com.manhuaweb.model.CommentModel;
import com.manhuaweb.service.ICommentService;

public class CommentService implements ICommentService{
	
	@Inject
	private ICommentDBCon CommentDBCon;

	@Override
	public void save(CommentModel CommentModel) {
		CommentModel.setCreatedDate(new Timestamp(System.currentTimeMillis()));
		Long CommentId = CommentDBCon.save(CommentModel);
	}

	@Override
	public List<CommentModel> findByNewId(Long newId) {
		return CommentDBCon.findByNewId(newId);
	}
}
