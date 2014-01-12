package moer.cafeteria.user;

public class User {
	private String id;
	private String pw;
	private String name;
	private String department;
	private String type;
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPw() {
		return pw;
	}
	
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getDepartment() {
		return department;
	}
	
	public void setDepartment(String department) {
		this.department = department;
	}
	
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	public String getBuilding() {
		switch (this.id) {
		case "bonbu":
			return "본부동";
		case "bokji":
			return "복지동";
		case "prof":
			return "교수회관";
		default:
			throw new UnsupportedOperationException("Admin용 메소드 입니");
		}
	}
	
	@Override
	public String toString() {
		return "User [id=" + id + ", pw=" + pw + ", name=" + name
				+ ", department=" + department + ", type=" + type + "]";
	}
}
