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
		//��û ������ ���ڵ� ��� ����
		request.setCharacterEncoding("euc-kr");
		
		//��û ������ �޾��ֱ�
		String id = request.getParameter("id");
		
		System.out.println("�������� �Ѿ�� id :"+id);
		
		UserDAO dao = new UserDAO();
		boolean check = dao.idCheck(id);
		
		UserVO vo = new UserVO(id);
		
		PrintWriter out = response.getWriter();
		out.print(check);
		
		response.setContentType("charset=utf-8");
		
		//���� ��ü ����
		HttpSession session = request.getSession();
		session.setAttribute("idcheck", vo);
		
		if(check) {
			System.out.println("�ߺ��Ǵ� id ���� _ ����");		

		}else {
			System.out.println("id ��밡����!_����");

		}
		
		
		
	}

}
