package bean;

import java.sql.Timestamp;

public class Comment {
	private int c_id;
	private String c_title;
	private String c_content;
	private int u_id;
	private String u_name;
	private int m_id;
	private String m_title;
	private Timestamp timestamp;
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public String getC_title() {
		return c_title;
	}
	public void setC_title(String c_title) {
		this.c_title = c_title;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
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
	public Timestamp getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(Timestamp timestamp) {
		this.timestamp = timestamp;
	}
	
	/**
	 * ¶ÌÆÀ
	 * @param c_content
	 * @param u_id
	 * @param u_name
	 * @param m_id
	 * @param m_title
	 * @param timestamp
	 */
	public Comment(String c_content, int u_id, String u_name, int m_id,
			String m_title, Timestamp timestamp) {
		super();
		this.c_content = c_content;
		this.u_id = u_id;
		this.u_name = u_name;
		this.m_id = m_id;
		this.m_title = m_title;
		this.timestamp = timestamp;
	}
	/**
	 * ³¤ÆÀÂÖ
	 * @param c_title
	 * @param c_content
	 * @param u_id
	 * @param u_name
	 * @param m_id
	 * @param m_title
	 * @param timestamp
	 */
	public Comment(String c_title, String c_content, int u_id, String u_name,
			int m_id, String m_title, Timestamp timestamp) {
		super();
		this.c_title = c_title;
		this.c_content = c_content;
		this.u_id = u_id;
		this.u_name = u_name;
		this.m_id = m_id;
		this.m_title = m_title;
		this.timestamp = timestamp;
	}
	
	public Comment() {
		super();
	}
	
	
	public Comment(String c_title, String c_content, Timestamp timestamp) {
		super();
		this.c_title = c_title;
		this.c_content = c_content;
		this.timestamp = timestamp;
	}
	@Override
	public String toString() {
		return "Comment [c_id=" + c_id + ", c_title=" + c_title
				+ ", c_content=" + c_content + ", u_id=" + u_id + ", u_name="
				+ u_name + ", m_id=" + m_id + ", m_title=" + m_title
				+ ", timestamp=" + timestamp + "]";
	}
	
	

}
