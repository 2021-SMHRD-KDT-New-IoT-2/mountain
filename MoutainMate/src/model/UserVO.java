package model;

public class UserVO {

	//�ʵ�(�Ӽ�)
		private String id;
		private String pw;
		private String name;
		private String phoneNumber;
		private String birth;
		private int gender;
		
		
		
		//������
		public UserVO(String id, String pw, String name, String phoneNumber, String birth, int gender) {
			this.id=id;
			this.pw=pw;
			this.name=name;
			this.phoneNumber=phoneNumber;
			this.birth=birth;
			this.gender=gender;
		}
		
		//�޼���(get)
		public String getid() {
			return id;
		}
		
		public String getpw() {
			return pw;
		}
		
		public String getname() {
			return name;
		}
		public String getphoneNumber() {
			return phoneNumber;
		}
		public String getbirth() {
			return birth;
		}
		public int getgender() {
			return gender;
		}
	}