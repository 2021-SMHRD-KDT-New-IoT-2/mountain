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

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String mgr = request.getParameter("mgr");

		System.out.println("main에서 dao로 넘어온 값 : " + id + " " + pw+" "+mgr);

		UserDAO dao = new UserDAO();

		UserVO vo = dao.login(id, pw);

		if (vo != null) {
			// 세션객체생성
			HttpSession session = request.getSession();

			// 세션 값 설정
			session.setAttribute("User", vo);

			response.sendRedirect("MainPage.jsp");
		} else {
			response.sendRedirect("MainPage.jsp");

		}

	}

}