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
			psmt.close();
			conn.close();
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

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("dao����");
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

// id �ߺ�üũ
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
				System.out.println("�ߺ��Ǵ� id�� �ֽ��ϴ�.");
			} else {
				System.out.println("dao id ��밡��");
			}

		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			// 1. ��������
			// 2. ����ó��
			close();
		}
		return check;
	}

// �뿩
	public String sysDate() {
		String sysdate = "";

		try {
			connection();
			System.out.println("sysdate �޼ҵ� �ȿ� ����");

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
				System.out.println("dao - �̹� ��Ż��");
			} else {
				System.out.println("dao - ��밡�ɱ��");
			}

		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			// 1. ��������
			// 2. ����ó��
			close();
		}
		return check;
	}

	public int deviceRentalStart(String deviceId, String userId) {

		try {
			connection();

			String sysdate = sysDate();
			String date = sysdate.substring(0, 10);
			String time = sysdate.substring(11);

			System.out.println(date + "/" + time);

			String sql = "insert into RENTAL_TABLE values(?,?,?,?,?)";
			System.out.println("dao sql �ۼ�");
			psmt = conn.prepareStatement(sql);
			System.out.println("dao sql �ѷ��ֱ�");

			psmt.setString(1, deviceId);
			psmt.setString(2, userId);
			psmt.setString(3, date);
			psmt.setString(4, time);
			psmt.setString(5, "0");

			cnt = psmt.executeUpdate();
			System.out.println("dao �뿩 ���� - �뿩���̺� �Է� �Ϸ�");
			
		} catch (Exception e) {
			System.out.println("dao �뿩 ����");
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public int deviceRentalFinish(String deviceId, String userId) {
		try {
			connection();

			String sysdate = sysDate();
			String date = sysdate.substring(0, 10);
			String time = sysdate.substring(11);

			String sql = "update RENTAL_TABLE set r_return_time=? where p_id=? and user_id=? and rental_date=?";

			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, time);
			psmt.setString(2, deviceId);
			psmt.setString(3, userId);
			psmt.setString(4, date);

			cnt = psmt.executeUpdate();
			System.out.println("dao �ݳ� �Ϸ� - �뿩���̺� �Է� �Ϸ�");
		} catch (Exception e) {
			System.out.println("dao �ݳ� ����");
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
}
