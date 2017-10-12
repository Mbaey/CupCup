package dao.impl;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.junit.Test;

import bean.User;
import dao.UserDao;

public class UserDaoImplTest {

	@Test
	public void testInsertUser() throws SQLException {
		UserDao userDao = new UserDaoImpl();
		User user = new User("Li", "1234", "aa@qq.com", new Timestamp(new Date().getTime()));
		
		int res = userDao.insertUser(user);
		System.out.println(res);
	}

	@Test
	public void testUpdateUser() throws SQLException {
		UserDao userDao = new UserDaoImpl();
		User user = new User("Maybe", "1234", "aa@qq.com", new Timestamp(new Date().getTime()));
		user.setU_id(1);
		int res = userDao.updateUser(user);
		System.out.println(res);
	}

	@Test
	public void testDeleteUserByu_name() throws SQLException {
		UserDao userDao = new UserDaoImpl();
		int res = userDao.deleteUserByu_name("Li");
		System.out.println(res);
	}

	@Test
	public void testSelectUserByu_name() throws SQLException {
		UserDao userDao = new UserDaoImpl();
		User res = userDao.selectUserByu_name("Li");
		System.out.println(res);
	}

	@Test
	public void testSelectAllUser() throws SQLException {
		UserDao userDao = new UserDaoImpl();
	}

}
