package service.impl;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import dao.CommentDao;
import dao.impl.CommentDaoImpl;
import bean.Comment;
import service.CommentService;

public class CommentServiceImpl implements CommentService{
	
	private CommentDao commentDao = new CommentDaoImpl();
	@Override
	public int insertComment(Comment comment) throws SQLException {
		return commentDao.insertComment(comment);
	}

	@Override
	public int deleteComment(String u_name, Timestamp timestamp)
			throws SQLException {
		return commentDao.deleteComment(u_name, timestamp);
	}

	@Override
	public int updateComment(Comment comment, String u_name, Timestamp timestamp)
			throws SQLException {
		return commentDao.updateComment(comment, u_name, timestamp);
	}

	@Override
	public List<Comment> selectCommentWithu_id(int u_id) throws SQLException {
		return commentDao.selectCommentWithu_id(u_id);
	}

	@Override
	public List<Comment> selectCommentWithm_id(int m_id, int page)
			throws SQLException {
		return commentDao.selectCommentWithm_id(m_id, page);
	}

	@Override
	public List<Comment> selectAllCommentWithm_title(String m_title, int page)
			throws SQLException {
		return commentDao.selectAllCommentWithm_title(m_title, page);
	}

	@Override
	public List<Comment> selectShortCommentWithm_title(String m_title, int page)
			throws SQLException {
		return commentDao.selectShortCommentWithm_title(m_title, page);
	}

	@Override
	public List<Comment> selectLongCommentWithm_title(String m_title, int page)
			throws SQLException {
		return commentDao.selectLongCommentWithm_title(m_title, page);
	}

	@Override
	public Comment selectLongCommentWithc_id(int c_id) throws SQLException {
		return commentDao.selectLongCommentWithc_id(c_id);
	}

	@Override
	public long selectTotalShortCommentWithm_title(String m_title)
			throws SQLException {
		return commentDao.selectTotalShortCommentWithm_title(m_title);
	}

	@Override
	public long selectTotalLongCommentWithm_title(String m_title)
			throws SQLException {
		// TODO Auto-generated method stub
		return commentDao.selectTotalLongCommentWithm_title(m_title);
	}

	@Override
	public int deleteCommentbyc_id(int c_id) throws SQLException {
		// TODO Auto-generated method stub
		return commentDao.deleteCommentbyc_id(c_id);
	}





}
