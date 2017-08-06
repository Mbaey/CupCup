package service.impl;

import java.sql.SQLException;
import java.util.List;

import dao.SceneDao;
import dao.impl.SceneDaoImpl;
import bean.Scene;
import service.SceneService;

public class SceneServiceImpl implements SceneService{
	SceneDao sceneDao = new  SceneDaoImpl();

	@Override
	public int insertScene(Scene scene) throws SQLException {
		return  sceneDao.insertScene(scene);
		
	}

	@Override
	public int insertScene(List<Scene> scenes) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Scene> selectScenesWithhall_idOrderByTime(int page)
			throws SQLException {
		return sceneDao.selectScenesWithhall_idOrderByTime(page);
		
	}

	@Override
	public long selectTotalsceneWithm_title() throws SQLException {
		return sceneDao.selectTotalsceneWithm_title();
		
	}

	@Override
	public List<Scene> selectScenes() throws SQLException {
		return sceneDao.selectScenes();
		
	}

	@Override
	public List<Scene> selectScenesWithhall_idOrderByid(int id)
			throws SQLException {
		return sceneDao.selectScenesWithhall_idOrderByid(id);
		
	}

}
