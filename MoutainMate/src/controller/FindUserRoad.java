package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;
import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.google.gson.Gson;

import model.UserDAO;
import model.UserVO;

@WebServlet("/FindUserRoad")
public class FindUserRoad extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		UserDAO dao = new UserDAO();
		ArrayList<Integer>  clearRoadTable = dao.userClearRoad(id);
	
	
		response.setContentType("text/html;charset=UTF-8");

		System.out.println("¼­ºí¸´ clearRoadTable : "+clearRoadTable.toString());
		
		PrintWriter out = response.getWriter();
		out.print(clearRoadTable.toString());
	}

}
