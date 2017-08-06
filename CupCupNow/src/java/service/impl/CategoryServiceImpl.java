package service.impl;

import java.sql.SQLException;
import java.util.List;

import dao.CategoryDao;
import dao.impl.CategoryDaoImpl;
import bean.Category;
import service.CategoryService;

public class CategoryServiceImpl implements CategoryService{
	
	private CategoryDao categoryDao = new CategoryDaoImpl();
	@Override
	public int insertCate(Category cate) throws SQLException {
		return categoryDao.insertCate(cate);
	}

	@Override
	public List<Category> selectAllCateOrderByLevel() throws SQLException {
		return categoryDao.selectAllCateOrderByLevel();
	}

}
