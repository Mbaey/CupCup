package bean;

import java.sql.Timestamp;

public class User {
	private int u_id;
	private String u_name; 
	private String pwd; 
	private String tel; 
	private String email; 
	private String sex;
	private String touxiang;
	private Timestamp start;
	private String nickname;
	
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
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
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getTouxiang() {
		return touxiang;
	}
	public void setTouxiang(String touxiang) {
		this.touxiang = touxiang;
	}
	public Timestamp getStart() {
		return start;
	}
	public void setStart(Timestamp start) {
		this.start = start;
	}
	
	
	@Override
	public String toString() {
		return "User [u_id=" + u_id + ", u_name=" + u_name + ", pwd=" + pwd
				+ ", tel=" + tel + ", email=" + email + ", sex=" + sex
				+ ", touxiang=" + touxiang + ", start=" + start + ", nickname="
				+ nickname + "]";
	}
	public User(int u_id, String u_name, String pwd, String tel, String email,
			String sex, String touxiang, Timestamp start, String nickname) {
		super();
		this.u_id = u_id;
		this.u_name = u_name;
		this.pwd = pwd;
		this.tel = tel;
		this.email = email;
		this.sex = sex;
		this.touxiang = touxiang;
		this.start = start;
		this.nickname = nickname;
	}
	public User(String u_name, String pwd, String email, Timestamp start) {
		super();
		this.u_name = u_name;
		this.pwd = pwd;
		this.email = email;
		this.start = start;
	}
	public User() {
		super();
	}
	public User(String pwd, String tel, String email, String sex,
			String touxiang, String nickname) {
		super();
		this.pwd = pwd;
		this.tel = tel;
		this.email = email;
		this.sex = sex;
		this.touxiang = touxiang;
		this.nickname = nickname;
	}
	
	
	
}
