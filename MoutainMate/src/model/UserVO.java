package model;

public class UserVO {

	//�ʵ�(�Ӽ�)
		private String id;
		
		private String name;
		
		
		
		
		//������
		public UserVO(String id, String name) {
			
			this.id=id;
			this.name=name;
			
			
		}
		//�޼���(get)
		public String getid() {
			return id;
		}
		public String getname() {
			return name;
		}
		
		
	}