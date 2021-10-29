package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import model.UserDAO;
import model.UserVO;


@WebServlet("/IdCheck")
public class IdCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청 데이터 인코딩 방식 지정
		request.setCharacterEncoding("euc-kr");
		
		//요청 데이터 받아주기
		String id = request.getParameter("id");
		
		System.out.println("서블릿으로 넘어온 id :"+id);
		
		UserDAO dao = new UserDAO();
		boolean check = dao.idCheck(id);
		
		UserVO vo = new UserVO(id);
		
		PrintWriter out = response.getWriter();
		out.print(check);
		
		response.setContentType("charset=utf-8");
		
		//세션 객체 생성
		HttpSession session = request.getSession();
		session.setAttribute("idcheck", vo);
		
		if(check) {
			System.out.println("중복되는 id 있음 _ 서블릿");		

		}else {
			System.out.println("id 사용가능함!_서블릿");

		}
		
		
		
	}

}
