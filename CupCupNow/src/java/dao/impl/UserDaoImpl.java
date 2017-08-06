package dao.impl;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import utils.JDBCUtils;
import utils.MyConstant;
import bean.User;
import dao.UserDao;

public class UserDaoImpl implements UserDao {

	@Override
	public int insertUser(User user) throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());

		String sql = "insert into user (u_name, pwd, email, start) values (?, ?, ?, ?)";
		int res = qr.update(sql, user.getU_name(), user.getPwd(),
				user.getEmail(), user.getStart());

		return res;
	}

	@Override
	public int updateUser(User user) throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());

		String sql = "update user set u_name=?, pwd=?, tel=?, email=?, sex=?, touxiang=? where u_id=?";
		int res = qr.update(sql, user.getU_name(), user.getPwd(),
				user.getTel(), user.getEmail(), user.getSex(),
				user.getTouxiang(), user.getU_id());

		return res;
	}

	@Override
	public int deleteUserByu_name(String u_name) throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());

		String sql = "delete from user where u_name=?";
		int res = qr.update(sql, u_name);

		return res;
	}

	@Override
	public User selectUserByu_name(String u_name) throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());

		String sql = "select * from user where u_name=?";
		return qr.query(sql, new BeanHandler<User>(User.class), u_name);
	}

	@Override
	public List<User> selectAllUser(int page) throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());

		String sql = "select * from user limit ?, ?";
		return qr.query(sql, new BeanListHandler<User>(User.class), MyConstant.PAGE_SIZE*(page-1), MyConstant.PAGE_SIZE);
	}



}
