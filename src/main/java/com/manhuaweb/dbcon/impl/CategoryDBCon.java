package com.manhuaweb.dbcon.impl;

import java.util.List;

import com.manhuaweb.dbcon.ICategoryDBCon;
import com.manhuaweb.mapper.CategoryMapper;
import com.manhuaweb.model.CategoryModel;

public class CategoryDBCon extends AbstractDBCon<CategoryModel> implements ICategoryDBCon {

	@Override
	public List<CategoryModel> findAll() {
		String sql = "SELECT * FROM category";
		return query(sql, new CategoryMapper());
	}

	@Override
	public CategoryModel findOne(long id) {
		String sql = "SELECT * FROM category WHERE id = ?";
		List<CategoryModel> category = query(sql, new CategoryMapper(), id);
		return category.isEmpty() ? null : category.get(0);
	}

    @Override
    public CategoryModel findOneByCode(String code) {
		String sql = "SELECT * FROM category WHERE code = ?";
		List<CategoryModel> category = query(sql, new CategoryMapper(), code);
		return category.isEmpty() ? null : category.get(0);
    }

}
