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
import model.UserDAO;

@WebServlet("/RentalDeviceF")
public class RentalDeviceF extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("euc-kr");
		RequestDispatcher rd = null;

		String pid = request.getParameter("deviceid");
		String id = request.getParameter("id");

		System.out.println("¼­ºí¸´ - ¾ÆÀÌµð:"+id + " ,µð¹ÙÀÌ½º ¾ÆÀÌµð :" + pid);

		response.setContentType("text/html;charset=euc-kr");

		DeviceDAO dao = new DeviceDAO();
		int cnt = dao.deviceRentalFinish(pid, id);
		
		System.out.println("¼­ºí¸´ cnt : "+cnt);
		
		if (cnt > 0) {
			System.out.println("¼­ºí¸´ ¹Ý³³ ¼º°ø!");

			rd = request.getRequestDispatcher("RegistrationDevice.jsp");

			request.setAttribute("id", id);

			rd.forward(request, response);

		} else {
			System.out.println("¼­ºí¸´¿¡¼­ ¹Ý³³ ½ÇÆÐ.....");

			response.sendRedirect("RegistrationDevice.jsp");
		}

	}

}
