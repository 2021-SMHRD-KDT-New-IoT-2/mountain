package model;

public class UserVO {

	//필드(속성)
		private String id;
		
		private String name;
		
		
		
		
		//생성자
		public UserVO(String id, String name) {
			
			this.id=id;
			this.name=name;
			
			
		}
		//메서드(get)
		public String getid() {
			return id;
		}
		public String getname() {
			return name;
		}
		
		
	}