package service.impl;

import java.sql.SQLException;
import java.util.List;

import dao.MovieDao;
import dao.impl.MovieDaoImpl;
import bean.Movie;
import service.MovieService;

public class MovieServiceImpl implements MovieService {
	
	private MovieDao movieDao = new MovieDaoImpl();
	@Override
	public Movie selectMovieWithTitle(String title) throws SQLException {
		return movieDao.selectMovieWithTitle(title);
	}

	@Override
	public int insertMovie(Movie movie) throws SQLException {
		return movieDao.insertMovie(movie);
	}

	@Override
	public List<Movie> selectAPageMovieWithTypeOrderByRate(String type, int page)
			throws SQLException {
		return movieDao.selectAPageMovieWithTypeOrderByRate(type, page);
	}

	@Override
	public List<Movie> selectAllMovieWithTypeOrderByRate(String type)
			throws SQLException {
		return movieDao.selectAllMovieWithTypeOrderByRate(type);
	}

	@Override
	public long selectTotalMovieWithType(String type) throws SQLException {
		return movieDao.selectTotalMovieWithType(type);
	}

	@Override
	public List<Movie> selectAllMovie(int page) throws SQLException {
		return movieDao.selectAllMovie(page);
	}

	@Override
	public Movie selectMovieWithId(int id) throws SQLException {
		return movieDao.selectMovieWithId(id);
	}

	@Override
	public List<Movie> selectAllMovieWithTitle(String title, int page)
			throws SQLException {
		// TODO Auto-generated method stub
		return movieDao.selectAllMovieWithTitle(title, page);
	}

	@Override
	public long selectTotalMovieWithTitle(String title) throws SQLException {
		// TODO Auto-generated method stub
		return movieDao.selectTotalMovieWithTitle(title);
	}

	@Override
	public int deleteMovie(String title) throws SQLException {
		// TODO Auto-generated method stub
		return movieDao.deleteMovie(title);
	}
	
}
