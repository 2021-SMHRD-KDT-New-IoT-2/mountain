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
		
		//ȸ������ ��� ȣ��
		//���� �Ϸ� -> �����Ϸ�! �ܼ�â�� ���
		//���� �̿Ϸ� -> ���� ����! �ܼ�â�� ���
		UserDAO dao = new UserDAO();
		int cnt=dao.delete(id);
		
		if(cnt>0) {
			System.out.println("��������");
			//forward ������� ������ �̵�
			response.sendRedirect("MemberList.jsp");
			
		}else {
			System.out.println("��������");
			
			response.sendRedirect("MemberList.jsp");
		}
	}

}