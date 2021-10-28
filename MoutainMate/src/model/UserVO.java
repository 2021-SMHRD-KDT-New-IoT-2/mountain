package model;

public class UserVO {

	//필드(속성)
		private String id;
		
		private String name;
		private String phoneNumber;
		
		
		
		
		//생성자
		public UserVO(String id, String phoneNumber) {
			
			this.id=id;
			this.phoneNumber = phoneNumber;
			
			
		}
		//메서드(get)
		public String getid() {
			return id;
		}
		public String getphoneNumber() {
			return phoneNumber;
		}
		
		
	}