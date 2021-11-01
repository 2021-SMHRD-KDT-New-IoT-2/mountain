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
		HttpSession session = request.getSession();
		request.setCharacterEncoding("euc-kr");
		UserVO vo = (UserVO) session.getAttribute("User");
		String id = vo.getid();
		
		
		// ��û ������ �޾��ֱ�
		String pw = request.getParameter("pw");
		System.out.println("�������� �Ѿ�� id :" + id);
		System.out.println("�������� �Ѿ�� pw :" + pw);

		UserDAO dao = new UserDAO();
		boolean check = dao.pwCheck(id, pw);

		UserVO vo2 = new UserVO(id,pw);
		
		PrintWriter out = response.getWriter();
		out.print(check);
		
		response.setContentType("charset=euc-kr");
		
		//���� ��ü ����
		
		session.setAttribute("pwcheck", vo2);

		if (check) {
			System.out.println(" ��й�ȣ ���� _ ����");

		} else {
			System.out.println("��й�ȣ ��������_����");

		}

	}

}