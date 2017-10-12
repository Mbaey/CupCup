package service;

import java.sql.SQLException;
import java.util.List;

import bean.Category;

public interface CategoryService {
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
