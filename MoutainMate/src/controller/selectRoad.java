package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;

import model.MountainDAO;
import model.MountainVO;

@WebServlet("/selectRoad")
public class selectRoad extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		
		String select_mountain = request.getParameter("select_mountain");
		
		response.setContentType("text/html;charset=euc-kr");
		
		MountainDAO dao = new MountainDAO();
	
		JSONArray jArray= new JSONArray();
		jArray = dao.selectAllroad(select_mountain);
		
//		if (jArray != null) {
//			System.out.println("서블릿 jArray 값 넘어감");
//		
//			RequestDispatcher rd =request.getRequestDispatcher("MainPage.jsp");
//			
//			//request영역에 기억해야할 데이터 설정
//			request.setAttribute("jArray", jArray);
//			
//			// 페이지 이동할 시 request, response 객체 전달
//			rd.forward(request, response);
//			
//		} else {
//			response.sendRedirect("MainPage.jsp");
//
//		}
		
		
		
	}

}
