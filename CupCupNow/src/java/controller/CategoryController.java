package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Category;
import service.CategoryService;
import service.impl.CategoryServiceImpl;

@WebServlet("/categoryController")
public class CategoryController extends HttpServlet {
	private CategoryService categoryService = new CategoryServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String op = request.getParameter("op");

		switch (op) {
		case "categoriesShow":
			categoriesShow(request, response);
			break;
		case "show":
			try {
				List<Category> types = categoryService.selectAllCateOrderByLevel();
				request.setAttribute("types", types);
				request.getRequestDispatcher("index.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		default:
			break;
		}
	}

	private void categoriesShow(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			List<Category> types = categoryService.selectAllCateOrderByLevel();
			request.setAttribute("types", types);
			request.getRequestDispatcher("mgr/movieAppend.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
