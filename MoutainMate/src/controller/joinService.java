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

import model.UserDAO;
import model.UserVO;


@WebServlet("/joinService")
public class joinService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("euc-kr");
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phoneNumber = request.getParameter("phoneNumber");
		String birth = request.getParameter("birth");
		String gender = request.getParameter("gender");
		System.out.println( id + " " + pw + " " + name + " " + phoneNumber + " " + birth + " " + gender );
		
		response.setContentType("text/html;charset=euc-kr");
		
		if(id.equals("")) {
			out.println("<script>");
			out.println("alert('Please enter your Email');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			UserDAO dao = new UserDAO();
			int cnt =dao.join(id, pw, name, phoneNumber, birth,Integer.parseInt(gender));
		
			if(cnt>0) {
				System.out.println("가입성공");
				//forward 방식으로 페이지 이동
				RequestDispatcher rd=request.getRequestDispatcher("MainPage.jsp");
				
				//request영역에 기억해야할 데이터 설정
				request.setAttribute("id", id);
				
				// 페이지 이동할 시 request, response 객체 전달
				rd.forward(request, response);
				
				//쿼리스트링 방식으로 데이터 전송 -> 받을때는 getParameter()로
				//response.sendRedirect("join_success.jsp?email="+email);
			}else {
				System.out.println("가입실패");
				out.println("<script>");
				out.println("alert('가입에 실패하였습니다.');");
				out.println("history.back();");
				out.println("</script>");
				response.sendRedirect("MainPage.jsp");
			}
		
		
		}
		
	}

}