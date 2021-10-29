package model;

public class MountainVO {
	String m_id;
	String m_name;
	String mroad_id;
	String mroad_name;
	
	
	public MountainVO(String m_id,String m_name) {
		this.m_id = m_id;
		this.m_name = m_name;
	}
	
	
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getMroad_id() {
		return mroad_id;
	}
	public void setMroad_id(String mroad_id) {
		this.mroad_id = mroad_id;
	}
	public String getMroad_name() {
		return mroad_name;
	}
	public void setMroad_name(String mroad_name) {
		this.mroad_name = mroad_name;
	}
}
