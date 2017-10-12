package dao.impl;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.junit.Test;

import utils.Exchange;
import bean.Movie;
import bean.Scene;
import bean.Scene2;
import dao.SceneDao;

public class SceneDaoImplTest {
	private SceneDao sceneDao = new SceneDaoImpl();
	@Test
	public void  testInsertScene() throws SQLException{
		Scene scene = new Scene("zahnag", new Timestamp(new Date().getTime()),
				new Timestamp(new Date().getTime()), 1,(float)13);
		int res = sceneDao.insertScene(scene);
		System.out.println(res);
	}
	
	
	@Test
	public void test1() throws SQLException{
		List<Scene> res = sceneDao.selectScenesWithhall_idOrderByid(14462);
		for(Scene i: res){
			System.out.println(i);
		}
		Exchange exchange = new Exchange();
		List<Scene2> scelist = exchange.change(res);
		for(Scene2 sc: scelist){
			System.out.println(sc);
		}
	}
	
	@Test
	public void test2() throws SQLException{
		MovieDaoImpl movieDao = new MovieDaoImpl();
		Movie mov = movieDao.selectMovieWithId(15285);
		System.out.println(mov.getM_id());
	}

}
