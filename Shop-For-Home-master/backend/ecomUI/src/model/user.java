package model;

public class user {
	private int id;
	private String username;
	private String passowrd;
	private int mobile;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassowrd() {
		return passowrd;
	}
	public void setPassowrd(String passowrd) {
		this.passowrd = passowrd;
	}
	public int getMobile() {
		return mobile;
	}
	public void setMobile(int mobile) {
		this.mobile = mobile;
	}
	@Override
	public String toString() {
		return "user [id=" + id + ", username=" + username + ", passowrd=" + passowrd + ", mobile=" + mobile + "]";
	}
	public user(String username, String passowrd, int mobile) {
		super();
		this.username = username;
		this.passowrd = passowrd;
		this.mobile = mobile;
	}
	public user() {
		super();
	}
	

}
