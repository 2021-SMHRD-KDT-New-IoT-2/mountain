package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UserDAO;


@WebServlet("/deleteService")
public class deleteService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id =request.getParameter("id");
		
		//회원삭제 기능 호출
		//삭제 완료 -> 삭제완료! 콘솔창에 출력
		//삭제 미완료 -> 삭제 실패! 콘솔창에 출력
		UserDAO dao = new UserDAO();
		int cnt=dao.delete(id);
		
		if(cnt>0) {
			System.out.println("삭제성공");
			//forward 방식으로 페이지 이동
			response.sendRedirect("MemberList.jsp");
			
		}else {
			System.out.println("삭제실패");
			
			response.sendRedirect("MemberList.jsp");
		}
	}

}