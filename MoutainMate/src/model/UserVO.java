package model;

public class UserVO {

	private String id;
	private String pw;
	private String name;
	private String phoneNumber;
	private String birth;
	private String gender;
	private String manager;
	
	//user »ý¼ºÀÚ
	public UserVO(String id, String name,
			String phoneNumber, String birth, String gender,
			String manager) {
		
	}
	
	public	String getid() {
		return id;
	}
	
	
	public	String getname() {
		return name;
	}
	
	public	String getphoneNumber() {
		return phoneNumber;
	}
	
	public	String getbirth() {
		return birth;
	}
	
	public	String getgender() {
		return gender;
	}
	
	public	String getmanager() {
		return manager;
	}
	
	
		
	
}
