package dao;

import java.sql.SQLException;
import java.util.List;

import bean.Movie;

public interface MovieDao {

	Movie selectMovieWithTitle(String title) throws SQLException;

	/**
	 * a) 添加类别、添加商品
	 * 
	 * @param movie
	 * @return
	 * @throws SQLException
	 */
	int insertMovie(Movie movie) throws SQLException;

	/**
	 * c) 查找一个类别下推荐度最高的8个商品
	 * 
	 * @param A page movies has 4 items;
	 * @return
	 * @throws SQLException
	 */
	List<Movie> selectAPageMovieWithTypeOrderByRate(String type, int page)
			throws SQLException;

	/**
	 * d) 查找指定类别的所有商品，按照推荐度排序 inner join movie!!
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
