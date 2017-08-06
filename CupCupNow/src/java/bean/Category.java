package bean;

public class Category {
	private int id;
	private String name;
	private int level;
	private String info;
	public Category(int id, String name, int level, String info) {
		super();
		this.id = id;
		this.name = name;
		this.level = level;
		this.info = info;
	}
	public Category(String name, int level) {
		super();
		this.name = name;
		this.level = level;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public Category(String name, int level, String info) {
		super();
		this.name = name;
		this.level = level;
		this.info = info;
	}
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Category [id=" + id + ", name=" + name + ", level=" + level
				+ ", info=" + info + "]";
	}
	
	

}
