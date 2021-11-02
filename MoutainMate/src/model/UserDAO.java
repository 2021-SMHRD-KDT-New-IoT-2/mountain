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
			System.out.println("-------sysdate end--------");

		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			close();
		}
		return sysdate;
	}

	// ȸ������ ���
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
			System.out.println("���Խ���");
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	// �α���
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

				System.out.println("dao �α��μ��� mgr : " + mgr);
				vo = new UserVO(id, pw, mgr);

			} else {

				System.out.println("�α��ν���");
			}
		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			// 1. ��������
			// 2. ����ó��
			close();
		}
		return vo;
	}

	// ȸ�� ����
	public int update(String pw, String name, String phoneNumber, String birth, String gender, String id) {

		try {

			connection();
			// 3. ������ sql�� ���� (�����Ҷ����� ���� �޶����ºκ��� ?����θ� ��
			String sql = "update user_table set pw =?, user_name=?, user_num=?, birth=?, gender=? where user_id=?";

			// 4. sql ���ఴü(PreparedStatemnent)����
			psmt = conn.prepareStatement(sql);

			// 5. ���ε庯�� (?) ä���
			psmt.setString(1, pw);
			psmt.setString(2, name);
			psmt.setString(3, phoneNumber);
			psmt.setString(4, birth);
			psmt.setString(5, gender);
			psmt.setString(6, id);

			// 6. sql�� ���� �� ��� ó��
			cnt = psmt.executeUpdate();
			System.out.println("dao��������");

		} catch (Exception e) {
			System.out.println("dao ��������");
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	// �ߺ�üũ
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

	// Ư��ȸ������
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
			System.out.println("��������");
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	// ȸ�� �˻�
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

				if (get_gender.equals("0")) {// ����
					get_gender = "man";
				} else if (get_gender.equals("1")) {
					get_gender = "woman";
				}

				if (get_mgr.equals("1")) {
					get_mgr = "������";
				} else {
					get_mgr = "";
				}

				vo = new UserVO(get_id, get_name, get_tel, get_birth, get_gender, get_mgr, get_pw);
				System.out.println(get_id + " " + get_pw + " " + get_name + " " + get_tel + " " + get_birth + " "
						+ get_gender + " " + get_mgr);

				arr.add(vo);
			}

		} catch (Exception e) {
			System.out.println("dao ȸ����ȸ����");
			e.printStackTrace();
		} finally {
			// 1. ��������
			// 2. ����ó��
			close();
		}
		return arr;
	}

	// pw �ߺ�üũ
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
				System.out.println("��й�ȣ�� �½��ϴ�..");
			} else {
				System.out.println("��й�ȣ�� �����ʽ��ϴ�.");
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

	// ȸ�� �˻�
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
			System.out.println("dao ȸ����ȸ����");
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
			System.out.println("dao totalTime ����");
			
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
			System.out.println("dao ȸ����ȸ����");
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
			System.out.println("dao ���� ��� ����");
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
			System.out.println("dao ���� ��� ����");
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
			System.out.println("dao ���� ��� ����");
			e.printStackTrace();
		} finally {
			close();
		}
		return level;
	}
}