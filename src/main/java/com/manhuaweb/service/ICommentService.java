package com.manhuaweb.service;

import java.util.List;

import com.manhuaweb.model.CommentModel;

public interface ICommentService {
	void save(CommentModel CommentModel);
	List<CommentModel> findByNewId(Long newId);
}
