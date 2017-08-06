package dao;

import java.sql.SQLException;
import java.util.List;

import bean.Seat;

public interface SeatDao {
	/**
	 * 如果有人买了一张票，就插入
	 * @param user
	 * @return
	 * @throws SQLException
	 */
	int insertSeat(int seat_num, int scene_id) throws SQLException;
	
	/**
	 * 通过scene_id查找该场次所有被卖掉座位
	 * select seat_num from seat where scene_id = ?;
	 * 
	 * @param scene_id
	 * @param seat_num
	 * @return
	 * @throws SQLException
	 */
	List<Integer> selectSeat(int scene_id) throws SQLException;
	
	
	
}
