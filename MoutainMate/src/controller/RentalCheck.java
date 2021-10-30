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
		//요청 데이터 인코딩 방식 지정
				request.setCharacterEncoding("euc-kr");
				
				//요청 데이터 받아주기
				String deviceid = request.getParameter("deviceid");

				
				System.out.println("서블릿으로 넘어온 id :"+deviceid);
				
				DeviceDAO dao = new DeviceDAO();
				boolean check = dao.rentalCheck(deviceid);
				
				DeviceVO vo = new DeviceVO(deviceid);
				
				PrintWriter out = response.getWriter();
				out.print(check);
				
				response.setContentType("charset=utf-8");
				
				//세션 객체 생성
				HttpSession session = request.getSession();
				session.setAttribute("idcheck", vo);
				
				if(check) {
					System.out.println("서블릿 - 이미 대여된 기기입니다.");		

				}else {
					System.out.println("서블릿 - 사용가능한 기기입니다.");

				}
	}

}
