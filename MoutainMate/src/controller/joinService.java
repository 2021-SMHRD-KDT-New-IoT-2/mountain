package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UserDAO;


@WebServlet("/joinService")
public class joinService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("euc-kr");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String pNum = request.getParameter("phoneNumber");
		String birth = request.getParameter("birth");
		String gender = request.getParameter("gender");
		String manager = request.getParameter("manager");
		
		UserDAO dao = new UserDAO();
		int cnt =dao.join(id, name, pw, pNum, birth, gender);
		
		if(cnt>0) {
			System.out.println("가입성공");
			//페이지 이동
			RequestDispatcher rd = request.getRequestDispatcher("MainPage.jsp");
			request.setAttribute("id", id);
			rd.forward(request, response);
			
		}else {
			System.out.println("가입실패");
			response.sendRedirect("MainPage.jsp");
		}
	}

}
