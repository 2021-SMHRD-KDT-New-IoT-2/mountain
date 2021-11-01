package controller;

import java.io.IOException;

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

import com.google.gson.Gson;

import model.UserDAO;
import model.UserVO;

@WebServlet("/FindUser")
public class FindUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");

		String id = request.getParameter("id");

		response.setContentType("text/html;charset=euc-kr");

		UserDAO dao = new UserDAO();
		int level = dao.userClearLevel(id);
		int userTotalTime = dao.userTotalTime(id);

		System.out.println("선택한 id : " + id + "/ 레벨 : " + level + "/ 총시간 : " + userTotalTime);
		
		UserVO vo = new UserVO(id,level,userTotalTime);
		
		JSONObject uservo = new JSONObject();
		JSONArray jArray = new JSONArray();
		
		try {
			uservo.put("id",id);
			uservo.put("level", level);
			uservo.put("totalTime", userTotalTime);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		jArray.add(uservo);
		
	}

}
