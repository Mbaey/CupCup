package dao.impl;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.junit.Test;

import dao.CommentDao;
import bean.Comment;

public class CommentDaoImplTest {

	@Test
	public void testInsertComment() throws SQLException {
		Comment comment = new Comment("gkjgk", "5789", 6, "kll", 8, "oioi", new Timestamp(new Date().getTime()));
		CommentDao commentDao = new CommentDaoImpl();
		int res = commentDao.insertComment(comment);
		System.out.println(res);
	}
	@Test
	public void testUpdateComment() throws SQLException {
		Comment comment = new Comment("gkjgk", "wwwwww", new Timestamp(new Date().getTime()));
		CommentDao commentDao = new CommentDaoImpl();
		int res = commentDao.updateComment(comment, "kll", Timestamp.valueOf("2017-07-23 11:00:42"));
		System.out.println(res);
	}

	@Test
	
	public void testDeleteComment() throws SQLException {
		CommentDao commentDao = new CommentDaoImpl();
		int res = commentDao.deleteComment("kk", Timestamp.valueOf("2017-07-22 10:49:35"));
		System.out.println(res);
		
	}

	@Test
	public void testSelectCommentWithu_id() throws SQLException {
		CommentDao commentDao = new CommentDaoImpl();
		List<Comment> d = commentDao.selectCommentWithu_id(7);
		for(Comment com:d){
			System.out.println(com);
		}
	}

	@Test
	public void testSelectCommentWithm_idIntInt() throws SQLException {
		CommentDao commentDao = new CommentDaoImpl();
		List<Comment> res = commentDao.selectCommentWithm_id(6, 1);
		for(Comment co:res){
			System.out.println(co);
		}
	}

	@Test
	public void testSelectCommentWithm_idStringInt() throws SQLException {
		CommentDao commentDao = new CommentDaoImpl();
		List<Comment> res = commentDao.selectAllCommentWithm_title("肖申克的救赎", 1);
		for(Comment co:res){
			System.out.println(co);
		}
	}
	@Test
	public void testSelectCommentWithc_id() throws SQLException {
		CommentDao commentDao = new CommentDaoImpl();
		Comment res = commentDao.selectLongCommentWithc_id(1);
		System.out.println(res);
	}
	@Test
	public void testselectTotalShortCommentWithm_title() throws SQLException {
		CommentDao commentDao = new CommentDaoImpl();
		Long res = commentDao.selectTotalShortCommentWithm_title("灿烂人生");
		System.out.println(res);
	}
	
	@Test
	public void testselectTotalLongCommentWithm_title() throws SQLException {
		CommentDao commentDao = new CommentDaoImpl();
		Long res = commentDao.selectTotalLongCommentWithm_title("灿烂人生");
		System.out.println(res);
	}

}
