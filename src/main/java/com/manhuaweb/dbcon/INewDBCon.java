package com.manhuaweb.dbcon;

import java.util.List;

import com.manhuaweb.model.NewModel;
import com.manhuaweb.paging.Pageble;

public interface INewDBCon extends GenericDBCon<NewModel> {
	List<NewModel> findAllNewAndCat();
	NewModel findOne(Long id);
	List<NewModel> findByCategoryId(Long categoryId);
	Long save(NewModel newModel);
	void update(NewModel updateNew);
	void updateRating(NewModel updateRating);
	void delete(long id);
	List<NewModel> findAll(Pageble pageble);
	int getTotalItem();
	List<NewModel> findAll();
	List<NewModel> findAllBxh();
}