package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
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

import org.apache.poi.hssf.model.CommentShape;

import service.CommentService;
import service.MovieService;
import service.SceneService;
import service.UserService;
import service.impl.CommentServiceImpl;
import service.impl.MovieServiceImpl;
import service.impl.SceneServiceImpl;
import service.impl.UserServiceImpl;
import utils.MyConstant;
import utils.PageBean;
import utils.ReadWriteExcel1;
import bean.Comment;
import bean.Movie;
import bean.Scene;
import bean.User;

@MultipartConfig
@WebServlet("/mgr/mgrController")
public class MgrController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MovieService movieService = new MovieServiceImpl();
	SceneService sceneService = new SceneServiceImpl();
	UserService userService = new UserServiceImpl();
    CommentService commentService = new CommentServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String op = request.getParameter("op");
		switch (op) {
		case "addmovie":
			try {
				addmovie(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "showdeletemovie":
			try {
				showdeletemovie(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
       break;
		case "deletemovie":
			try {
				delectmovie(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
			break;
		case "addscene":
			try {
				addscene(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "showdeleteuser":
			try {
				showdeleteuser(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "deleteuser":
			try {
				deleteuser(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "insertExcel":
			Part part = request.getPart("excel");
			String realPath = getServletContext().getRealPath("/upload");
			
			System.out.println(realPath);
			String fileName = UUID.randomUUID().toString();
			String cd = part.getHeader("Content-Disposition");
			String suffix = cd.substring(cd.lastIndexOf('.'),cd.length()-1);
			String  file = realPath +"\\"+fileName+suffix;
			part.write( realPath + "/"+fileName+suffix);
			
			ReadWriteExcel1.insertExcel(file);
			request.getRequestDispatcher("margthird.jsp").forward(request, response);
			break;
		case "showallscene":
			try {
				String pagestr = request.getParameter("page");
				int page = Integer.parseInt(pagestr);
				PageBean<Scene> pageBean = null;
				List<Scene> scene = sceneService.selectScenesWithhall_idOrderByid(page);
				pageBean = new PageBean<Scene>();
				pageBean.setPageDatas(scene);
				pageBean.setPageSize(MyConstant.COMMENT_PAGE_SIZE);

				long dd = sceneService.selectTotalsceneWithm_title();
				pageBean.setTotalRecords((int)dd );
				
				pageBean.setPageNum(page);
				request.setAttribute("pageBean", pageBean);
				request.getRequestDispatcher("margfifth.jsp").forward(request,
						response);
			} catch (NumberFormatException | SQLException e1) {
				e1.printStackTrace();
			}
			
			break;
		case"showcomment":
			try {
				String title = request.getParameter("title");
				Movie movie =movieService.selectMovieWithTitle(title);

				List<Comment> shortComment = commentService.selectShortCommentWithm_title(title , 1);
				List<Comment> longComment1 = commentService.selectLongCommentWithm_title(title , 1);
				
				int longCommentTotalNum = (int) commentService.selectTotalLongCommentWithm_title(title );
				int shortCommentTotalNum = (int) commentService.selectTotalShortCommentWithm_title(title );
				
				List<Comment> longComment = new ArrayList<Comment>();
				for(Comment c : longComment1){
					c.setC_content(c.getC_content().substring(0, 10) + "...");
					longComment.add(c);
					
				}
				String url = request.getRequestURL().append("?")
						.append(request.getQueryString()).toString();
				HttpSession session = request.getSession();
				session.setAttribute("redirectUrl", url);
				
				request.setAttribute("longCommentTotalNum", longCommentTotalNum);
				request.setAttribute("shortCommentTotalNum", shortCommentTotalNum);
				request.setAttribute("movie", movie);
				request.setAttribute("shortComment", shortComment);
				request.setAttribute("longComment", longComment);
				request.getRequestDispatcher("margsixth.jsp").forward(request,
						response);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case"deleteping":
			String c_idstr = request.getParameter("c_id");
			int c_id = Integer.parseInt(c_idstr);
			int res = 0;
			try {
				 res = commentService.deleteCommentbyc_id(c_id);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(res == 1){
				request.setAttribute("yes", "yes");
				System.out.println("ff");
				
				request.getRequestDispatcher("margsixth.jsp").forward(request, response);
			}else{
				System.out.println("no");
			}
		default:
			break;
		}
	}


	private void deleteuser(HttpServletRequest request,
			HttpServletResponse response) throws SQLException,
			ServletException, IOException {
		String u_name = request.getParameter("u_name");
		int res = userService.deleteUser(u_name);
		System.out.println(res);
		if(res == 1){
		request.setAttribute("yes", "yes");
		request.getRequestDispatcher("margfourth.jsp").forward(request, response);
	}
		}


	private void showdeleteuser(HttpServletRequest request,
			HttpServletResponse response) throws SQLException,
			ServletException, IOException {
		String u_name = request.getParameter("u_name");
		User user = userService.selectUserByu_naem(u_name);
		request.setAttribute("user", user);
		request.getRequestDispatcher("margfourth.jsp").forward(request, response);
	}


	private void addscene(HttpServletRequest request,
			HttpServletResponse response) throws SQLException,
			ServletException, IOException {
		String m_title = request.getParameter("m_title");
		String stimestr = request.getParameter("s_time");
		Timestamp s_time = Timestamp.valueOf(stimestr);
		String etimestr = request.getParameter("e_time");
		Timestamp e_time = Timestamp.valueOf(etimestr);
		String hallidstr = request.getParameter("hall_id");
		int hall_id = Integer.parseInt(hallidstr);
		String pricestr = request.getParameter("price");
		float price = Float.parseFloat(pricestr);
		Scene scene = new Scene(m_title, s_time, e_time, hall_id, price);
		int res = sceneService.insertScene(scene);
		if(res == 1){
			request.setAttribute("yes", "yes");
			request.getRequestDispatcher("margthird.jsp").forward(request, response);
		}else{
			System.out.println();
		}
	}


	private void delectmovie(HttpServletRequest request,
			HttpServletResponse response) throws SQLException,
			ServletException, IOException {
		String title = request.getParameter("title");
		int res = movieService.deleteMovie(title);
		if(res == 1){
			request.setAttribute("yes", "yes");
			request.getRequestDispatcher("margscond.jsp").forward(request, response);
		}else{
			System.out.println("no");
		}
	}


	private void showdeletemovie(HttpServletRequest request,
			HttpServletResponse response) throws SQLException,
			ServletException, IOException {
		String title = request.getParameter("title");
		Movie movie = movieService.selectMovieWithTitle(title);
		request.setAttribute("movie", movie);	
		request.getRequestDispatcher("margscond.jsp").forward(request,
				response);
	}


	private void addmovie(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException,
			SQLException {
		String director = request.getParameter("director");
		String ratestr = request.getParameter("rate");
		float rate = Float.parseFloat(ratestr);
		String title = request.getParameter("title");
		String casts = request.getParameter("casts");
		Part part = request.getPart("cover");
		if(part != null){
			String realPath = getServletContext().getRealPath("/upload");
			
			String fileName = UUID.randomUUID().toString();
			String cd = part.getHeader("Content-Disposition");
			String suffix = cd.substring(cd.lastIndexOf('.'),cd.length()-1);
			String  cover= "upload/"+fileName+suffix;
			part.write( realPath + "/"+fileName+suffix);
		String adaptor = request.getParameter("adaptor");
		String type = request.getParameter("type");
		String date = request.getParameter("date");
		String timelen = request.getParameter("timelen");
		String summary = request.getParameter("summary");
		PrintWriter out = response.getWriter();
		Movie movie = new Movie(director, rate, title, casts, cover, adaptor, type, date, timelen, summary);
		int res = movieService.insertMovie(movie);
		if(res == 1){
			request.setAttribute("yes", "yes");
			request.getRequestDispatcher("margfirst.jsp").forward(request, response);
		}else{
			out.write("no");
		}
			
}
	}

}
