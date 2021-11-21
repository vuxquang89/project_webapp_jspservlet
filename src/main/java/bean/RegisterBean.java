package bean;

public class RegisterBean {
	private String usermail, password;
	private String username, address, phone;
	private int role;
	
	public RegisterBean() {}
	
	public RegisterBean(String usermail, String password, String username, 
			String address, String phone, int role) {
		this.usermail = usermail;
		this.password = password;
		this.username = username;
		this.address = address;
		this.role = role;
		this.phone = phone;
	}

	public String getUsermail() {
		return usermail;
	}

	public void setUsermail(String usermail) {
		this.usermail = usermail;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}
	
}
