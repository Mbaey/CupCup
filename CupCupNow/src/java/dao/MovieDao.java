package dao;

import java.sql.SQLException;
import java.util.List;

import bean.Movie;

public interface MovieDao {

	Movie selectMovieWithTitle(String title) throws SQLException;

	/**
	 * a) �����������Ʒ
	 * 
	 * @param movie
	 * @return
	 * @throws SQLException
	 */
	int insertMovie(Movie movie) throws SQLException;

	/**
	 * c) ����һ��������Ƽ�����ߵ�8����Ʒ
	 * 
	 * @param A page movies has 4 items;
	 * @return
	 * @throws SQLException
	 */
	List<Movie> selectAPageMovieWithTypeOrderByRate(String type, int page)
			throws SQLException;

	/**
	 * d) ����ָ������������Ʒ�������Ƽ������� inner join movie!!
	 * 
	 * @param name
	 * @return
	 */
	List<Movie> selectAllMovieWithTypeOrderByRate(String type)
			throws SQLException;
	
	long selectTotalMovieWithType(String type)
			throws SQLException;

	List<Movie> selectAllMovie(int page)throws SQLException;

	Movie selectMovieWithId(int id)throws SQLException;

	List<Movie> selectAllMovieWithTitle(String title, int page)throws SQLException;

	long selectTotalMovieWithTitle(String title)throws SQLException;

	int deleteMovie(String title) throws SQLException;
}
