package bean;

public class Mgr {
	private int m_id;
	private String m_name; 
	private String pwd;
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public Mgr(String m_name, String pwd) {
		super();
		this.m_name = m_name;
		this.pwd = pwd;
	}
	@Override
	public String toString() {
		return "Mgr [m_id=" + m_id + ", m_name=" + m_name + ", pwd=" + pwd
				+ "]";
	}
	
	
}
