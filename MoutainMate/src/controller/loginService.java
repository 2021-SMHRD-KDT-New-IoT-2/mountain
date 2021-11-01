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

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		System.out.println("main에서 dao로 넘어온 값 : " + id + " " + pw);

		UserDAO dao = new UserDAO();

		UserVO vo = dao.login(id, pw);
		response.setContentType("text/html;charset=euc-kr");

		if (vo != null) {
			System.out.println("서블릿 vo 값 넘어감");
			vo=dao.selectOne(id);
				
			HttpSession session = request.getSession();

			session.setAttribute("User", vo);

			response.sendRedirect("MainPage.jsp");
		} else {
			response.sendRedirect("MainPage.jsp");

		}

	}

}