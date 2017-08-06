package service;

import java.sql.SQLException;
import java.util.List;

import bean.Movie;

public interface MovieService {
	Movie selectMovieWithTitle(String title) throws SQLException;

	int insertMovie(Movie movie) throws SQLException;

	List<Movie> selectAPageMovieWithTypeOrderByRate(String type, int page)
			throws SQLException;

	List<Movie> selectAllMovieWithTypeOrderByRate(String type)
			throws SQLException;

	long selectTotalMovieWithType(String type) throws SQLException;

	List<Movie> selectAllMovie(int page) throws SQLException;

	Movie selectMovieWithId(int id) throws SQLException;

	List<Movie> selectAllMovieWithTitle(String title, int page)throws SQLException;

	long selectTotalMovieWithTitle(String title) throws SQLException;
	
	int deleteMovie(String title) throws SQLException;
}
