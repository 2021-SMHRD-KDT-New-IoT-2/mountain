package model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DeviceDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	UserVO vo =null;
	int cnt = 0;	
	ArrayList<UserVO> arr =null;

	public void connection() { // db����
		try {
			// 1. ����̺� �����ε�
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			// �ص����� �ֽ� db ��ũ �������ּ���
//			url: project-db-stu.ddns.net
//			port: 1524
//			user: campus_b_1_1025
//			password: smhrd1
			String user = "campus_b_1_1025";
			String password = "smhrd1";

			// 2. ������ ���� ��ü (Connection)����
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("�������");
		}
	}
	

	public void close() {
		try {
			if(rs!=null) {
				rs.close();
			}
			if(rs!=null) {
			psmt.close();
			}
			if(rs!=null) {
			conn.close();
			} 
		} catch (Exception e2) {
			e2.printStackTrace();
		}
	}
	
	
}