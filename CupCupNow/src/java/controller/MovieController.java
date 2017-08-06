package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.alibaba.fastjson.JSON;

import service.CategoryService;
import service.CommentService;
import service.MovieService;
import service.impl.CategoryServiceImpl;
import service.impl.CommentServiceImpl;
import service.impl.MovieServiceImpl;
import utils.JiaJieMi;
import utils.MyConstant;
import utils.PageBean;
import bean.Category;
import bean.Comment;
import bean.Movie;
import bean.User;

@MultipartConfig
@WebServlet("/movieController")
public class MovieController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static int page = 1;
	private static String type = "经典";

	private MovieService movieService = new MovieServiceImpl();
	private CategoryService categoryService = new CategoryServiceImpl();
    private CommentService commentService = new CommentServiceImpl();
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String op = request.getParameter("op");
		switch (op) {
		case "movieAppend":
			movieAppend(request, response);
			break;
		case "showFirst":
			showMovieByPage(request, response);
			break;
		case "searchMovie":
			searchMovie(request, response);
			break;
		case "showDetail":
			showMovieDetailAndSomeComment(request, response);
			break;

		default:
			break;
		}

	}

	private void showMovieDetailAndSomeComment(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			String id = request.getParameter("id");
			int m_id = Integer.parseInt(id);
			Movie movie = movieService.selectMovieWithId(m_id);
			String m_title = movie.getTitle();
			List<Comment> shortComment = commentService.selectShortCommentWithm_title(m_title, 1);
			List<Comment> longComment1 = commentService.selectLongCommentWithm_title(m_title, 1);
			
			int longCommentTotalNum = (int) commentService.selectTotalLongCommentWithm_title(m_title);
			int shortCommentTotalNum = (int) commentService.selectTotalShortCommentWithm_title(m_title);
			
			List<Comment> longComment = new ArrayList<Comment>();
			for(Comment c : longComment1){
				if(c.getC_content().length()>=123){
					c.setC_content(c.getC_content().substring(0, 123) + "...");
				}
				longComment.add(c);
				
			}
			
			/**
			 * 记录跳转的URL
			 */
			String url = request.getRequestURL().append("?")
					.append(request.getQueryString()).toString();
			HttpSession session = request.getSession();
			session.setAttribute("redirectUrl", url);
			request.setAttribute("longCommentTotalNum", longCommentTotalNum);
			request.setAttribute("shortCommentTotalNum", shortCommentTotalNum);
			request.setAttribute("movie", movie);
			request.setAttribute("shortComment", shortComment);
			request.setAttribute("longComment", longComment);
			request.getRequestDispatcher("MovieDetail.jsp").forward(request,
					response);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private void searchMovie(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			/**
			 * 这里用按类别查找时的type
			 * 重用rank.jsp
			 */
			String title = request.getParameter("title");
			String pageNumStr = request.getParameter("pageNum");
			int pageNum = Integer.parseInt(pageNumStr);
			List<Movie> movies = movieService.selectAllMovieWithTitle(title, pageNum);
			PageBean<Movie> pageBean = new PageBean<Movie>();
			pageBean.setPageDatas(movies);
			pageBean.setTotalRecords((int) movieService.selectTotalMovieWithTitle(title));
			pageBean.setPageNum(pageNum);

			request.setAttribute("pageBean", pageBean);
			request.setAttribute("title", title);
			request.getRequestDispatcher("searchRank.jsp").forward(request,
					response);
		} catch(NumberFormatException e1) {
			e1.printStackTrace();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
	}

	private void showMovieByPage(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {

			String ppStr = request.getParameter("pageNum");
			type = request.getParameter("type");
			try {
				page = Integer.parseInt(ppStr);
			} catch (NumberFormatException e) {

			}
			List<Movie> movies = movieService
					.selectAPageMovieWithTypeOrderByRate(type, page);
			PageBean<Movie> pageBean = new PageBean<Movie>();
			pageBean.setPageDatas(movies);
			pageBean.setTotalRecords((int) movieService.selectTotalMovieWithType(type));
			pageBean.setPageNum(page);
			List<Category> categories = categoryService
					.selectAllCateOrderByLevel();
			
			request.setAttribute("pageBean", pageBean);
			request.setAttribute("categories", categories);
			request.setAttribute("type", type);
			request.getRequestDispatcher("rank.jsp").forward(request,
					response);
//			request.getRequestDispatcher("test.jsp").forward(request,
//					response);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private void movieAppend(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		PrintWriter out = response.getWriter();

		String title = request.getParameter("title");

		Part part = request.getPart("cover");

		String realPath = getServletContext().getRealPath("/upload");
		System.out.println(realPath);
		String fileName = UUID.randomUUID().toString();
		String cd = part.getHeader("Content-Disposition");
		String suffix = cd.substring(cd.lastIndexOf('.'), cd.length() - 1);

		part.write(realPath + "/" + fileName + suffix);
		String cover = "/" + fileName + suffix;

		Movie movie = new Movie();
		movie.setTitle(title);
		movie.setCover(cover);
		try {
			int res = movieService.insertMovie(movie);
			if (res == 1) {
				out.print("注册成功");
			} else {
				out.print("注册失败");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
