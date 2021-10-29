package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DeviceDAO;
import model.UserDAO;


@WebServlet("/deviceRegiService")

public class deviceRegiService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("euc-kr");
		
		String p_id = request.getParameter("deviceid");
		String m_id = request.getParameter("mountainid");
		
		
		response.setContentType("text/html;charset=euc-kr");
		
		DeviceDAO dao = new DeviceDAO();
		int cnt =dao.registration(p_id,m_id);
	
		if(cnt>0) {
			System.out.println("서블릿 :기기등록 성공");
			//forward 방식으로 페이지 이동
			RequestDispatcher rd=request.getRequestDispatcher("DeviceMGR.jsp");
			
			//request영역에 기억해야할 데이터 설정
			request.setAttribute("p_id", p_id);
			
			// 페이지 이동할 시 request, response 객체 전달
			rd.forward(request, response);
			
			//쿼리스트링 방식으로 데이터 전송 -> 받을때는 getParameter()로
			//response.sendRedirect("join_success.jsp?email="+email);
		}else {
			System.out.println("가입실패");

			response.sendRedirect("DeviceMGR.jsp");
		}
	
		
	}

}
