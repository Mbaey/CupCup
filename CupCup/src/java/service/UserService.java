package service;

import java.sql.SQLException;
import java.util.List;

import bean.User;

public interface UserService {
	int userRegit(User user) throws SQLException ;
	
	int updateUser(User user) throws SQLException ;
	int deleteUser(String u_name) throws SQLException ;
	
	User selectUserByu_naem(String u_name) throws SQLException ;
	List<User> selectAllUser(int page) throws SQLException ;
}
