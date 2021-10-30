package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DeviceDAO;
import model.DeviceVO;
import model.UserDAO;

@WebServlet("/RentalDeviceS")
public class RentalDeviceS extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("euc-kr");
		RequestDispatcher rd = null;

		String deviceid = request.getParameter("deviceid");
		String id = request.getParameter("id");

		System.out.println("서블릿 - 아이디:"+id + " ,디바이스 아이디 :" + deviceid);

		response.setContentType("text/html;charset=euc-kr");

		DeviceDAO dao = new DeviceDAO();
		DeviceVO dvo = new DeviceVO(deviceid);
		
		int cnt = dao.deviceRentalStart(deviceid, id);
		
		System.out.println("서블릿 cnt : "+cnt);
		
		if (cnt > 0) {
			System.out.println("서블릿 - 대여 성공!");
			HttpSession session = request.getSession();

			// 세션 값 설정
			session.setAttribute("RentalId", deviceid);


			rd = request.getRequestDispatcher("RegistrationDevice.jsp");

			request.setAttribute("deviceid", deviceid);

			rd.forward(request, response);

		} else {
			System.out.println("서블릿 - 대여 실패.....");

			response.sendRedirect("RegistrationDevice.jsp");
		}

	}

}
