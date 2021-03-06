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
	DeviceVO vo = null;
	int cnt = 0;
	ArrayList<DeviceVO> arr = null;

	public void connection() { // db연결
		try {
			close();
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

	public int registration(String p_id, String m_id) {

		try {
			connection();

			String sql = "insert into p_table values(?,?)";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, p_id);
			psmt.setString(2, m_id);
			
			System.out.println(p_id +" / "+ m_id);
			
			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("dao실패");
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

// id 중복체크
	public boolean idCheck(String id) {
		boolean check = true;
		try {
			connection();

			System.out.println(id);
			String sql = "select * from P_TABLE where P_ID=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);

			rs = psmt.executeQuery();
			check = rs.next();
			System.out.println(check);

			if (check) {
				System.out.println("중복되는 id가 있습니다.");
			} else {
				System.out.println("dao id 사용가능");
			}

		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			// 1. 지역변수
			// 2. 예외처리
			close();
		}
		return check;
	}

// 대여
	public String sysDate() {
		String sysdate = "";

		try {
			connection();
			System.out.println("sysdate 메소드 안에 들어옴");

			String sql = "SELECT SYSDATE+9/24 FROM DUAL";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			sysdate = rs.getString(1);

			System.out.println(sysdate);
			System.out.println(sysdate.substring(0, 10));
			System.out.println(sysdate.substring(11));

		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			close();
		}
		return sysdate;
	}

	public boolean rentalCheck(String deviceId) {
		boolean check = true;
		try {
			connection();
	
			String sql = "select * from RENTAL_TABLE where p_id=? and r_return_time=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, deviceId);
			psmt.setString(2, "0");
			
			System.out.println(sql);
			rs = psmt.executeQuery();
			check = rs.next();
			
			System.out.println("dao check:"+check);
			
			if (check) {
				System.out.println("dao - 이미 랜탈중");
			} else {
				System.out.println("dao - 사용가능기기");
			}

		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			// 1. 지역변수
			// 2. 예외처리
			close();
		}
		return check;
	}

	public int deviceRentalStart(String deviceId, String userId) {

		try {
			String sysdate = sysDate();
			String date = sysdate.substring(0, 10);
			String time = sysdate.substring(11);
			
			connection();

			System.out.println(date + "/" + time);

			String sql = "insert into RENTAL_TABLE values(?,?,?,?,?)";
			System.out.println("dao sql 작성");
			psmt = conn.prepareStatement(sql);
			System.out.println("dao sql 뿌려주기");

			psmt.setString(1, deviceId);
			psmt.setString(2, userId);
			psmt.setString(3, date);
			psmt.setString(4, time);
			psmt.setString(5, "0");

			cnt = psmt.executeUpdate();
			System.out.println("dao 대여 시작 - 대여테이블 입력 완료");
			
		} catch (Exception e) {
			System.out.println("dao 대여 실패");
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public int deviceRentalFinish(String deviceId, String userId) {
		try {
			
			String sysdate = sysDate();
			String date = sysdate.substring(2, 10);
			String time = sysdate.substring(11);

			connection();
			
			String sql = "update RENTAL_TABLE set r_return_time=? where p_id=? and user_id=? and rental_date=?";

			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, time);
			psmt.setString(2, deviceId);
			psmt.setString(3, userId);
			psmt.setString(4, date);
			
			cnt = psmt.executeUpdate();
			
			System.out.println("dao 반납 완료 - 대여테이블 입력 완료/ cnt = "+cnt);
			
		} catch (Exception e) {
			System.out.println("dao 반납 실패");
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
}
