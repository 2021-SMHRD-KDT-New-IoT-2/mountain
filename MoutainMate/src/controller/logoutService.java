package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/logoutService")
public class logoutService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//세션 삭제(현재 로그인한 사용자의 정보 삭제)
				HttpSession session=request.getSession();
				
				session.removeAttribute("User");
				response.sendRedirect("mainPage.jsp");
			}
	}


