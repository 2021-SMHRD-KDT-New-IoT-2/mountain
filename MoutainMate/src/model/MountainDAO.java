package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MountainDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	MountainVO vo = null;
	int cnt = 0;
	ArrayList<MountainVO> arr = null;

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

	// ȸ�� �˻�
	public ArrayList<MountainVO> selectAll() {
		arr = new ArrayList<MountainVO>();
		try {
			connection();

			String sql = "select * from M_TABLE";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
	
			while (rs.next()) {
				System.out.println("mountain dao rs�� ���� ");
				String m_id = rs.getString("M_ID");
				String m_name = rs.getNString("M_NAME");

				vo = new MountainVO(m_id, m_name);
				System.out.println(vo.getM_name());
				
				arr.add(vo);

			}

		} catch (Exception e) {
			System.out.println("dao ����ȸ����");
			e.printStackTrace();
		} finally {
			// 1. ��������
			// 2. ����ó��
			close();
		}
		return arr;
	}

}
