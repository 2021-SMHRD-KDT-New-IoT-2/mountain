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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.google.gson.Gson;

import model.MountainDAO;
import model.MountainVO;

@WebServlet("/selectRoad")
public class selectRoad extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");

		String select_mountain = request.getParameter("select_mountain");

		System.out.println("select_mountain : "+select_mountain);

		MountainDAO dao = new MountainDAO();
		
		System.out.println("¼­ºí¸´ mountaindao »ý¼º");

		ArrayList<MountainVO> al = dao.selectAllroad(select_mountain);
		System.out.println("¼­ºí¸´ selectAllroad Áö³ª¿È");

		MountainVO vo = null;

		Gson gson = new Gson();
		JSONArray jArray = new JSONArray();
		JSONParser parser = new JSONParser();

		for (int i = 0; i < al.size(); i++) {
			vo = al.get(i);
			String jsonString = gson.toJson(vo);
			JSONObject jObj = null;

			try {
				jObj = (JSONObject) parser.parse(jsonString);
				System.out.println("try¹® ÀÔ¼º");

			} catch (Exception e) {
				e.printStackTrace();
			}
			
			jArray.add(jObj);
		}
		response.setContentType("text/html;charset=euc-kr");
		
		PrintWriter out = response.getWriter();
		out.print(jArray.toString());
		System.out.println(jArray.toString());


	}

}
