package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DeviceDAO;
import model.DeviceVO;

@WebServlet("/RentalCheck")
public class RentalCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//��û ������ ���ڵ� ��� ����
				request.setCharacterEncoding("euc-kr");
				
				//��û ������ �޾��ֱ�
				String deviceid = request.getParameter("deviceid");

				
				System.out.println("�������� �Ѿ�� id :"+deviceid);
				
				DeviceDAO dao = new DeviceDAO();
				boolean check = dao.rentalCheck(deviceid);
				
				DeviceVO vo = new DeviceVO(deviceid);
				
				PrintWriter out = response.getWriter();
				out.print(check);
				
				response.setContentType("charset=utf-8");
				
				//���� ��ü ����
				HttpSession session = request.getSession();
				session.setAttribute("idcheck", vo);
				
				if(check) {
					System.out.println("���� - �̹� �뿩�� ����Դϴ�.");		

				}else {
					System.out.println("���� - ��밡���� ����Դϴ�.");

				}
	}

}
