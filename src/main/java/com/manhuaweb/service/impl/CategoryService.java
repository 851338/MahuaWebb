package com.manhuaweb.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.manhuaweb.dbcon.ICategoryDBCon;
import com.manhuaweb.model.CategoryModel;
import com.manhuaweb.service.ICategoryService;

public class CategoryService implements ICategoryService {
	
	@Inject
	private ICategoryDBCon categoryDBCon;

	@Override
	public List<CategoryModel> findAll() {
		return categoryDBCon.findAll();
	}

	@Override
	public CategoryModel findOne(long id) {
		// TODO Auto-generated method stub
		return categoryDBCon.findOne(id);
	}
}
