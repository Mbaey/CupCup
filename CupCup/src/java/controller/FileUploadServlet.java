package controller;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet("/FileUploadServlet")
public class FileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Part part = request.getPart("MyFirstUp");
		String realPath = getServletContext().getRealPath("/upload");
		
		System.out.println(realPath);
		String fileName = UUID.randomUUID().toString();
		String cd = part.getHeader("Content-Disposition");
		String suffix = cd.substring(cd.lastIndexOf('.'),cd.length()-1);
		String  s= "upload/"+fileName+suffix;
		part.write( realPath + "/"+fileName+suffix);
//		 Part part = request.getPart("MyFirstUp");  
//         PrintWriter out = response.getWriter();  
//         out.println("此文件的大小："+part.getSize()+"<br />");  
//         out.println("此文件类型："+part.getContentType()+"<br />");  
//         out.println("文本框内容："+request.getParameter("name")+"<br />");  
//         out.println(UploadUtil.getFileName(part)+"<br />");  
//         part.write("F:\\1."+UploadUtil.getFileType(part));  
	}

}
