package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MountainDAO;
import model.MountainVO;
import model.UserDAO;

@WebServlet("/TrailUpdate")
public class TrailUpdate extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String mroad = request.getParameter("mroad");
		
		
		MountainDAO mdao = new MountainDAO();
		
		
		UserDAO dao = new UserDAO();
		
		int cnt = dao.userClearTime(id, mroad);
		
		
		if (cnt > 0) {
			System.out.println("완주등산로 추가 성공");
			response.sendRedirect("Trail.jsp");
		} else {
			System.out.println("완주등산로 추가 실패");
			response.sendRedirect("Trail.jsp");
		}
	}

}
