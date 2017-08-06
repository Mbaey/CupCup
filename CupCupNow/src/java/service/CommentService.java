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
	 * �ҵ�һ�������е�����
	 * @param u_id
	 * @return
	 * @throws SQLException
	 */
	List<Comment> selectCommentWithu_id(int u_id) throws SQLException;
	/**
	 * ͨ����Ӱm_id
	 * �ҵ�һ����Ӱ���е�����
	 * @param ��Ӱid�� m_id
	 * @return
	 * @throws SQLException
	 */
	List<Comment> selectCommentWithm_id(int m_id, int page) throws SQLException;
	
	/**
	 * ͨ����Ӱ��
	 * �����ԵĶ�����
	 * ��ҳ�ҵ����е�����
	 * @param ��Ӱ��m_title
	 * @return
	 * @throws SQLException
	 */
	List<Comment> selectShortCommentWithm_title(String m_title, int page) throws SQLException;
	/**
	 * ͨ����Ӱ��
	 * �����Եĳ�����
	 * ��ҳ�ҵ����е�����
	 * @param ��Ӱ��m_title
	 * @return
	 * @throws SQLException
	 */
	List<Comment> selectLongCommentWithm_title(String m_title, int page) throws SQLException;
	/**
	 * ͨ����Ӱ��
	 * ��all����
	 * ��ҳ�ҵ����е�����
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
