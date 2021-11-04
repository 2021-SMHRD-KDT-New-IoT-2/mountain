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
		
		String deviceid = request.getParameter("deviceid");
		String mountainid = request.getParameter("mountainid");
		System.out.println("���� mountainid"+mountainid);
		
		response.setContentType("text/html;charset=euc-kr");
		
		DeviceDAO dao = new DeviceDAO();
		int cnt =dao.registration(deviceid,mountainid);
	
		if(cnt>0) {
			System.out.println("���� :����� ����");
			//forward ������� ������ �̵�
			RequestDispatcher rd=request.getRequestDispatcher("DeviceMGR.jsp");
			
			//request������ ����ؾ��� ������ ����
			request.setAttribute("p_id", deviceid);
			
			// ������ �̵��� �� request, response ��ü ����
			rd.forward(request, response);
			
			//������Ʈ�� ������� ������ ���� -> �������� getParameter()��
			//response.sendRedirect("join_success.jsp?email="+email);
		}else {
			System.out.println("���Խ���");

			response.sendRedirect("DeviceMGR.jsp");
		}
	
		
	}

}
