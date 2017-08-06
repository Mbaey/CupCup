package bean;

import java.sql.Timestamp;

public class Ticket {
	private int t_id;
	private Timestamp s_time;
	private Timestamp e_time;
	private int seat_num;
	private String m_title;
	private int scene_id;
	private int u_id;
	private float price;
	public Ticket(Timestamp s_time, Timestamp e_time, int seat_num,
			String m_title, int scene_id, int u_id, float price) {
		super();
		this.s_time = s_time;
		this.e_time = e_time;
		this.seat_num = seat_num;
		this.m_title = m_title;
		this.scene_id = scene_id;
		this.u_id = u_id;
		this.price = price;
	}
	public Ticket(int t_id, Timestamp s_time, Timestamp e_time, int seat_num,
			String m_title, int scene_id, int u_id, float price) {
		super();
		this.t_id = t_id;
		this.s_time = s_time;
		this.e_time = e_time;
		this.seat_num = seat_num;
		this.m_title = m_title;
		this.scene_id = scene_id;
		this.u_id = u_id;
		this.price = price;
	}
	public Ticket() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Ticket [t_id=" + t_id + ", s_time=" + s_time + ", e_time="
				+ e_time + ", seat_num=" + seat_num + ", m_title=" + m_title
				+ ", scene_id=" + scene_id + ", u_id=" + u_id + ", price="
				+ price + "]";
	}
	public int getT_id() {
		return t_id;
	}
	public void setT_id(int t_id) {
		this.t_id = t_id;
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
	public int getSeat_num() {
		return seat_num;
	}
	public void setSeat_num(int seat_num) {
		this.seat_num = seat_num;
	}
	public String getM_title() {
		return m_title;
	}
	public void setM_title(String m_title) {
		this.m_title = m_title;
	}
	public int getScene_id() {
		return scene_id;
	}
	public void setScene_id(int scene_id) {
		this.scene_id = scene_id;
	}
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	
	
	

}
