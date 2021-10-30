package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UserDAO;
import model.UserVO;


@WebServlet("/updateService")
public class updateService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr"); //요청데이터의 인코딩 방식 지정

		
		//수정에 사용할 정보
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		String name=request.getParameter("name");
		String phoneNumber=request.getParameter("phoneNumber");
		String birth= request.getParameter("birth");
		String gender= request.getParameter("gender");
		
		if(gender.equals("man")) {
			gender="0";
		}else if(gender.equals("woman")) {
			gender="1";
		}
		
		UserDAO dao = new UserDAO();
		int cnt=dao.update(pw, name, phoneNumber,birth, gender,id);//생일 
		
		UserVO vo = new UserVO(id, name, phoneNumber, birth, gender, pw);
		
		if(cnt>0) {
			System.out.println("서블릿 수정 성공");
			HttpSession session = request.getSession();

			// 세션 값 설정
			session.setAttribute("User", vo);

			//forward 방식으로 페이지 이동
			RequestDispatcher rd=request.getRequestDispatcher("MainPage.jsp");
			
			//request영역에 기억해야할 데이터 설정
			request.setAttribute("id", id);
			
			// 페이지 이동할 시 request, response 객체 전달
			rd.forward(request, response);


		}else {
			System.out.println("서블릿 수정실패");
			response.sendRedirect("UserInfo.jsp");
		}
		
}

}