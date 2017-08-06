package dao;

import java.sql.SQLException;
import java.util.List;

import bean.Comment;
import bean.Scene;

public interface SceneDao {
	/**
	 * һ��һ�����볡�ε���Ϣ
	 * @param scene
	 * @return
	 * @throws SQLException
	 */
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
	List<Scene> selectScenesWithScene_id(int id)throws SQLException; 
	
	List<Scene> selectScenesWithhall_idOrderByTime(int page) throws SQLException;
	List<Scene> selectScenesWithhall_idOrderByTime(String name)
			throws SQLException;
	List<Scene> selectScenesWithhall_idOrderByid(int page) throws SQLException;
	
	long selectTotalsceneWithm_title() throws SQLException;
	List<Scene> selectScenes() throws SQLException;
}
