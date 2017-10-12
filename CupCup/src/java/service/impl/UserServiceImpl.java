package service.impl;

import java.sql.SQLException;
import java.util.List;

import service.UserService;
import bean.User;
import dao.UserDao;
import dao.impl.UserDaoImpl;


public class UserServiceImpl implements UserService {

	private UserDao userDao = new UserDaoImpl();
	
	@Override
	public int userRegit(User user) throws SQLException {
		return userDao.insertUser(user);
	}

	@Override
	public int updateUser(User user) throws SQLException {
		return userDao.updateUser(user);
	}

	@Override
	public int deleteUser(String u_name) throws SQLException {
		return userDao.deleteUserByu_name(u_name);
	}

	@Override
	public User selectUserByu_naem(String u_name) throws SQLException {
		return userDao.selectUserByu_name(u_name);
	}

	@Override
	public List<User> selectAllUser(int page) throws SQLException {
		return userDao.selectAllUser(page);
	}

	

}
