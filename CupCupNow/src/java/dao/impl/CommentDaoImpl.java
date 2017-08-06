package dao.impl;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import utils.JDBCUtils;
import utils.MyConstant;
import bean.Comment;
import dao.CommentDao;

public class CommentDaoImpl implements CommentDao {

	@Override
	public int insertComment(Comment comment) throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		String sql = "insert into comment values (null,?, ?, ?, ?, ?, ?, ?) ";
		int res = qr.update(sql, comment.getC_title(), comment.getC_content(), comment.getU_id(), comment.getU_name(), comment.getM_id(), comment.getM_title(), comment.getTimestamp());

		return res;
	}


	@Override
	public List<Comment> selectCommentWithu_id(int u_id) throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		String sql = "select * from comment where u_id=?";
		List<Comment> res = qr.query(sql, new BeanListHandler<Comment>(Comment.class), u_id);
		return res;
	}

	@Override
	public List<Comment> selectCommentWithm_id(int m_id, int page)
			throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		String sql = "select * from comment where m_id=? order by timestamp limit ?,?";
		List<Comment> res = qr.query(sql, new BeanListHandler<Comment>(Comment.class), m_id,MyConstant.COMMENT_PAGE_SIZE * (page - 1), MyConstant.COMMENT_PAGE_SIZE);
		return res;
	}

	@Override
	public List<Comment> selectAllCommentWithm_title(String m_title, int page)
			throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		String sql = "select * from comment where m_title=?  order by timestamp desc limit ?,?";
		List<Comment> res = qr.query(sql, new BeanListHandler<Comment>(Comment.class), m_title,MyConstant.COMMENT_PAGE_SIZE * (page - 1), MyConstant.COMMENT_PAGE_SIZE);
		return res;
	}


	@Override
	public int deleteComment(String u_name, Timestamp timestamp)
			throws SQLException {
		
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());

		String sql = "delete from comment where u_name=? and timestamp=?";
		int res = qr.update(sql, u_name, timestamp);
		return res;
	}


	@Override
	public int updateComment(Comment comment, String u_name, Timestamp timestamp)
			throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());

		String sql = "update comment set c_title=?, c_content=?, timestamp=? where u_name=? and timestamp=?";
		int res = qr.update(sql, comment.getC_title(), comment.getC_content(), comment.getTimestamp(), u_name, timestamp);
		return res;
		
	}


	@Override
	public List<Comment> selectShortCommentWithm_title(String m_title, int page)
			throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		String sql = "select * from comment where m_title=?  and  c_title is null  order by timestamp desc limit ?,?";
		List<Comment> res = qr.query(sql, new BeanListHandler<Comment>(Comment.class), m_title,MyConstant.COMMENT_PAGE_SIZE * (page - 1), MyConstant.COMMENT_PAGE_SIZE);
		return res;
	}


	@Override
	public List<Comment> selectLongCommentWithm_title(String m_title, int page)
			throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		String sql = "select * from comment where m_title=?  and  c_title is not null  order by timestamp desc limit ?,?";
		List<Comment> res = qr.query(sql, new BeanListHandler<Comment>(Comment.class), m_title,MyConstant.COMMENT_PAGE_SIZE * (page - 1), MyConstant.COMMENT_PAGE_SIZE);
		return res;
	}


	@Override
	public Comment selectLongCommentWithc_id(int c_id) throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		String sql = "select * from comment where c_id=?";
		Comment res = qr.query(sql, new BeanHandler<Comment>(Comment.class), c_id);
		return res;
	}


	@Override
	public long selectTotalShortCommentWithm_title(String m_title)
			throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		String sql = "select count(*) from comment where m_title=?  and  c_title is null";
		return qr.query(sql, new ScalarHandler<Long>(), m_title);
	}


	@Override
	public long selectTotalLongCommentWithm_title(String m_title)
			throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		String sql = "select count(*) from comment where m_title=?  and  c_title is not null";
		return qr.query(sql, new ScalarHandler<Long>(), m_title);
	}

	@Override
	public int deleteCommentbyc_id(int c_id) throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());

		String sql = "delete from comment where c_id=?";
		int res = qr.update(sql, c_id);
		return res;
	}


	


}
