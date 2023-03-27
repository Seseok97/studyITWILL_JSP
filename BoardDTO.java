package com.itwillbs.board;

import java.sql.Date;

public class BoardDTO {
	// JavaBean >> DTO(Data Transfer Object, 데이터 전송 객체)
	// 	여기서 DATA? > DB데이터를 말함!
	// DB Data >DTO> JSPpage
	// JavaBean = DTO라고 생각해도 됨 !!(=VO)
	
	private int bno;
	private String name;
	private String pass;
	private String subject;
	private String content;
	
	private int readcount;
	private int re_ref;
	private int re_lev;
	private int re_seq;
	
	private Date date;
	private String ip;
	private String file;
	
	//getter/setter
	// alt shift s > r
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getRe_ref() {
		return re_ref;
	}
	public void setRe_ref(int re_ref) {
		this.re_ref = re_ref;
	}
	public int getRe_lev() {
		return re_lev;
	}
	public void setRe_lev(int re_lev) {
		this.re_lev = re_lev;
	}
	public int getRe_seq() {
		return re_seq;
	}
	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	
	//toString() // 객체 안에 뭐가 들어있는지 확인해 주는 메서드
	// 없으면 위에서 getter를 전부 건드려야 한다.
	// alt shift s > s
	@Override
	public String toString() {
		return "BoardDTO [bno=" + bno + ", name=" + name + ", pass=" + pass + ", subject=" + subject + ", content="
				+ content + ", readcount=" + readcount + ", re_ref=" + re_ref + ", re_lev=" + re_lev + ", re_seq="
				+ re_seq + ", date=" + date + ", ip=" + ip + ", file=" + file + "]";
	}


}// class end
