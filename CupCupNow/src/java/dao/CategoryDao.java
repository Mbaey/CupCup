package dao;

import java.sql.SQLException;
import java.util.List;

import bean.Category;
import bean.Movie;

public interface CategoryDao {

	/**
	 * a)	�����������Ʒ
	 * @param cate
	 * @return
	 */
	int insertCate(Category cate) throws SQLException;
	/**
	 * b)	�������е���𣬰���level����
	 * @return
	 */
	List<Category> selectAllCateOrderByLevel() throws SQLException;
	
	
}
