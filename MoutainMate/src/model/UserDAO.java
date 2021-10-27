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

	public void connection() { // db����
		try {
			// ����̺� �ڵ鸵
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String user = "campus_b_1_1025";
			String password = "smhrd1";

			// ������ ���� ��ü(Connection����)
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("���� ����");
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

	// ȸ������ ���
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
			System.out.println("���Խ���");
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	//�α���
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
				System.out.println("�α��μ���");

				String get_id = rs.getString("id");
				String get_name = rs.getString("name");
				String get_phoneNumber = rs.getString("phoneNumber");
				String get_birth = rs.getString("birth");
				String get_gender = rs.getString("gender");
				String get_manager = rs.getString("manager");

				vo=new UserVO(get_id, get_name, get_phoneNumber, get_birth,
						get_gender, get_manager);

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
	
	//ȸ�� ����
	public int update( String id,String pw, String name, String phoneNumber, String birth, String gender, String manager) {
		
		try {

			connection();
			// 3. ������ sql�� ���� (�����Ҷ����� ���� �޶����ºκ��� ?����θ� ��
			String sql = "update user_table  set pw =?, name=?, phoneNumber=?, birth=?, gender=?,manager=? where id=?";

			// 4. sql ���ఴü(PreparedStatemnent)����
			psmt = conn.prepareStatement(sql);

			// 5. ���ε庯�� (?) ä���
			psmt.setString(1, pw);
			psmt.setString(2, name);
			psmt.setString(3, phoneNumber);
			psmt.setString(4, gender);
			psmt.setString(5, manager);
			psmt.setString(6, id);

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
	
	//�ߺ�üũ
	public boolean idCheck(String id) {
		try {
			connection();

			String sql = "select id from user_table where id=? ";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			

			rs = psmt.executeQuery();
			

			if (rs.next()) {
				//�Է��� �̸����� ��� �� �� ���� ��
				check=true;
			} else {
				//�Է��� �̸����� ����� �� ���� �� 
				
				check=false;
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
	
	//Ư��ȸ������
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
	
	//ȸ�� �˻�
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
			System.out.println("��ȸ����");
			e.printStackTrace();
		} finally {
			// 1. ��������
			// 2. ����ó��
			close();
		}
		return arr;
	}
}