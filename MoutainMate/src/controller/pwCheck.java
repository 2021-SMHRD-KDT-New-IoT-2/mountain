package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UserDAO;
import model.UserVO;

@WebServlet("/pwCheck")
public class pwCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("euc-kr");

		// 요청 데이터 받아주기
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		System.out.println("서블릿으로 넘어온 pw :" + pw);

		UserDAO dao = new UserDAO();
		boolean check = dao.pwCheck(id, pw);

		UserVO vo = new UserVO(id,pw);
		
		PrintWriter out = response.getWriter();
		out.print(check);
		
		response.setContentType("charset=utf-8");
		
		//세션 객체 생성
		HttpSession session = request.getSession();
		session.setAttribute("pwcheck", vo);

		if (check) {
			System.out.println(" 비밀번호 맞음 _ 서블릿");

		} else {
			System.out.println("비밀번호 맞지안흠_서블릿");

		}

	}

}