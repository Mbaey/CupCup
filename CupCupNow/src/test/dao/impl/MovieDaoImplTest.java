package dao.impl;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.util.List;

import org.junit.Test;

import bean.Movie;
import dao.MovieDao;

public class MovieDaoImplTest {
	public static MovieDao movieDao = new MovieDaoImpl();
	@Test
	public void testInsertMovie() throws SQLException {
		Movie movie = new Movie();
		movie.setTitle("title");
		int res = movieDao.insertMovie(movie);
		System.out.println(res);
	}

	@Test
	public void testSelectMovieByRate() throws SQLException {
		List<Movie> res = movieDao.selectAPageMovieWithTypeOrderByRate("����", 0);
		res.forEach(i -> System.out.println(i));
	}
	
	@Test
	public void testSelectAllMovieByTypeOrderByRate() throws SQLException {
		List<Movie> res = movieDao.selectAllMovieWithTypeOrderByRate("����");
		res.forEach(i -> System.out.println(i));
	}
	@Test
	public void testselectMovieWithTitle() throws SQLException {
		Movie res = movieDao.selectMovieWithTitle("������");
		System.out.println(res);
	}
	@Test
	public void testselectTotalMovieWithType() throws SQLException {
		Long res = movieDao.selectTotalMovieWithType("����");
		System.out.println(res);
	}

}
