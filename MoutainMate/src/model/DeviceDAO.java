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

	public void connection() { // db연결
		try {
			// 1. 드라이브 동적로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			// 해도쌤이 주신 db 링크 가져와주세요
//			url: project-db-stu.ddns.net
//			port: 1524
//			user: campus_b_1_1025
//			password: smhrd1
			String user = "campus_b_1_1025";
			String password = "smhrd1";

			// 2. 데이터 연결 객체 (Connection)생성
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("연결실패");
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