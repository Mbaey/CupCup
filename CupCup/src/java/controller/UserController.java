package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.jsp.PageContext;
import javax.servlet.http.HttpSession;

import bean.User;
import service.UserService;
import service.impl.UserServiceImpl;
import utils.JiaJieMi;
import utils.MyConstant;

@MultipartConfig
@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static UserService userService = new UserServiceImpl();

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String op = request.getParameter("op");

		switch (op) {
		case "u_nameDeplicatedCheck":
			u_nameDeplicatedCheck(request, response);
			break;
		case "regist":
			regist(request, response);
			break;
		case "show":
			showAllUsers(request, response);
			break;
		case "login":
			login(request, response);
			break;
		case "login1":
			login1(request, response);
			break;
		case "logout":
			logout(request, response);
			break;
		case "setting":
			setting(request, response);
			break;
		default:
			break;
		}

	}

	private void setting(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		try {
			User user = (User) request.getSession().getAttribute("user");
			String im = request.getParameter("file");
			System.out.println(im);
			Part part = request.getPart("file");
			if (part != null) {
				String realPath = getServletContext().getRealPath("/upload");

				String fileName = UUID.randomUUID().toString();
				String cd = part.getHeader("Content-Disposition");
				String suffix = cd.substring(cd.lastIndexOf('.'),
						cd.length() - 1);
				String img = "upload/" + fileName + suffix;
				part.write(realPath + "/" + fileName + suffix);
				user.setTouxiang(img);
				// String cd = part.getHeader("Content-Disposition");
				// String suffix =
				// cd.substring(cd.lastIndexOf('.'),cd.length()-1);
				// String img = "F:/cupcup/userImg/" +
				// UUID.randomUUID().toString() + suffix;
				// part.write(img);
				// user.setTouxiang(img);
			}

			String nickname = request.getParameter("nickname");
			if (!"".equals(nickname)) {
				user.setNickname(nickname);
			}
			String sex = request.getParameter("sex");
			if (!"".equals(sex)) {
				user.setSex(sex);
			}
			String userpwd = request.getParameter("userpwd");
			if (!"".equals(userpwd)) {
				user.setPwd(JiaJieMi.get3DESEncrypt(userpwd, MyConstant.SPKEY));
			}
			String tel = request.getParameter("tel");
			if (!"".equals(tel)) {
				user.setTel(tel);
			}
			String email = request.getParameter("email");
			if (!"".equals(email)) {
				user.setEmail(email);
			}

			userService.updateUser(user);
			request.getSession().setAttribute("user", user);
			request.getRequestDispatcher("userSetting1.jsp").forward(request,
					response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private void logout(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String to = request.getParameter("to");

		HttpSession session = request.getSession();
		session.removeAttribute("user");
		if (to == null) {
			response.sendRedirect("index.jsp");
		} else {
			response.sendRedirect(to);
		}
	}

	private void login(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		PrintWriter out = response.getWriter();
		String u_name = request.getParameter("username");
		String pwd = request.getParameter("password");
		User user = null;
		try {
			user = userService.selectUserByu_naem(u_name);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (user == null
				|| !user.getPwd().equals(
						JiaJieMi.get3DESEncrypt(pwd, MyConstant.SPKEY))) {
			out.write("{\"res\":\"not\"}");
		} else {
			out.write("{\"res\":\"exist\"}");

			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			String redirectUrl = (String) session.getAttribute("redirectUrl");
			if (redirectUrl == null) {
				response.sendRedirect("index.jsp");
				// request.getRequestDispatcher("userSetting.jsp").forward(request,
				// response);
			} else {
				session.removeAttribute(redirectUrl);
				response.sendRedirect(redirectUrl);
			}
		}
	}

	private void showAllUsers(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			/**
			 * //* 到时候还得分页！！！
			 */
			List<User> users = userService.selectAllUser(10);
			request.setAttribute("users", users);
			request.getRequestDispatcher("mgr\\show.jsp").forward(request,
					response);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	private void u_nameDeplicatedCheck(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();

		String u_name = request.getParameter("uname");
		try {
			User selectUserByu_naem = userService.selectUserByu_naem(u_name);
			if (selectUserByu_naem != null) {
				out.write("{\"res\":\"exist\"}");
			} else {
				out.write("{\"res\":\"not\"}");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		out.flush();
		out.close();
	}

	private void login1(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
//		PrintWriter out = response.getWriter();
		String u_name = request.getParameter("username");
		String pwd = request.getParameter("password");
		System.out.println(u_name);
		System.out.println("cupcup".equals(u_name) );
		System.out.println(pwd);
		System.out.println( "Aa123456".equals(pwd));
		System.out.println("cupcup".equals(u_name) && "Aa123456".equals(pwd));
		if ("cupcup".equals(u_name) && "Aa123456".equals(pwd)) {
			request.getSession().setAttribute("cupmgr", u_name);
			response.sendRedirect("mgr/margfirst.jsp");
		}
//		request.getRequestDispatcher("mgr/margfirst.jsp").forward(request, response);
//		PageContext.REQUEST.contextPath
//		System.out.println(request.getContextPath());
//		response.sendRedirect("CupCup/mgr/margfirst.jsp");
//		response.sendRedirect("mgr/margfirst.jsp");

	}

	private void regist(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		PrintWriter out = response.getWriter();

		String u_name = request.getParameter("username");
		String pwd = request.getParameter("password");
		String email = request.getParameter("email");

		User user = new User(u_name, JiaJieMi.get3DESEncrypt(pwd,
				MyConstant.SPKEY), email, new Timestamp(new Date().getTime()));

		try {
			int res = userService.userRegit(user);
			if (res == 1) {
				request.getSession().setAttribute("user", user);
			}
			
			response.sendRedirect("index.jsp");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
