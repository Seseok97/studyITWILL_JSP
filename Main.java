package com.itwillbs.test;
//DB와 함께 사용할 내용
public class Main {
	public static void main(String[] args) {
		
		//학생 이름, 국영수 점수 > 총점, 평균 출력
		String name = "A";
		int g = 100;
		int e = 89;
		int m = 88;
		
		System.out.println("총점: "+(g+e+m)+"점");
//		System.out.println("평균: "+((double)(g+e+m)/3)+"점");	// 내가 생각한거
		System.out.println("평균: "+((g+e+m)/3.0)+"점");		// 강사님이 생각하신거
		
		double tmp = (g+e+m)/3.0;
		//반올림 로직(소수점 두번째자리에서 반올림)
//		System.out.println(Math.round(tmp*10)/10.0); // 다른 숫자 넣으면 그냥 출력되어서 나온다.
		System.out.println((int)((tmp*10)+0.5)/10.0); // 강사님 코드
		
		System.out.println("------------------------------------------");
		
		//계산기능만 따로 분리 (총합, 평균)
		
		//총합 > 인스턴스 메서드 / 3개의 전달인자를 받아 해당 정보를 출력
		//평균 > 인스턴스 메서드 / 3개의 전달인자를 받아 정보 리턴
		
		
//		Cal c = new Cal();
//		c.sum(g, e, m);
//		c.avg(g, e, m); // 내코드
		
		Main M = new Main();
		M.sum(g, e, m);
		System.out.println("avg : "+M.avg(g, e, m)); // 강사님코드
		
		// 리턴이라고 조건 걸려있는데 그냥 출력으로 해버렸다 !!
		
		System.out.println("------------------------------------------");
		
		// 학생정보 객체 저장
		Student s = new Student(); // 메모리 주소 할당(생성자는 컴파일러가 자동으로 생성한것.(Student() << 이거 !))
//		s.name = "홍길동"; // 접근제한자로 인하여 에러발생.
		
		s.setName("홍길동");
		s.setKor(80);
		s.setEng(80);
		s.setMath(100); // "Student" 객체를 활용하여 정보를 저장.
		
		// 학생의 총점 계산
		M.sum(s.getKor(),s.getEng(),s.getMath());
		M.sum(s);
		// DB에서 넘어온 데이터를 위와같은 방식으로 처리하게 될 것 !!
		
		//////////////////////////////////////////////////////////////////////////////////
		System.out.println("------------------------------------------");
		
		// 계산기를 사용하여
		Calculator c = new Calculator();
		// A학생 총합
		c.sum(g, e, m);
		// 홍길동 학생 총합
		c.sum(s);
		// 해보기
		// A학생 평균
		System.out.println(c.avg(g, e, m));
		// 홍길동 학생 평균
		c.avg(s);
		
	}//main() method end
	int g;
	int e;
	int m;
	public void sum(int g2, int e2, int m2) {
		g = g2;
		e = e2;
		m = m2;
		System.out.println("sum : "+(g+e+m));
	}
	//총합(sum) > 메서드 오버로딩
	public void sum(Student s) {
		System.out.println("sum : "+(s.getKor()+s.getEng()+s.getMath())+"점");
	}
	//메서드를 구분하는 요소(메서드 시그니처)
	// 1. 이름
	// 2. 전달인자 타입
	// 3. 전달인자 개수
	
	
	public double avg(double g2, double e2, double m2) {
		return (g2+e2+m2)/3;
	}// 강사님코드

}//public class end

//class Cal{
//	int g;
//	int e;
//	int m;
//	public void sum(int g2, int e2, int m2) {
//		g = g2;
//		e = e2;
//		m = m2;
//		System.out.println("sum: "+(g+e+m));
//	}
//	public void avg(int g2, int e2, int m2) {
//		g = g2;
//		e = e2;
//		m = m2;
//		System.out.println("avg: "+(g+e+m)/3.0);
//	}// 내코드
//	
//}//Cal class end
