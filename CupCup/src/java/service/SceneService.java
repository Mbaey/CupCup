package service;

import java.sql.SQLException;
import java.util.List;

import bean.Scene;

public interface SceneService {
	int insertScene(Scene scene) throws SQLException;
	/**
	 * ͨ��excel����������scenes
	 * @param scenes
	 * @return
	 * @throws SQLException
	 */
	int insertScene(List<Scene> scenes) throws SQLException;
	
	/**
	 * ��ҳ��
	 * ��ʾһ��Ӱ���ķ�ӳ��Ϣ
	 * @return
	 * @throws SQLException
	 */
	List<Scene> selectScenesWithhall_idOrderByTime(int page) throws SQLException;
	List<Scene> selectScenesWithhall_idOrderByid(int id) throws SQLException;
	long selectTotalsceneWithm_title() throws SQLException;
	List<Scene> selectScenes() throws SQLException;

}
