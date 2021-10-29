package model;

public class UserVO {

	//�ʵ�(�Ӽ�)
		private String id;
		private String name;
		private String phoneNumber;
		private String birth;
		private String gender;
		private String mgr;
		private String pw;

		//������
		
		public UserVO(String id) {
			this.id=id;
		}
		
		public UserVO(String id, String name) {
			
			this.id=id;
			this.name=name;	
		}
		
		
		public UserVO(String id, String name, String phoneNumber, String birth, String gender, String mgr, String pw) {
			
			this.id=id;
			this.name=name;	
			this.phoneNumber=phoneNumber;
			this.birth=birth;	
			this.gender=gender;
			this.name=name;	
			this.pw=pw;
			this.mgr=mgr;
		}
	
		public UserVO(String id, String pw, String mgr) {
			this.id = id;
			this.pw = pw;
			this.mgr = mgr;
		}
		
		public UserVO(String id, String name, String phoneNumber, String birth, String gender, String mgr) {
			this.id=id;
			this.name = name;
			this.phoneNumber = phoneNumber;
			this.birth = birth;
			this.gender=gender;
			this.mgr=mgr;
			
		}
		//�޼���(get)
		public String getid() {
			return id;
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
		public String getgender() {
			return gender;
		}
		public String getpw() {
			return pw;
		}
		public String getmgr() {
			return mgr;
		}
		
		//ȸ��������
		public UserVO(String pw, String name, String phoneNumber, String birth, String gender) {
			this.pw= pw;
			this.name=name;
			this.phoneNumber=phoneNumber;
			this.birth = birth;
			this.gender = gender;
		}
		
		public String get_pw() {
			return pw;
		}
		public String get_name() {
			return name;
		}
		public String get_phoneNumber() {
			return phoneNumber;
		}
		public String get_birth() {
			return birth;
		}
		public String get_gender() {
			return gender;
		}
		
	}