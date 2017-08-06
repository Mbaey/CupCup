package service;

import java.sql.SQLException;
import java.util.List;

import bean.Scene;

public interface SceneService {
	int insertScene(Scene scene) throws SQLException;
	/**
	 * 通过excel表连续插入scenes
	 * @param scenes
	 * @return
	 * @throws SQLException
	 */
	int insertScene(List<Scene> scenes) throws SQLException;
	
	/**
	 * 分页！
	 * 显示一个影厅的放映信息
	 * @return
	 * @throws SQLException
	 */
	List<Scene> selectScenesWithhall_idOrderByTime(int page) throws SQLException;
	List<Scene> selectScenesWithhall_idOrderByid(int id) throws SQLException;
	long selectTotalsceneWithm_title() throws SQLException;
	List<Scene> selectScenes() throws SQLException;

}
