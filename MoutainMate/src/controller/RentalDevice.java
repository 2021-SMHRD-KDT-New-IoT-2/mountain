package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.RentalDAO;

@WebServlet("/RentalDevice")
public class RentalDevice extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("euc-kr");
		RequestDispatcher rd=null;
	
		String pid = request.getParameter("pid");
		String id = request.getParameter("id");
		
		response.setContentType("text/html;charset=euc-kr");
		
		RentalDAO rdao = new RentalDAO();
		
		
	}

}
