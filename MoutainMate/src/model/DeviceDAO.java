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
}
