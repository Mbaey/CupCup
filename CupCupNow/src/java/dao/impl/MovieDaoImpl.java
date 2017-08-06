package dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import utils.JDBCUtils;
import utils.MyConstant;
import bean.Movie;
import dao.MovieDao;

public class MovieDaoImpl implements MovieDao {

	@Override
	public int insertMovie(Movie movie) throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());

		String sql = "insert into movie (title, rate) values (?, ?) ";

		return qr.update(sql, movie.getTitle(), movie.getRate());
	}

	@Override
	public List<Movie> selectAllMovieWithTypeOrderByRate(String type)
			throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());

		String sql = "select * from movie m where m.type = ? order by m.rate DESC";

		return qr.query(sql, new BeanListHandler<Movie>(Movie.class), type);
	}

	@Override
	public Movie selectMovieWithTitle(String title) throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());

		String sql = "select * from movie where title = ?";

		return qr.query(sql, new BeanHandler<Movie>(Movie.class), title);
	}

	@Override
	public long selectTotalMovieWithType(String type) throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());

		String sql = "select count(*) from movie where type = ?";

		return qr.query(sql, new ScalarHandler<Long>(), type);
	}

	@Override
	public List<Movie> selectAllMovie(int page) throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());

		String sql = "select * from movie m order by m.rate DESC limit ?, ?";

		return qr.query(sql, new BeanListHandler<Movie>(Movie.class),
				MyConstant.PAGE_SIZE * (page - 1), MyConstant.PAGE_SIZE);
	}

	@Override
	public Movie selectMovieWithId(int id) throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());

		String sql = "select * from movie where m_id = ?";

		return qr.query(sql, new BeanHandler<Movie>(Movie.class), id);
	}

	@Override
	public List<Movie> selectAllMovieWithTitle(String title, int page)
			throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());

		String sql = "select * from movie m where m.title like ? order by m.rate DESC limit ?, ?";

		return qr.query(sql, new BeanListHandler<Movie>(Movie.class), "%"
				+ title + "%", MyConstant.PAGE_SIZE * (page - 1),
				MyConstant.PAGE_SIZE);
	}

	@Override
	public long selectTotalMovieWithTitle(String title) throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());

		String sql = "select count(*) from movie where title like ?";

		return qr.query(sql, new ScalarHandler<Long>(), "%" + title + "%");
	}

	@Override
	public int deleteMovie(String title) throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());

		String sql = "delete from movie where title = ?";
		int res = qr.update(sql, title);

		return res;
	}

	@Override
	public List<Movie> selectAPageMovieWithTypeOrderByRate(String type, int page)
			throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());

		String sql = "select * from movie m where m.type = ? order by m.rate DESC limit ?, ?";

		return qr.query(sql, new BeanListHandler<Movie>(Movie.class), type,
				MyConstant.PAGE_SIZE * (page - 1), MyConstant.PAGE_SIZE);
	}
}
