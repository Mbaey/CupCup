package dao;

import java.sql.SQLException;
import java.util.List;

import bean.User;

public interface UserDao {
	int insertUser(User user) throws SQLException;
	int updateUser(User user) throws SQLException;
	int deleteUserByu_name(String u_name) throws SQLException;
	
	/**
	 * ��д��ôЩ�ӿڣ����������ټ�
	 * @param u_name
	 * @return
	 * @throws SQLException
	 */
	User selectUserByu_name(String u_name) throws SQLException;
	
	/**
	 * ��ҳ�ҳ������û�
	 * @return
	 * @throws SQLException
	 */
	List<User> selectAllUser(int page) throws SQLException;
}
