package com.itwillbs.test;

import java.sql.Date;

/**
 * 
 * itwill_member 테이블의 정보를 한번에 저장하는 객체
 *
 */
public class MemberBean {
	private String id;
	private String pw;
	private String name;
	private int age;
	private String email;
	private String gender;
	private Date regDate;
	
	//Getter/Setter
	//alt + shift + s > r
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
	
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}//Getter/Setter end
	
	//toString();
	//alt + shift + s > s
	@Override
	public String toString() {
		return "MemberBean [id=" + id + ", pw=" + pw + ", name=" + name + ", age=" + age + ", email=" + email
				+ ", gender=" + gender + ", regDate=" + regDate + "]";
	}
	
	
	

}//public class end
