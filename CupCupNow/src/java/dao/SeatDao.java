package dao;

import java.sql.SQLException;
import java.util.List;

import bean.Seat;

public interface SeatDao {
	/**
	 * �����������һ��Ʊ���Ͳ���
	 * @param user
	 * @return
	 * @throws SQLException
	 */
	int insertSeat(int seat_num, int scene_id) throws SQLException;
	
	/**
	 * ͨ��scene_id���Ҹó������б�������λ
	 * select seat_num from seat where scene_id = ?;
	 * 
	 * @param scene_id
	 * @param seat_num
	 * @return
	 * @throws SQLException
	 */
	List<Integer> selectSeat(int scene_id) throws SQLException;
	
	
	
}
