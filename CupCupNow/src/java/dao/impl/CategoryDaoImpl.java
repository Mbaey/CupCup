package dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import utils.JDBCUtils;
import bean.Category;
import dao.CategoryDao;

public class CategoryDaoImpl implements CategoryDao{

	@Override
	public int insertCate(Category cate) throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());

		String sql = "insert into category (name ,level) values (?, ?) ";

		return qr.update(sql, cate.getName(), cate.getLevel());
	}

	@Override
	public List<Category> selectAllCateOrderByLevel() throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());

		String sql = "select * from category order by level DESC";

		return qr.query(sql, new BeanListHandler<Category>(Category.class));
	}

	

}
