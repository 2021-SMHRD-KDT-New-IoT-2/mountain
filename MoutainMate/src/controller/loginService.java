package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UserDAO;
import model.UserVO;


@WebServlet("/loginService")
public class loginService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("euc-kr");
		
		String id =request.getParameter("id");
		String pw =request.getParameter("pw");
		
		
		UserDAO dao = new UserDAO();
		UserVO vo =dao.login(id, pw);
		
		System.out.println(vo);
		
		if(vo != null) {
			//技记按眉积己
			HttpSession session =request.getSession();
			// 技记 蔼 汲沥
			session.setAttribute("User", vo);
			
			System.out.println("logS");
			response.sendRedirect("MainPage.jsp");
		}else {
			response.sendRedirect("MainPage.jsp");
			System.out.println("logF");
		}
		
}

}