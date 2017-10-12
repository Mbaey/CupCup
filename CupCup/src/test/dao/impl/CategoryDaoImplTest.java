package dao.impl;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.util.List;

import org.junit.Test;

import bean.Category;
import bean.Movie;
import dao.CategoryDao;

public class CategoryDaoImplTest {
	private static CategoryDao categoryDao = new CategoryDaoImpl();
	@Test
	public void testInsertCate() throws SQLException {
		Category category = new Category("¹þ¹þ", 10);
		categoryDao.insertCate(category);
	}

	@Test
	public void testSelectAllCateOrderByLevel() throws SQLException {
		List<Category> categorys = categoryDao.selectAllCateOrderByLevel();
		categorys.
		forEach(i -> System.out.println(i));
	}


}
