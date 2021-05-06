package com.manhuaweb.service;

import java.util.List;

import com.manhuaweb.model.CategoryModel;

public interface ICategoryService {
	List<CategoryModel> findAll();
	CategoryModel findOne(long id);
}
