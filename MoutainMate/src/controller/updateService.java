package controller;

import java.io.IOException;
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
		
		HttpSession session=request.getSession(); //세션 객체 생성
		UserVO vo=(UserVO)session.getAttribute("User");//현재 로그인한 사용자의(수정전) 정보
		String id =vo.getid(); //현재 로그인한 id
		
		//수정에 사용할 정보
		String pw=request.getParameter("pw");
		String name=request.getParameter("name");
		String phoneNumber=request.getParameter("phoneNumber");
		String birth= request.getParameter("birth");
		String gender= request.getParameter("gender");
		
		
		
		//dao 기능 호출 -> 수정 여부를 판단 할 수 있는 값 반환
		// 수정 성공일 경우에는 콘솔 -> "수정성공!"
		// 수정 실패일 경우에는 콘솔 -> "수정 실패!"
		
		UserDAO dao = new UserDAO();
		int cnt=dao.update(pw, name, phoneNumber, gender,id);//생일 
		if(cnt>0) {
			System.out.println("수정 성공");
			UserVO vo2 = new UserVO(name, phoneNumber, birth, gender, id);
			session.setAttribute("User", vo2);
			response.sendRedirect("UserInfo.jsp");
		}else {
			System.out.println("수정실패");
			response.sendRedirect("UserInfo.jsp");
		}
		
}

}