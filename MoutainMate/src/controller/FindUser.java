package controller;

import java.io.IOException;
import java.io.PrintWriter;

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

@WebServlet("/FindUser")
public class FindUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");


		UserDAO dao = new UserDAO();
		int level = dao.userClearLevel(id);
		float userTotalTime = dao.userTotalTime(id);
		

		System.out.println("선택한 id : " + id + "/ 레벨 : " + level + "/ 총시간 : " + userTotalTime);
		
		UserVO vo = new UserVO(id,level,userTotalTime);
		JSONObject uservo = new JSONObject();
		
		String ttime = String.format("%.1f", userTotalTime);
		
		try {
			uservo.put("id",id);
			uservo.put("level", level);
			uservo.put("totalTime", ttime);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		response.setContentType("text/html;charset=UTF-8");

		System.out.println("서블릿 uservo : "+uservo.toString());
		PrintWriter out = response.getWriter();
		out.print(uservo.toString());
	}

}
