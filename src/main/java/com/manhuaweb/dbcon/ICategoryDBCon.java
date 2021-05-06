package com.manhuaweb.dbcon;

import java.util.List;

import com.manhuaweb.model.CategoryModel;

public interface ICategoryDBCon extends GenericDBCon<CategoryModel> {
	List<CategoryModel> findAll();
	CategoryModel findOne(long id);
	CategoryModel findOneByCode(String code);
}
