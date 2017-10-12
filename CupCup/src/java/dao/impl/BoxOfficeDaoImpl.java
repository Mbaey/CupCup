package dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import utils.JDBCUtils;
import bean.BoxOffice;
import bean.Comment;
import dao.BoxOfficeDao;

public class BoxOfficeDaoImpl implements BoxOfficeDao{

	@Override
	public List<BoxOffice> selectAllBoxOffices() throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		String sql = "select * from boxOffice";
		return qr.query(sql, new BeanListHandler<BoxOffice>(BoxOffice.class));
	}

}
