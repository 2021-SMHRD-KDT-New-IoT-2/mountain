package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

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

	// �� ��ü �˻�
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

	public ArrayList<MountainVO> selectAllroad(String m_id) {
		arr = new ArrayList<MountainVO>();

		try {
			connection();

			String sql = "select * from MROAD_TABLE where M_ID=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, m_id);

			rs = psmt.executeQuery();

			while (rs.next()) {
				System.out.println("mountain dao MROAD rs �� ���� ");

				String mountain_id = rs.getString("M_ID");
				String mroad_id = rs.getNString("road_id");
				String mroad_name = rs.getNString("road_name");

				System.out.println("���� rs.getNString(Mroad_NAME) : " + mroad_name);

				vo = new MountainVO(mountain_id, mroad_id, mroad_name);
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

	public ArrayList<MountainVO> selectAllroad2() {
		arr = new ArrayList<MountainVO>();

		try {
			connection();

			String sql = "select * from MROAD_TABLE";
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				System.out.println("mountain dao MROAD rs �� ���� ");
				String m_id = rs.getString("m_id");
				String mroad_id = rs.getString("road_id");
				String mroad_name = rs.getString("road_name");

				System.out.println("���� rs.getNString(Mroad_NAME) : " + mroad_name);

				vo = new MountainVO(m_id, mroad_id, mroad_name);
				arr.add(vo);

			}

		} catch (Exception e) {
			System.out.println("dao �����ȸ����");
			e.printStackTrace();
		} finally {
			// 1. ��������
			// 2. ����ó��
			close();
		}
		return arr;
	}

	public String findRoadId(String arduino) {
		String mroad_id = "";
		try {
			connection();
			
			System.out.println("dao arduino : "+arduino);
			
			String sql = "select * from arduino_table where arduino=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, arduino);

			rs = psmt.executeQuery();
			rs.next();

			mroad_id = rs.getString("mroad_id");
			
			System.out.println("mountainDAO findRoadId : " + mroad_id);

		} catch (Exception e) {
			System.out.println("dao �����ȸ����");
			e.printStackTrace();
		} finally {
			// 1. ��������
			// 2. ����ó��
			close();
		}
		return mroad_id;
	}
	
	public String[] top5() {
		String[] arr = new String[5];
		try { 
			connection();
		
			String sql = "select * from (select c.road_id, m.road_name, count(c.road_id) as count from clear_table c, mroad_table m where c.road_id = m.road_id and clear_date between sysdate-7 and sysdate+4 group by c.road_id, m.road_name order by count desc)where rownum<=5";
			
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			
			int i = 0;
			while(rs.next()) {
				arr[i]= rs.getString("road_name");
				System.out.println("mountainDAO top5 "+(i+1)+"�� : "+arr[i]);
				i++;
			}
		} catch (Exception e) {
			System.out.println("dao top5 �����ȸ����");
			e.printStackTrace();
		} finally {
			// 1. ��������
			// 2. ����ó��
			close();
		}
		return arr;
	}

}
