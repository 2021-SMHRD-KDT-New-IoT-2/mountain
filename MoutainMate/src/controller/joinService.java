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
				System.out.println("���Լ���");
				//forward ������� ������ �̵�
				RequestDispatcher rd=request.getRequestDispatcher("MainPage.jsp");
				
				//request������ ����ؾ��� ������ ����
				request.setAttribute("id", id);
				
				// ������ �̵��� �� request, response ��ü ����
				rd.forward(request, response);
				
				//������Ʈ�� ������� ������ ���� -> �������� getParameter()��
				//response.sendRedirect("join_success.jsp?email="+email);
			}else {
				System.out.println("���Խ���");
				out.println("<script>");
				out.println("alert('���Կ� �����Ͽ����ϴ�.');");
				out.println("history.back();");
				out.println("</script>");
				response.sendRedirect("MainPage.jsp");
			}
		
		
		}
		
	}

}