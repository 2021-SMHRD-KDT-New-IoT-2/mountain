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
	int cnt = 0;	
	ArrayList<UserVO> arr =null;
	
	
	
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

	public String mgrCheck(String id, String pw) {

		String mgrCheck = "";

		try {
			connection();

			String sql = "select * from user_table where mgr=1";
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			if (rs.next()) {
				mgrCheck = "1";
				System.out.println("�α��μ���");

			} else {
				mgrCheck = "0";
				System.out.println("�α��ν���");

			}

		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			// 1. ��������
			// 2. ����ó��
			close();
		}
		return mgrCheck;
	}

	// �α���
	public UserVO login(String id, String pw) {

		try {
			connection();
			
			String mgrC = mgrCheck(id, pw);
			
				String sql = "select * from user_table where user_id=? and pw=?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);
				psmt.setString(2, pw);

				rs = psmt.executeQuery();

				if (rs.next()) {
					rs.getString("mgr");
					System.out.println("�α��μ���");

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
	public int update(String id, String pw, String name, String phoneNumber) {

		try {

			connection();
			// 3. ������ sql�� ���� (�����Ҷ����� ���� �޶����ºκ��� ?����θ� ��
			String sql = "update user_table  set pw =?, user_name=?, user_num=?, where user_id=?";

			// 4. sql ���ఴü(PreparedStatemnent)����
			psmt = conn.prepareStatement(sql);

			// 5. ���ε庯�� (?) ä���
			psmt.setString(1, pw);
			psmt.setString(2, name);
			psmt.setString(3, phoneNumber);
			psmt.setString(4, id);

			// 6. sql�� ���� �� ��� ó��
			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("��������");
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
			// 3. ������ sql�� ���� (�����Ҷ����� ���� �޶����ºκ��� ?����θ� ��
			String sql = "delete from user_table where id=?";

			// 4. sql ���ఴü(PreparedStatemnent)����
			psmt = conn.prepareStatement(sql);

			// 5. ���ε庯�� (?) ä���
			psmt.setString(1, id);

			// 6. sql�� ���� �� ��� ó��
			cnt = psmt.executeUpdate();

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
				String get_birth = rs.getString("birth");
				String get_gender = rs.getString("gender");
				String get_mgr = rs.getString("mgr");

				System.out.println(get_birth);
				System.out.println(get_mgr);

				if (get_gender.equals("0")) {// ����
					get_gender = "man";
				} else if (get_gender.equals("1")) {
					get_gender = "woman";
				} else {
					get_gender = "";
				}

				if (get_mgr != null) {
					get_mgr = "�Ŵ���";
				} else {
					get_mgr = "";
				}

				if (get_mgr == null) {
					get_birth = "";
				}

				vo = new UserVO(get_id, get_pw, get_name, get_tel, get_birth, get_gender, get_mgr);
				System.out.println(get_id + " " + get_pw + " " + get_name + " " + get_tel + " " + get_birth + " "
						+ get_gender + " " + get_mgr);

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
}