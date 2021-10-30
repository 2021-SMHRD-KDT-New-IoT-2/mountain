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
		HttpSession session = request.getSession();
		request.setCharacterEncoding("euc-kr");
		UserVO vo = (UserVO) session.getAttribute("User");
		
		String id = vo.getid();
		String voname = vo.getname();
		String vophoneNumber = vo.getphoneNumber();
		String vobirth = vo.getbirth();
		String vogender = vo.getgender();
		
		
		
		//수정에 사용할 정보
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phoneNumber = request.getParameter("phoneNumber");
		String birth = request.getParameter("birth");
		String gender = request.getParameter("gender");
		
		if(name.equals("")) {
			name=voname;
		}
		if(phoneNumber.equals("")) {
			phoneNumber=vophoneNumber;
		}
		if(birth.equals("")) {
			birth = vobirth;
		}
		if(gender==null){
			gender = vogender;
		}
		
		System.out.println(pw + " "+ name + " "+phoneNumber + " "+birth+ " "+ gender);
		
//		if(gender.equals("man")) {
//			gender="0";
//		}else if(gender.equals("woman")) {
//			gender="1";
//		}
//		
		UserDAO dao = new UserDAO();
		int cnt=dao.update(pw, name, phoneNumber,birth, gender,id);
		UserVO vo2 = new UserVO(id, name, phoneNumber, birth, gender, pw);
		
		if(cnt>0) {
			System.out.println("서블릿 수정 성공");
		
			session.setAttribute("User", vo2);
	
//			response.sendRedirect("UserInfo.jsp");
		}else {
			System.out.println("서블릿 수정실패");
			response.sendRedirect("UserInfo.jsp");
		}
		
}

}