package com.manhuaweb.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import com.manhuaweb.dbcon.ICategoryDBCon;
import com.manhuaweb.dbcon.INewDBCon;
import com.manhuaweb.model.CategoryModel;
import com.manhuaweb.model.NewModel;
import com.manhuaweb.paging.Pageble;
import com.manhuaweb.service.INewService;

public class NewService implements INewService {
	
	@Inject
	private INewDBCon newDBCon;

	@Inject
	private ICategoryDBCon categoryDBCon;

	@Override
	public List<NewModel> findByCategoryId(Long categoryId) {
		return newDBCon.findByCategoryId(categoryId);
	}

	@Override
	public NewModel save(NewModel newModel) {
		newModel.setCreatedDate(new Timestamp(System.currentTimeMillis()));
		CategoryModel category = categoryDBCon.findOneByCode(newModel.getCategoryCode());
		newModel.setCategoryId(category.getId());
		Long newId = newDBCon.save(newModel);
		return newDBCon.findOne(newId);
	}

	@Override
	public NewModel update(NewModel updateNew) {
		NewModel oldNew = newDBCon.findOne(updateNew.getId());
		updateNew.setCreatedDate(oldNew.getCreatedDate());
		updateNew.setCreatedBy(oldNew.getCreatedBy());
		updateNew.setModifiedDate(new Timestamp(System.currentTimeMillis()));
		CategoryModel category = categoryDBCon.findOneByCode(updateNew.getCategoryCode());
		updateNew.setCategoryId(category.getId());
		newDBCon.update(updateNew);
		return newDBCon.findOne(updateNew.getId());
	}
	
	@Override
	public void delete(long[] ids) {
		for (long id: ids) {
			//1.delete comment (khoa ngoai new_id)
			//2.delete news
			newDBCon.delete(id);
		}
	}

	@Override
	public List<NewModel> findAllNewAndCat() {
		return newDBCon.findAllNewAndCat();
	}
	
	@Override
	public List<NewModel> findAll(Pageble pageble) {
		return newDBCon.findAll(pageble);
	}

	@Override
	public int getTotalItem() {
		return newDBCon.getTotalItem();
	}

    @Override
    public NewModel findOne(long id) {
		NewModel newModel = newDBCon.findOne(id);
		CategoryModel categoryModel = categoryDBCon.findOne(newModel.getCategoryId());
		newModel.setCategoryCode(categoryModel.getCode());
        return newModel;
    }
    
    
	@Override
	public List<NewModel> findByName(String name) {
		// TODO Auto-generated method stub
		List<NewModel> all = newDBCon.findAll();
		List<NewModel> findName =  new ArrayList<>();
		String n = VNCharacterUtils.removeAccent(name);
		for(int i=0;i<all.size();i++) {
			if(VNCharacterUtils.removeAccent(all.get(i).getName().toLowerCase()).contains(n.toLowerCase())) {
				findName.add(all.get(i));
			}
		}
		return findName;
	}

	@Override
	public NewModel updateRating(NewModel updateRating) {
		newDBCon.updateRating(updateRating);
		return newDBCon.findOne(updateRating.getId());
	}

	@Override
	public List<NewModel> findAllBxh() {
		return newDBCon.findAllBxh();
	}

	@Override
	public List<NewModel> findAll() {
		return newDBCon.findAll();
	}

}
