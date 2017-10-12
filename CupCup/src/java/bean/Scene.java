package bean;

import java.sql.Timestamp;

public class Scene {
	private int scene_id;
	private int m_id;
	private String m_title;
	private Timestamp s_time;
	private Timestamp e_time;
	private int hall_id;
	private float price;
	private String type; //2D/3D
	public int getScene_id() {
		return scene_id;
	}
	public void setScene_id(int scene_id) {
		this.scene_id = scene_id;
	}
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public String getM_title() {
		return m_title;
	}
	public void setM_title(String m_title) {
		this.m_title = m_title;
	}
	public Timestamp getS_time() {
		return s_time;
	}
	public void setS_time(Timestamp s_time) {
		this.s_time = s_time;
	}
	public Timestamp getE_time() {
		return e_time;
	}
	public void setE_time(Timestamp e_time) {
		this.e_time = e_time;
	}
	public int getHall_id() {
		return hall_id;
	}
	public void setHall_id(int hall_id) {
		this.hall_id = hall_id;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Scene(String m_title, Timestamp s_time, Timestamp e_time,
			int hall_id, float price, String type) {
		super();
		this.m_title = m_title;
		this.s_time = s_time;
		this.e_time = e_time;
		this.hall_id = hall_id;
		this.price = price;
		this.type = type;
	}
	
	
	
	public Scene(String m_title, Timestamp s_time, Timestamp e_time,
			int hall_id, float price) {
		super();
		this.m_title = m_title;
		this.s_time = s_time;
		this.e_time = e_time;
		this.hall_id = hall_id;
		this.price = price;
	}
	
	
	public Scene(int m_id, String m_title, Timestamp s_time, Timestamp e_time
			, String type,int hall_id, float price) {
		super();
		this.m_id = m_id;
		this.m_title = m_title;
		this.s_time = s_time;
		this.e_time = e_time;
		this.hall_id = hall_id;
		this.price = price;
		this.type = type;
	}
	
	
	public Scene() {
		super();
	}
	@Override
	public String toString() {
		return "Scene [scene_id=" + scene_id + ", m_id=" + m_id + ", m_title="
				+ m_title + ", s_time=" + s_time + ", e_time=" + e_time
				+ ", hall_id=" + hall_id + ", price=" + price + ", type="
				+ type + "]";
	}
	
}
