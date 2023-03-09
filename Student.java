package com.itwillbs.test;

public class Student {
	//정보만 담을 파일이기 때문에 main() method 생략.
	
	// class 왜 필요한가? > 정보를 한번에 저장하기 위해서.
	// 멤버변수 + 멤버메서드 + 생성자.
	
	// 이름, 국,영,수 정보를 한번에 저장.
	
	
	//멤버변수 선언
	// 접근제한자 > 외부에서 정보를 쉽게 조작하지 못하게 한다.
	//은행 금고에 있는 내 돈(나도 접근 못함)
	private String name;
	private int kor;
	private int eng;
	private int math;
	// 변수를 만들어서
	
	//멤버메서드 선언
	//alt+shift+s > r
	//Getter/Setter
	// 은행에 있는 은행원(내 돈을 꺼내주는 권한이 있는 접근자, 은행 소속이기때문에 가능!)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public int getMath() {
		return math;
	}
	public void setMath(int math) {
		this.math = math;
	}
	// 위 과정을 거치는것 : 캡슐화!!
	// 사용할수 있도록 처리한 것.
	
	
	//생성자 선..언?
	// >> 오버로딩된 메서드가 없는경우, 자바 컴파일러는 클래스 이름과 동일한 생성자를 하나 생성한다.
	// >> class 안의 멤버변수를 사용할 수 있도록 초기화를 실시해 주는 것 !
	// >> 없으면 class 사용이 불가능하기 때문에 !! 컴파일러가 그냥 만들어 버리는것 !
	//public Student(){ }
	// 의 형태로 만들어 져 있다 !

	

}// public class end
