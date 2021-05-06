package com.manhuaweb.dbcon;

import java.util.List;

import com.manhuaweb.mapper.RowMapper;

public interface GenericDBCon<T> {
	<T> List<T> query(String sql, RowMapper<T> rowMapper, Object... parameters);
	void update (String sql, Object... parameters);
	Long insert (String sql, Object... parameters);
	int count(String sql, Object... parameters);
}
