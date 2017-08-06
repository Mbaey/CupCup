package service;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import bean.Comment;

public interface CommentService {
	int insertComment(Comment comment) throws SQLException;
	int deleteComment(String u_name, Timestamp timestamp) throws SQLException;
	
	int updateComment(Comment comment, String u_name, Timestamp timestamp)
			throws SQLException;
	/**
	 * 找到一个人所有的评论
	 * @param u_id
	 * @return
	 * @throws SQLException
	 */
	List<Comment> selectCommentWithu_id(int u_id) throws SQLException;
	/**
	 * 通过电影m_id
	 * 找到一个电影所有的评论
	 * @param 电影id： m_id
	 * @return
	 * @throws SQLException
	 */
	List<Comment> selectCommentWithm_id(int m_id, int page) throws SQLException;
	
	/**
	 * 通过电影名
	 * 找所以的短评论
	 * 分页找到所有的评论
	 * @param 电影名m_title
	 * @return
	 * @throws SQLException
	 */
	List<Comment> selectShortCommentWithm_title(String m_title, int page) throws SQLException;
	/**
	 * 通过电影名
	 * 找所以的长评论
	 * 分页找到所有的评论
	 * @param 电影名m_title
	 * @return
	 * @throws SQLException
	 */
	List<Comment> selectLongCommentWithm_title(String m_title, int page) throws SQLException;
	/**
	 * 通过电影名
	 * 找all评论
	 * 分页找到所有的评论
	 * @param m_title
	 * @param page
	 * @return
	 * @throws SQLException
	 */
	List<Comment> selectAllCommentWithm_title(String m_title, int page) throws SQLException;
	Comment selectLongCommentWithc_id(int c_id)throws SQLException;
	long selectTotalShortCommentWithm_title(String m_title)throws SQLException;
	long selectTotalLongCommentWithm_title(String m_title)throws SQLException;
	int deleteCommentbyc_id(int c_id)throws SQLException;
	
}
