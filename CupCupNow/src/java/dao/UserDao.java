package dao;

import java.sql.SQLException;
import java.util.List;

import bean.User;

public interface UserDao {
	int insertUser(User user) throws SQLException;
	int updateUser(User user) throws SQLException;
	int deleteUserByu_name(String u_name) throws SQLException;
	
	/**
	 * 先写这么些接口，有需求了再加
	 * @param u_name
	 * @return
	 * @throws SQLException
	 */
	User selectUserByu_name(String u_name) throws SQLException;
	
	/**
	 * 分页找出所有用户
	 * @return
	 * @throws SQLException
	 */
	List<User> selectAllUser(int page) throws SQLException;
}
