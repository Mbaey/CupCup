package dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import utils.JDBCUtils;
import utils.MyConstant;
import bean.Scene;
import dao.SceneDao;

public class SceneDaoImpl implements SceneDao {

	@Override
	public int insertScene(Scene scene) throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		// m_id m_title s_time e_time type hall_id price

		String sql = "insert into scene(m_id, m_title, s_time, e_time, type, hall_id, price) values (?,?,?,?,?,?,?)";
		int res = qr.update(sql, scene.getM_id(), scene.getM_title(),
				scene.getS_time(), scene.getE_time(), scene.getType(),
				scene.getHall_id(), scene.getPrice());
		return res;
	}

	@Override
	public int insertScene(List<Scene> scenes) throws SQLException {

		return 0;
	}

	@Override
	public List<Scene> selectScenesWithhall_idOrderByTime(int page)
			throws SQLException {

		return null;
	}
	
	@Override
	public List<Scene> selectScenesWithhall_idOrderByid(int page)
			throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		String sql = "select * from scene limit ?,?";
		List<Scene> res = qr.query(sql, new BeanListHandler<Scene>(Scene.class), MyConstant.COMMENT_PAGE_SIZE * (page - 1), MyConstant.COMMENT_PAGE_SIZE);
		return res;
	}
	
	@Override
	public List<Scene> selectScenesWithScene_id(int id)
			throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		String sql = "select * from scene where m_id = ?";
		List<Scene> res = qr.query(sql, new BeanListHandler<Scene>(Scene.class), id);
		return res;
	}

	@Override
	public List<Scene> selectScenesWithhall_idOrderByTime(String name)
			throws SQLException {
		return null;
	}
	
	@Override
	public long selectTotalsceneWithm_title() throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		String sql = "select count(*) from scene ";
		 long res = qr.query(sql, new ScalarHandler<Long>());
		return res;
		
	}

	@Override
	public List<Scene> selectScenes() throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		String sql = "select * from scene ";
		List<Scene> res = qr.query(sql, new BeanListHandler<Scene>(Scene.class));
		return res;
	}


}
