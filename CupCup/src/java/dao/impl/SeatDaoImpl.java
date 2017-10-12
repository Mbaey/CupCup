package dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.ColumnListHandler;

import utils.DBTools;
import utils.JDBCUtils;
import bean.Seat;
import dao.SeatDao;

public class SeatDaoImpl implements SeatDao{

	@Override
	public int insertSeat(int seat_num, int scene_id) throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		String sql = "insert into seat values(null,?, ?)";
		int res = qr.update(sql, scene_id, seat_num);
		return res;
	}

	@Override
	public List<Integer> selectSeat(int scene_id) throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		String sql = "select seat_num from seat where scene_id = ?";
		List<Integer> res = qr.query(sql, new ColumnListHandler<Integer>(), scene_id);
		return res;
	}

}
