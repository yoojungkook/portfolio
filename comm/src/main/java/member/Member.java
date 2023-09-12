package member;

public class Member {
	private int no;
	private String id;
	private String password;
	
	public Member() {}
	public Member(int no, String id, String password) {
		super();
		this.no = no;
		this.id = id;
		this.password = password;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Override
	public String toString() {
		return "Member [no=" + no + ", id=" + id + ", password=" + password + "]";
	}
}
