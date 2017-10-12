package dao;

import java.sql.SQLException;
import java.util.List;

import bean.Category;
import bean.Movie;

public interface CategoryDao {

	/**
	 * a)	添加类别、添加商品
	 * @param cate
	 * @return
	 */
	int insertCate(Category cate) throws SQLException;
	/**
	 * b)	查找所有的类别，按照level排序
	 * @return
	 */
	List<Category> selectAllCateOrderByLevel() throws SQLException;
	
	
}
