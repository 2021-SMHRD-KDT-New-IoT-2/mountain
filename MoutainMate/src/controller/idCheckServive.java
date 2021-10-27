package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UserDAO;


@WebServlet("/idCheckServive")
public class idCheckServive extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");

		System.out.println(id);

		UserDAO dao = new UserDAO();
		boolean check = dao.idCheck(id);

		// ��½�Ʈ��(���)
		PrintWriter out = response.getWriter();
		// ��θ� ���ؼ� ���䵥���͸� ���
		out.print(check);
	}

}