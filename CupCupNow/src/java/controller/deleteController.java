package controller;

import java.io.IOException;
import java.sql.SQLException;
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

import bean.Comment;
import bean.Ticket;
import bean.User;
import service.CommentService;
import service.TicketService;
import service.UserService;
import service.impl.CommentServiceImpl;
import service.impl.TicketServiceImpl;
import service.impl.UserServiceImpl;
import utils.JiaJieMi;
import utils.MyConstant;


@MultipartConfig
@WebServlet("/user/deleteController")
public class deleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static UserService userService = new UserServiceImpl();
	private static CommentService commentService = new CommentServiceImpl();
	private static TicketService ticketService = new TicketServiceImpl();
   
    public deleteController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String op = request.getParameter("op");
		switch (op) {
		case "userping":
			userping(request, response);	
			break;
		case "deleteping":
			deletecomment(request, response);
			break;
		case "movieshow":
			movieshow(request, response);
			break;
		case "Setting":
			setting(request, response);
			break;
		case "deletemovie":
			String u_idstr = request.getParameter("u_id");
			int u_id = Integer.parseInt(u_idstr);
			try {
				int res = ticketService.deleteTicketsWithu_id(u_id);
				if(res == 1){
					request.setAttribute("yes", "yes");
					System.out.println("ff");
					
					request.getRequestDispatcher("userSetting2.jsp").forward(request, response);
				}else{
					System.out.println("no");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			

		default:
			break;
		}
	}


	private void setting(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		try {
			User user = (User) request.getSession().getAttribute("user");
			String im = request.getParameter("file");
			System.out.println(im);
			Part part = request.getPart("file");
			if (part != null) {
				String realPath = getServletContext()
						.getRealPath("/upload");

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
				user.setPwd(JiaJieMi.get3DESEncrypt(userpwd,
						MyConstant.SPKEY));
			}
			String tel = request.getParameter("tel");
			if (!"".equals(tel)) {
				user.setTel(tel);
			}
			String email = request.getParameter("email");
			if (!"".equals(email)) {
				user.setEmail(email);
			}

			int res = userService.updateUser(user);
			
			request.getSession().setAttribute("user", user);
			request.getRequestDispatcher("userSetting1.jsp").forward(
					request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	private void movieshow(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		try {
			 Ticket tickets = ticketService.selectTicketsWithu_id(user.getU_id());
			request.setAttribute("tickets", tickets);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		try {
			request.getRequestDispatcher("userSetting2.jsp").forward(request,
					response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	private void deletecomment(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
			
			request.getRequestDispatcher("userSetting3.jsp").forward(request, response);
		}else{
			System.out.println("no");
		}
	}
	private void userping(HttpServletRequest request,
			HttpServletResponse response)  {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		try {
			List<Comment> comment =  commentService.selectCommentWithu_id(user.getU_id());
			request.setAttribute("comment", comment);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		try {
			request.getRequestDispatcher("userSetting3.jsp").forward(request,
					response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


}
