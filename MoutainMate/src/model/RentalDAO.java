package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class RentalDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt = 0;

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
			if (rs != null) {
				rs.close();
			}
			if (rs != null) {
				psmt.close();
			}
			if (rs != null) {
				conn.close();
			}
		} catch (Exception e2) {
			e2.printStackTrace();
		}
	}

	public String sysDate() {
		String sysdate = "";

		try {
			connection();

			String sql = "SELECT SYSDATE FROM DUAL";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			sysdate = rs.getString("SYSDATE");
			
		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			close();
		}
		return sysdate;
	}

	public int deviceRentalStart(String deviceId, String userId) {

		try {
			connection();

			String sysdate = sysDate();
			String date = sysdate.substring(1, 11);
			String time = sysdate.substring(12, 20);

			String sql = "INSERTE INTO RENTAL_TABLE VALUES (?,?,?,?,?)";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, deviceId);
			psmt.setString(2, userId);
			psmt.setString(3, date);
			psmt.setString(4, time);
			psmt.setString(5, " ");

			cnt = psmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public int deviceRentalFinish(String deviceId, String userId, String date) {
		try {
			connection();

			String sysdate = sysDate();
			String time = sysdate.substring(12, 20);

			String sql = "update RENTAL_TABLE set r_return_time=? where p_id=? and user_id=? and rental_date=?";

			psmt = conn.prepareStatement(sql);
			psmt.setNString(1, time);
			psmt.setString(2, deviceId);
			psmt.setString(3, userId);

			cnt = psmt.executeUpdate();
		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
}
