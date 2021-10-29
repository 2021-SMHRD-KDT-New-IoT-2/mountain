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

	// 산 전체 검색
	public ArrayList<MountainVO> selectAll() {
		arr = new ArrayList<MountainVO>();
		try {
			connection();

			String sql = "select * from M_TABLE";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				System.out.println("mountain dao rs값 있음 ");
				String m_id = rs.getString("M_ID");
				String m_name = rs.getNString("M_NAME");

				vo = new MountainVO(m_id, m_name);
				System.out.println(vo.getM_name());

				arr.add(vo);

			}

		} catch (Exception e) {
			System.out.println("dao 산조회실패");
			e.printStackTrace();
		} finally {
			// 1. 지역변수
			// 2. 예외처리
			close();
		}
		return arr;
	}

	// 등산로 전체 검색
//	public ArrayList<MountainVO> selectAllroad(String m_id) {
//		arr = new ArrayList<MountainVO>();
//		try {
//			connection();
//
//			String sql = "select * from MROAD_TABLE where M_ID=" + m_id;
//			psmt = conn.prepareStatement(sql);
//			rs = psmt.executeQuery();
//
//			while (rs.next()) {
//				System.out.println("mountain dao MROAD rs 값 있음 ");
//				String mountain_id = rs.getString("M_ID");
//				String mroad_id = rs.getNString("Mroad_id");
//				String mroad_name = rs.getNString("Mroad_NAME");
//
//				System.out.println("서블릿 rs.getNString('Mroad_NAME') : " + mroad_name);
//
//				vo = new MountainVO(mountain_id, mroad_id, mroad_name);
//
//				System.out.println("서블릿 vo.getMroad_name() : " + vo.getMroad_name());
//
//				arr.add(vo);
//
//			}
//
//		} catch (Exception e) {
//			System.out.println("dao 산조회실패");
//			e.printStackTrace();
//		} finally {
//			// 1. 지역변수
//			// 2. 예외처리
//			close();
//		}
//		return arr;
//	}

	public JSONArray selectAllroad(String m_id) {
		
		JSONArray al = new JSONArray();
		
		try {
			connection();

			String sql = "select * from MROAD_TABLE where M_ID=" + m_id;
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				System.out.println("mountain dao MROAD rs 값 있음 ");
				String mountain_id = rs.getString("M_ID");
				String mroad_id = rs.getNString("Mroad_id");
				String mroad_name = rs.getNString("Mroad_NAME");

				System.out.println("서블릿 rs.getNString('Mroad_NAME') : " + mroad_name);
				
				JSONObject sObject = new JSONObject();
				sObject.put("m_id", mountain_id);
		        sObject.put("mroad_id", mroad_id);
		        sObject.put("mroad_name", mroad_name);
		        
		        al.put(sObject);
		        

				System.out.println("sObject.get(\"m_id\") : " + sObject.get("m_id"));


			}

		} catch (Exception e) {
			System.out.println("dao 산조회실패");
			e.printStackTrace();
		} finally {
			// 1. 지역변수
			// 2. 예외처리
			close();
		}
		return al;
	}

}
