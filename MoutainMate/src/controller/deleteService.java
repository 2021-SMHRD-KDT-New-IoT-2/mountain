package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.UserDAO;


@WebServlet("/deleteService")
public class deleteService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		
		System.out.println("delete 서블릿 들어옴");
		UserDAO dao = new UserDAO();
		
		
		int cnt = dao.delete(id);

		if(cnt > 0) {
			System.out.println("삭제성공");
			response.sendRedirect("MemberList.jsp");
		}else {
			System.out.println("삭제실패");
		}
	}

}