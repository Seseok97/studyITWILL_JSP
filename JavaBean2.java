package com.itwillbs.javabean;

public class JavaBean2 {
	//id 정보를 저장하기위해 생성한 객체(자바빈)
	private String id;
	private String pw;
	private String email;

	@Override
	public String toString() {
		return "JavaBean2 [id=" + id + ", pw=" + pw + ", email=" + email + "]";
	}
	//getter/setter
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

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

}
