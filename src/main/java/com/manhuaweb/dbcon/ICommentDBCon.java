package com.manhuaweb.dbcon;

import java.util.List;

import com.manhuaweb.model.CommentModel;

public interface ICommentDBCon {
	Long save(CommentModel CommentModel);
	List<CommentModel> findByNewId(Long NewId);
}
