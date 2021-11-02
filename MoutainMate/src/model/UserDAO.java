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
	UserVO vo = null;
	int cnt = 0;
	ArrayList<UserVO> arr = null;

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
			System.out.println("sysdate 메소드 안에 들어옴");

			String sql = "SELECT SYSDATE+9/24 FROM DUAL";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			sysdate = rs.getString(1);
			System.out.println("-------sysdate end--------");

		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			close();
		}
		return sysdate;
	}

	// 회원가입 기능
	public int join(String id, String pw, String name, String phoneNumber, String birth, String gender) {

		try {
			connection();

			String sql = "insert into user_table values(?,?,?,?,?,?,?)";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, id);
			psmt.setString(3, pw);
			psmt.setString(2, name);
			psmt.setString(4, phoneNumber);
			psmt.setString(5, birth);
			psmt.setString(6, gender);
			psmt.setInt(7, 0);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("가입실패");
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	// 로그인
	public UserVO login(String id, String pw) {

		try {
			connection();

			String sql = "select * from user_table where user_id=? and pw=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);

			rs = psmt.executeQuery();

			if (rs.next()) {
				String mgr = rs.getString("mgr");

				System.out.println("dao 로그인성공 mgr : " + mgr);
				vo = new UserVO(id, pw, mgr);

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

	// 회원 수정
	public int update(String pw, String name, String phoneNumber, String birth, String gender, String id) {

		try {

			connection();
			// 3. 실행할 sql문 정의 (실행할때마다 값이 달라지는부분은 ?적어두면 됨
			String sql = "update user_table set pw =?, user_name=?, user_num=?, birth=?, gender=? where user_id=?";

			// 4. sql 실행객체(PreparedStatemnent)생성
			psmt = conn.prepareStatement(sql);

			// 5. 바인드변수 (?) 채우기
			psmt.setString(1, pw);
			psmt.setString(2, name);
			psmt.setString(3, phoneNumber);
			psmt.setString(4, birth);
			psmt.setString(5, gender);
			psmt.setString(6, id);

			// 6. sql문 실행 후 결과 처리
			cnt = psmt.executeUpdate();
			System.out.println("dao수정성공");

		} catch (Exception e) {
			System.out.println("dao 수정실패");
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	// 중복체크
	public boolean idCheck(String id) {
		boolean check = true;
		try {
			connection();

			System.out.println(id);
			String sql = "select * from USER_TABLE where USER_ID=?";
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

	// 특정회원삭제
	public int delete(String id) {
		try {
			connection();

			String sql = "delete from user_table where user_id=?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, id);

			cnt = psmt.executeUpdate();

			sql = "commit";
			psmt = conn.prepareStatement(sql);

		} catch (Exception e) {
			System.out.println("삭제실패");
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	// 회원 검색
	public ArrayList<UserVO> selectAll() {
		arr = new ArrayList<UserVO>();
		try {
			connection();

			String sql = "select * from USER_TABLE";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {

				String get_id = rs.getString("user_id");
				String get_pw = rs.getNString("pw");
				String get_name = rs.getString("user_name");
				String get_tel = rs.getString("user_num");
				String get_birth = (rs.getString("birth")).substring(0, 10);
				String get_gender = rs.getString("gender");
				String get_mgr = rs.getString("mgr");

				if (get_gender.equals("0")) {// 남자
					get_gender = "man";
				} else if (get_gender.equals("1")) {
					get_gender = "woman";
				}

				if (get_mgr.equals("1")) {
					get_mgr = "관리자";
				} else {
					get_mgr = "";
				}

				vo = new UserVO(get_id, get_name, get_tel, get_birth, get_gender, get_mgr, get_pw);
				System.out.println(get_id + " " + get_pw + " " + get_name + " " + get_tel + " " + get_birth + " "
						+ get_gender + " " + get_mgr);

				arr.add(vo);
			}

		} catch (Exception e) {
			System.out.println("dao 회원조회실패");
			e.printStackTrace();
		} finally {
			// 1. 지역변수
			// 2. 예외처리
			close();
		}
		return arr;
	}

	// pw 중복체크
	public boolean pwCheck(String id, String pw) {
		boolean check = true;
		try {
			connection();

			System.out.println(pw);
			String sql = "select * from user_table where pw=? and user_id=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, pw);
			psmt.setString(2, id);

			rs = psmt.executeQuery();
			check = rs.next();

			System.out.println(check);

			if (check) {
				System.out.println("비밀번호가 맞습니다..");
			} else {
				System.out.println("비밀번호가 맞지않습니다.");
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

	// 회원 검색
	public UserVO selectOne(String id) {

		try {
			connection();

			String sql = "select * from USER_TABLE where user_id=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			while (rs.next()) {

				String get_id = rs.getString("user_id");
				String get_pw = rs.getNString("pw");
				String get_name = rs.getString("user_name");
				String get_tel = rs.getString("user_num");
				String get_birth = (rs.getString("birth")).substring(0, 10);
				String get_gender = rs.getString("gender");
				String get_mgr = rs.getString("mgr");

				vo = new UserVO(get_id, get_name, get_tel, get_birth, get_gender, get_mgr, get_pw);
				System.out.println(get_id + " " + get_pw + " " + get_name + " " + get_tel + " " + get_birth + " "
						+ get_gender + " " + get_mgr);

			}

		} catch (Exception e) {
			System.out.println("dao 회원조회실패");
			e.printStackTrace();
		} finally {
			close();
		}
		return vo;
	}

	public int totalTime(String id, String date) {
		int totalTime = 0;
		try {
			connection();
			System.out.println("dao totalTime 시작");
			
			String sql = "select * from rental_table where user_id=? and rental_date=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, date);
			rs = psmt.executeQuery();
			rs.next();
			
			String time1 = rs.getString("r_start_time");
			int time1H = Integer.parseInt(time1.substring(0, 2));
			int time1M = Integer.parseInt(time1.substring(3, 5));
			int time1S = Integer.parseInt(time1.substring(6));
			int totalTime1 = time1H * 3600 + time1M * 60 + time1S;

			String time2 = rs.getString("r_return_time");
			int time2H = Integer.parseInt(time2.substring(0, 2));
			int time2M = Integer.parseInt(time2.substring(3, 5));
			int time2S = Integer.parseInt(time2.substring(6));
			int totalTime2 = time2H * 3600 + time2M * 60 + time2S;
		
			System.out.println(time1+" / "+time2);
			
			totalTime = totalTime2 - totalTime1;

		} catch (Exception e) {
			System.out.println("dao 회원조회실패");
			e.printStackTrace();
		} finally {
			close();
		}
		return totalTime;
	}

	public int userClearTime(String user_id, String road_id) {

		try {
			
			String sysdate = sysDate();
			String date = sysdate.substring(0, 10);
			String time = "" + totalTime(user_id, date);
			close();
			connection();

			String sql = "insert into clear_table values (?,?,?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user_id);
			psmt.setString(2, road_id);
			psmt.setString(3, time);
			psmt.setString(4, date);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("dao 등산로 등록 실패");
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	
	public float userTotalTime(String user_id) {
		float totalTime = 0;
		try {
			connection();

			String sql = "select * from clear_table where user_id=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user_id);
			rs = psmt.executeQuery();
			
		
			while (rs.next()) {
				
				totalTime += Float.parseFloat(rs.getString("clear_time"));
		
			}

		} catch (Exception e) {
			System.out.println("dao 등산로 등록 실패");
			e.printStackTrace();
		} finally {
			close();
		}
		return totalTime;
	}

	public int userClearLevel(String user_id) {
		int level = 0;
		try {

			connection();

			String sql = "select * from clear_table where user_id=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user_id);
			rs = psmt.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
			}

			level = 1 + (count / 5);

		} catch (Exception e) {
			System.out.println("dao 등산로 등록 실패");
			e.printStackTrace();
		} finally {
			close();
		}
		return level;
	}
}