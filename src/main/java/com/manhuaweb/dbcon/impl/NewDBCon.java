package com.manhuaweb.dbcon.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.manhuaweb.dbcon.INewDBCon;
import com.manhuaweb.mapper.NewMapper;
import com.manhuaweb.mapper.NewMapper1;
import com.manhuaweb.model.NewModel;
import com.manhuaweb.paging.Pageble;

public class NewDBCon extends AbstractDBCon<NewModel> implements INewDBCon {
	
	@Override
	public List<NewModel> findByCategoryId(Long categoryId) {
		String sql = "SELECT * FROM manhua WHERE categoryid = ?";
		return query(sql, new NewMapper(), categoryId);
	}

	@Override
	public Long save(NewModel newModel) {
		StringBuilder sql = new StringBuilder("INSERT INTO manhua (name, imgUrl,");
		sql.append(" author, publisher, categoryid, content, createddate, createdby)");
		sql.append(" VALUES(?, ?, ?, ?, ?, ?, ?, ?)");
		return insert(sql.toString(), newModel.getName(), newModel.getImgUrl(), 
				newModel.getAuthor(), newModel.getPublisher(), newModel.getCategoryId(), newModel.getContent(),
				newModel.getCreatedDate(), newModel.getCreatedBy());
	}
		
	@Override
	public List<NewModel> findAllNewAndCat() {
		StringBuilder sql = new StringBuilder("SELECT * FROM manhua AS m");
		sql.append(" INNER JOIN category AS c ON c.id = m.categoryId");
		return query(sql.toString(), new NewMapper1() );
	}
	
	@Override
	public NewModel findOne(Long id) {
		String sql = "SELECT * FROM manhua WHERE id = ?";
		List<NewModel> news = query(sql, new NewMapper(), id);
		return news.isEmpty() ? null : news.get(0);
	}

	@Override
	public void update(NewModel updateNew) {
		StringBuilder sql = new StringBuilder("UPDATE manhua SET name = ?, imgUrl = ?,");
		sql.append(" author = ?, publisher = ?, categoryid = ?, content = ?,");
		sql.append(" createddate = ?, createdby = ?, modifieddate = ?, modifiedby = ? WHERE id = ?");
		update(sql.toString(), updateNew.getName(), updateNew.getImgUrl(), updateNew.getAuthor(),
				updateNew.getPublisher(), updateNew.getCategoryId(), updateNew.getContent(), updateNew.getCreatedDate(), 
				updateNew.getCreatedBy(), updateNew.getModifiedDate(), 
				updateNew.getModifiedBy(), updateNew.getId());
	}
	
	@Override
	public void updateRating(NewModel updateRating) {
		StringBuilder sql = new StringBuilder("UPDATE manhua SET rating = ? WHERE id = ?");
		update(sql.toString(),updateRating.getRating(), updateRating.getId());
	}

	@Override
	public void delete(long id) {
		String sql = "DELETE FROM manhua WHERE id = ?";
		update(sql, id);
	}

	@Override
	public List<NewModel> findAll(Pageble pageble) {
		StringBuilder sql = new StringBuilder("SELECT * FROM manhua");
		if (pageble.getSorter() != null && StringUtils.isNotBlank(pageble.getSorter().getSortName()) && StringUtils.isNotBlank(pageble.getSorter().getSortBy())) {
			sql.append(" ORDER BY "+pageble.getSorter().getSortName()+" "+pageble.getSorter().getSortBy()+"");
		}
		if (pageble.getOffset() != null && pageble.getLimit() != null) {
			sql.append(" LIMIT "+pageble.getOffset()+", "+pageble.getLimit()+"");
		}
		return query(sql.toString(), new NewMapper());
	}

	@Override
	public int getTotalItem() {
		String sql = "SELECT count(*) FROM manhua";
		return count(sql);
	}

	@Override
	public List<NewModel> findAll() {
		String sql = "SELECT * FROM manhua";
		return query(sql,new NewMapper());
	}

	@Override
	public List<NewModel> findAllBxh() {
		String sql = "SELECT * FROM manhua ORDER BY rating DESC";
		return query(sql,new NewMapper());
	}
}
