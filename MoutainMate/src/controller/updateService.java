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
		request.setCharacterEncoding("euc-kr"); //��û�������� ���ڵ� ��� ����

		
		//������ ����� ����
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
		int cnt=dao.update(pw, name, phoneNumber,birth, gender,id);//���� 
		
		UserVO vo = new UserVO(id, name, phoneNumber, birth, gender, pw);
		
		if(cnt>0) {
			System.out.println("���� ���� ����");
			HttpSession session = request.getSession();

			// ���� �� ����
			session.setAttribute("User", vo);

			//forward ������� ������ �̵�
			RequestDispatcher rd=request.getRequestDispatcher("MainPage.jsp");
			
			//request������ ����ؾ��� ������ ����
			request.setAttribute("id", id);
			
			// ������ �̵��� �� request, response ��ü ����
			rd.forward(request, response);


		}else {
			System.out.println("���� ��������");
			response.sendRedirect("UserInfo.jsp");
		}
		
}

}