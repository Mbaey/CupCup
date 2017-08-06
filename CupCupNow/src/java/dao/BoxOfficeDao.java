package dao;

import java.sql.SQLException;
import java.util.List;

import bean.BoxOffice;

public interface BoxOfficeDao {
	/**
	 * 得到票房榜上
	 * 所有的信息
	 * @return
	 * @throws SQLException
	 */
	List<BoxOffice> selectAllBoxOffices()throws SQLException; 
}
