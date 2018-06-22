package controller;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.CORBA.portable.InputStream;

import com.alibaba.fastjson.JSONObject;

import bean.BoxOffice;
import service.BoxOfficeService;
import service.impl.BoxOfficeServiceImpl;
import utils.DownloadURLFile;


@WebServlet("/boxOfficeContrller")
public class BoxOfficeContrller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	BoxOfficeService boxOfficeService = new BoxOfficeServiceImpl();
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String op = request.getParameter("op");
		switch (op) {
		case "showRank":
			showRank(response);
			break;
		case "spiderRank":
			long time = new Date().getTime();
			String urlStr ="http://www.cbooo.cn/BoxOffice/GetHourBoxOffice";
//			System.out.println(urlStr);
			URL url = new URL(urlStr);    
	        HttpURLConnection conn = (HttpURLConnection)url.openConnection();    
	                //设置超时间为3秒  
	        conn.setConnectTimeout(3*1000);  
	        //防止屏蔽程序抓取而返回403错误  
	        conn.setRequestProperty("User-Agent", "Mozilla/4.0 (compatible; MSIE 5.0; Windows NT; DigExt)");  
	  
	        //得到输入流  
	        java.io.InputStream inputStream = conn.getInputStream();    
	        //获取自己数组
	        StringBuffer sb = new StringBuffer();
	        int len=-1;
	        byte[] buf = new byte[1024];
	        while((len=inputStream.read(buf))!= -1){
	        	sb.append(new String(buf, 0, len, "UTF-8"));
	        }
	  
	        //文件保存位置  
//	        System.out.println("*******"+new String(sb.toString().getBytes()));
	        response.getWriter().write(sb.toString());
			
			break;

		default:
			break;
		}
	}

	private void showRank(HttpServletResponse response) throws IOException {
		try {
			List<BoxOffice> boxOffices = boxOfficeService.selectAllBoxOffices();
			
			JSONObject jsonBoxOffices = new JSONObject();
//				for(BoxOffice boxOffice : boxOffices){
//				for(int i=0; i < jsonBoxOffices.size(); i++){
//					jsonBoxOffices.put("box", boxOffices.get(i));
//					jsonBoxOffices.put("box"+i, boxOffices.get(i));
//				}
			response.getWriter().write(JSONObject.toJSONString(boxOffices));
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
