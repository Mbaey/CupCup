package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.CommentService;
import service.MovieService;
import service.impl.CommentServiceImpl;
import service.impl.MovieServiceImpl;
import utils.MyConstant;
import utils.PageBean;
import bean.Category;
import bean.Comment;
import bean.Movie;
import bean.User;

@WebServlet("/commentController")
public class CommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private CommentService commentService = new CommentServiceImpl();
	private MovieService movieService = new MovieServiceImpl();
	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String op = request.getParameter("op");
		switch (op) {
		case "showLongComment":
			showLongComment(request, response);
			break;
		case "toAppendLongCom":
			try {
				int m_id = Integer.parseInt(request.getParameter("m_id"));
				Movie movie = movieService.selectMovieWithId(m_id);
				request.setAttribute("movie", movie);
				request.getRequestDispatcher("commentWrite.jsp").forward(request,
							 response);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "appendShortCom":
			appendShortCom(request, response);
			break;
		case "appendLongCom":
			appendLongCom(request, response);
			break;
		case "shortCommentPage":
			shortCommentPage(request, response);
			break;
		case "longCommentPage":
			longCommentPage(request, response);
			break;

		default:
			break;
		}
	}

	private void appendLongCom(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		try {
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			if (user == null) {
				response.sendRedirect("login.jsp");
				return;
			}
			int m_id = Integer.parseInt(request.getParameter("m_id"));
			String c_title = request.getParameter("title");
			String c_content = request.getParameter("content");
			String m_title = request.getParameter("m_title");
			Timestamp timestamp =new Timestamp(
					new Date().getTime());
			Comment comment = new Comment(c_title, c_content, user.getU_id(), user.getU_name(), m_id, m_title, timestamp);
			
			int res = commentService.insertComment(comment);
			if (res == 1) {
				response.sendRedirect("movieController?op=showDetail&id="
						+ m_id);
				// request.getRequestDispatcher("movieController?op=showDetail&id="+m_id).forward(request,
				// response);
			} else {

			}

		} catch (NumberFormatException | SQLException e) {
			e.printStackTrace();
		}
	}

	private void longCommentPage(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			int page = 1;
			String ppStr = request.getParameter("pageNum");
			/**
			 * 重用分页
			 * type是电影名
			 */
			String m_title = request.getParameter("type");
			Movie movie = movieService.selectMovieWithTitle(m_title);
			try {
				page = Integer.parseInt(ppStr);
			} catch (NumberFormatException e) {

			}
			List<Comment> longComment1 = commentService.selectLongCommentWithm_title(m_title, page);
			List<Comment> longComment = new ArrayList<Comment>();
			for(Comment c : longComment1){
				c.setC_content(c.getC_content().substring(0, 123) + "...");
				longComment.add(c);
				
			}
			
			PageBean<Comment> pageBean = new PageBean<Comment>();
			pageBean.setPageDatas(longComment);
			/**
			 * 不设置pageSize就默认是6.。。
			 */
			pageBean.setPageSize(MyConstant.COMMENT_PAGE_SIZE);
			pageBean.setTotalRecords((int) commentService.selectTotalLongCommentWithm_title(m_title));
			pageBean.setPageNum(page);
			
			
			request.setAttribute("movie", movie);
			request.setAttribute("pageBean", pageBean);
			request.getRequestDispatcher("commentAllLong.jsp").forward(request,
					response);

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	private void shortCommentPage(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			int page = 1;
			String ppStr = request.getParameter("pageNum");
			/**
			 * 重用分页
			 * type是电影名
			 */
			String m_title = request.getParameter("type");
			Movie movie = movieService.selectMovieWithTitle(m_title);
			try {
				page = Integer.parseInt(ppStr);
			} catch (NumberFormatException e) {

			}
			List<Comment> shortComment = commentService.selectShortCommentWithm_title(m_title, page);
			PageBean<Comment> pageBean = new PageBean<Comment>();
			pageBean.setPageDatas(shortComment);
			pageBean.setPageSize(MyConstant.COMMENT_PAGE_SIZE);
			pageBean.setTotalRecords((int) commentService.selectTotalShortCommentWithm_title(m_title));
			pageBean.setPageNum(page);
			
			
			request.setAttribute("movie", movie);
			request.setAttribute("pageBean", pageBean);
			request.getRequestDispatcher("commentAllShort.jsp").forward(request,
					response);

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	private void appendShortCom(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		try {
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			if (user == null) {

				response.sendRedirect("login.jsp");
				return;
			}
			int m_id = Integer.parseInt(request.getParameter("m_id"));
			Comment comment = new Comment(
					request.getParameter("content"), user.getU_id(),
					user.getU_name(), m_id,
					request.getParameter("m_title"), new Timestamp(
							new Date().getTime()));
			int res = commentService.insertComment(comment);
			if (res == 1) {
				response.sendRedirect("movieController?op=showDetail&id="
						+ m_id);
				// request.getRequestDispatcher("movieController?op=showDetail&id="+m_id).forward(request,
				// response);
			} else {

			}

		} catch (NumberFormatException | SQLException e) {
			e.printStackTrace();
		}
	}

	private void showLongComment(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			String c_idStr = request.getParameter("c_id");
			String m_idStr = request.getParameter("m_id");
			String m_title = request.getParameter("m_title");
			int c_id = Integer.parseInt(c_idStr);
			
			Comment comment = commentService.selectLongCommentWithc_id(c_id);
			/**
			 * 数据没爬好。
			 * 现在分不了段了
			 */
			String[] splitContent = comment.getC_content().trim().split("    ");
			
			System.out.println(splitContent.length);
			request.setAttribute("comment", comment);
			request.setAttribute("m_id", m_idStr);
			request.setAttribute("m_title", m_title);
			request.setAttribute("splitContent", splitContent);
			request.getRequestDispatcher("commentShow.jsp").forward(request,
					response);
		} catch (NumberFormatException | SQLException e) {
			e.printStackTrace();
		}
	}

}
