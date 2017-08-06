package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.Exchange;
import bean.Movie;
import bean.Scene;
import bean.Scene2;
import bean.Ticket;
import bean.User;

import com.alibaba.fastjson.JSONObject;

import dao.impl.MovieDaoImpl;
import dao.impl.SceneDaoImpl;
import dao.impl.SeatDaoImpl;
import dao.impl.TicketDaoImpl;

@WebServlet("/gouPiaoController")
public class GouPiaoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private SceneDaoImpl sceneDao = new SceneDaoImpl();
	private TicketDaoImpl ticketDao = new TicketDaoImpl();
	private SeatDaoImpl seatDao = new SeatDaoImpl();
	private int[] a = new int[10];
	private User user;
	Timestamp st1;
	Timestamp st2;
	int ticketscene;
	float pricefloat;
	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String op = request.getParameter("op");
		switch (op) {
		case "gouPiao":
			gouPiao(request, response);
			break;
		case "selectSeat":
			selectSeat(request, response);
			break;
		case "xuanPiao":
			xuanPiao(request, response);
			break;
		case "tiaoZhuan":
			tiaoZhuan(request, response);
			break;
		case "dianYingPiao":
			if(user != null && st2 != null){
				HttpSession sess = request.getSession();
				Movie movie =(Movie) sess.getAttribute("movie");
				for(int i = 1; i <= 4; i++){
					if(a[i] != 0){
						Ticket ticket = new Ticket(st1, st2, a[i], movie.getTitle(), ticketscene, user.getU_id(), pricefloat);
						sess.setAttribute("ticket", ticket);
						try {
							int res = ticketDao.insertTicket(ticket);
							
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				}
				
				request.getRequestDispatcher("ticket.jsp").forward(request, response);
			}	
			break;
		default:
			break;
		}
	}
	
	private void selectSeat(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		String scenestr = (String)session.getAttribute("moviescene");
		int scene = Integer.parseInt(scenestr);
		String zuo1str = request.getParameter("zuo1");
		String zuo2str = request.getParameter("zuo2");
		String zuo3str = request.getParameter("zuo3");
		String zuo4str = request.getParameter("zuo4");
		int zuo1 = Integer.parseInt(zuo1str);
		int zuo2 = Integer.parseInt(zuo2str);
		int zuo3 = Integer.parseInt(zuo3str);
		int zuo4 = Integer.parseInt(zuo4str);
			try {
				if(zuo1 != 0){
				    seatDao.insertSeat(zuo1, scene);
				}
				if(zuo2 != 0){
				    seatDao.insertSeat(zuo2, scene);
				}
				if(zuo3 != 0){
				    seatDao.insertSeat(zuo3, scene);
				}
				if(zuo4 != 0){
				    seatDao.insertSeat(zuo4, scene);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		List<Integer> set = null;
		try {
			set = seatDao.selectSeat(scene);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JSONObject jsonObject = new JSONObject();
		int m = 0;
		for(Integer tep:set){
			jsonObject.put("zuo"+m, tep);
			m++;
		}
		
		PrintWriter out = response.getWriter();
		out.write(jsonObject.toString());
	}

	private void tiaoZhuan(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			String movieid = request.getParameter("movieid");
			int id = Integer.parseInt(movieid);

			HttpSession session = request.getSession();
			MovieDaoImpl movieDao = new MovieDaoImpl();
			Movie mov = movieDao.selectMovieWithId(id);
			request.setAttribute("movie", mov);
			session.setAttribute("movie", mov);

			String stime = request.getParameter("stime");
			String etime = request.getParameter("etime");
			String price = request.getParameter("price");
			String type = request.getParameter("type");
			request.setAttribute("stime", stime);
			request.setAttribute("etime", etime);
			request.setAttribute("price", price);
			request.setAttribute("type", type);
			
			String ticketscenestr = request.getParameter("scene");
			ticketscene = Integer.parseInt(ticketscenestr);
			
			SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			String timenow = sim.format(date);
			String time1 = timenow+" "+stime+":00";
			String time2 = timenow+" "+etime+":00";
			
			st1 = Timestamp.valueOf(time1);
			st2 = Timestamp.valueOf(time2);
			pricefloat = Float.parseFloat(price);
			
			/**
			 * 记录跳转的URL
			 */
			String url = request.getRequestURL().append("?")
					.append(request.getQueryString()).toString();
			session.setAttribute("redirectUrl", url);

			String scene = request.getParameter("scene");
			session.setAttribute("moviescene", scene);
			request.getRequestDispatcher("buy2.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private void xuanPiao(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			String idstr = request.getParameter("id");

			int id = Integer.parseInt(idstr);
			List<Scene> scenelist = sceneDao
					.selectScenesWithScene_id(id);

			MovieDaoImpl movieDao = new MovieDaoImpl();
			Movie mov = movieDao.selectMovieWithId(id);
			request.setAttribute("movie", mov);

			Exchange exchange = new Exchange();
			List<Scene2> change = exchange.change(scenelist);
			request.setAttribute("scene", change);
			request.getRequestDispatcher("xuanpiao.jsp").forward(request,
					response);
		} catch (SQLException e) {
			System.out.println(1);
			e.printStackTrace();

		}
	}

	private void gouPiao(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		HttpSession session = request.getSession();
		String scenestr = (String) session.getAttribute("moviescene");
		user = (User) session.getAttribute("user");
		JSONObject jsonObject = new JSONObject();
		PrintWriter out = response.getWriter();
		if (user == null) {
			// 参考网页：http://bbs.csdn.net/topics/391075053
			// http://www.cnblogs.com/liubkyuan/archive/2013/10/29/3394721.html
			// 重定向后ajax继续执行，不跳转、、、
			 
//			response.sendRedirect("login.jsp");
//			<script>
//			function newDoc(){
//				window.location.assign('http://www.runoob.com')
//			}
//			</script>
//			request.getRequestDispatcher("login.jsp")
//					.forward(request, response);
		 	jsonObject.put("flag", 0);
		}else{
			
			jsonObject.put("flag", -1);
			int scene = Integer.parseInt(scenestr);
			String zuo1str = request.getParameter("zuo1");
			String zuo2str = request.getParameter("zuo2");
			String zuo3str = request.getParameter("zuo3");
			String zuo4str = request.getParameter("zuo4");
			int zuo1 = Integer.parseInt(zuo1str);
			int zuo2 = Integer.parseInt(zuo2str);
			int zuo3 = Integer.parseInt(zuo3str);
			int zuo4 = Integer.parseInt(zuo4str);
			try {
				if (zuo1 != 0) {
					seatDao.insertSeat(zuo1, scene);
					
					a[1] = zuo1;
					
				}
				if (zuo2 != 0) {
					seatDao.insertSeat(zuo2, scene);
					a[2] = zuo2;
					
				}
				if (zuo3 != 0) {
					seatDao.insertSeat(zuo3, scene);
					a[3] = zuo3;
				
				}
				if (zuo4 != 0) {
					seatDao.insertSeat(zuo4, scene);
					a[4] = zuo4;
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			
			
			List<Integer> set = null;
			try {
				set = seatDao.selectSeat(scene);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			int m = 0;
			for (Integer tep : set) {
				jsonObject.put("zuo" + m, tep);
				m++;
			}
		}

		
		
		out.write(jsonObject.toString());
	}

}
