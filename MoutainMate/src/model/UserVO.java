package model;

public class UserVO {

	//�ʵ�(�Ӽ�)
		private String id;
		
		private String name;
		private String phoneNumber;
		
		
		
		
		//������
		public UserVO(String id, String phoneNumber) {
			
			this.id=id;
			this.phoneNumber = phoneNumber;
			
			
		}
		//�޼���(get)
		public String getid() {
			return id;
		}
		public String getphoneNumber() {
			return phoneNumber;
		}
		
		
	}