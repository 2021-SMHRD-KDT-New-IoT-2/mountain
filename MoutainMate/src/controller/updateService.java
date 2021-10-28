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
		request.setCharacterEncoding("euc-kr"); //��û�������� ���ڵ� ��� ����
		
		HttpSession session=request.getSession(); //���� ��ü ����
		UserVO vo=(UserVO)session.getAttribute("member");//���� �α����� �������(������) ����
		
		//������ ����� ����
		String pw=request.getParameter("pw");
		String name=request.getParameter("name");
		String phoneNumber=request.getParameter("phoneNumber");
		String birth=request.getParameter("birth");
		String gender=request.getParameter("gender");
		
		
		//dao ��� ȣ�� -> ���� ���θ� �Ǵ� �� �� �ִ� �� ��ȯ
		// ���� ������ ��쿡�� �ܼ� -> "��������!"
		// ���� ������ ��쿡�� �ܼ� -> "���� ����!"
		
		UserDAO dao = new UserDAO();
		
}

}