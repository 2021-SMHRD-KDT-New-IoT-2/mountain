package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UserDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	UserVO vo =null;
	boolean check = false;
	ArrayList<UserVO> arr =null;
	int cnt = 0;

	public void connection() { // db연결
		try {
			// 드라이브 핸들링
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String user = "campus_b_1_1025";
			String password = "smhrd1";

			// 데이터 연결 객체(Connection생성)
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("연결 실패");
		}
	}

	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e2) {
			e2.printStackTrace();
		}
	}

	// 회원가입 기능
	public int join(String id, String pw, String name, String phoneNumber, String birth, String gender,
			String manager) {

		try {
			connection();

			String sql = "insert into user_table value(?,?,?,?,?,?,?)";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, id);
			psmt.setString(2, pw);
			psmt.setString(3, name);
			psmt.setString(4, phoneNumber);
			psmt.setString(5, birth);
			psmt.setString(6, gender);
			psmt.setString(7, manager);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("가입실패");
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	//로그인
	public UserVO login(String id, String pw) {

		try {
			connection();

			String sql = "select id, tel, address from user_table where id=? and pw=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);

			rs = psmt.executeQuery();
			boolean check = rs.next();

			if (check == true) {
				System.out.println("로그인성공");

				String get_id = rs.getString("id");
				String get_name = rs.getString("name");
				String get_phoneNumber = rs.getString("phoneNumber");
				String get_birth = rs.getString("birth");
				String get_gender = rs.getString("gender");
				String get_manager = rs.getString("manager");

				vo=new UserVO(get_id, get_name, get_phoneNumber, get_birth,
						get_gender, get_manager);

			} else {

				System.out.println("로그인실패");

			}

		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			// 1. 지역변수
			// 2. 예외처리
			close();
		}
		return vo;
	}
	
	//회원 수정
	public int update( String id,String pw, String name, String phoneNumber, String birth, String gender, String manager) {
		
		try {

			connection();
			// 3. 실행할 sql문 정의 (실행할때마다 값이 달라지는부분은 ?적어두면 됨
			String sql = "update user_table  set pw =?, name=?, phoneNumber=?, birth=?, gender=?,manager=? where id=?";

			// 4. sql 실행객체(PreparedStatemnent)생성
			psmt = conn.prepareStatement(sql);

			// 5. 바인드변수 (?) 채우기
			psmt.setString(1, pw);
			psmt.setString(2, name);
			psmt.setString(3, phoneNumber);
			psmt.setString(4, gender);
			psmt.setString(5, manager);
			psmt.setString(6, id);

			// 6. sql문 실행 후 결과 처리
			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("수정실패");
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	//중복체크
	public boolean idCheck(String id) {
		try {
			connection();

			String sql = "select id from user_table where id=? ";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			

			rs = psmt.executeQuery();
			

			if (rs.next()) {
				//입력한 이메일을 사용 할 수 없을 때
				check=true;
			} else {
				//입력한 이메일을 사용할 수 있을 때 
				
				check=false;
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
	
	//특정회원삭제
	public int delete(String id) {
		try {

			connection();
			// 3. 실행할 sql문 정의 (실행할때마다 값이 달라지는부분은 ?적어두면 됨
			String sql = "delete from user_table where id=?";

			// 4. sql 실행객체(PreparedStatemnent)생성
			psmt = conn.prepareStatement(sql);

			// 5. 바인드변수 (?) 채우기
			psmt.setString(1, id);
			

			// 6. sql문 실행 후 결과 처리
			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("삭제실패");
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	//회원 검색
	public ArrayList<UserVO> selectAll() {
		arr = new ArrayList<UserVO>();
		try {
			connection();

			String sql = "select id, name, phoneNumber, birth, gender, manager from user_table";
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			

			while (rs.next()) {
			

				String get_id = rs.getString("id");
				String get_name = rs.getString("name");
				String get_phoneNumber = rs.getString("phoneNumber");
				String get_birth = rs.getString("birth");
				String get_gender = rs.getString("gender");
				String get_manager = rs.getString("manager");

				vo = new UserVO(get_id, get_name, get_phoneNumber, 
						get_birth, get_gender, get_manager);
				arr.add(vo);
			
			} 

		} catch (Exception e) {
			System.out.println("조회실패");
			e.printStackTrace();
		} finally {
			// 1. 지역변수
			// 2. 예외처리
			close();
		}
		return arr;
	}
}