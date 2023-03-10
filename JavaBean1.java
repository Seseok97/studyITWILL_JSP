package com.itwillbs.javabean;
/**
 * javadoc 주석(설명)
 *  id 정보를 저장하는 객체
 *  id 정보는 직접 접근 불가능 !!
 *  
 *  get/set 메서드 사용해서 호출 가능!
 *  
 *  
 * 
 *
 */
public class JavaBean1 {
	//id 정보를 저장하기위해 생성한 객체(자바빈)
	private String id;

	//getter/setter
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	//public JavaBean1(){ } > 개발자에게는 보이지않는, 컴파일러가 만든 기본생성자!! 오버로딩 하지않으면 자동으로 생긴다! 
	
	//JavaBean 규칙을 지킨 자바빈 생성.
	// >> 일반적인 class 생성과 같다.
	
	//alt+shift+s > s
	@Override
	public String toString() {
		return "JavaBean1 [id=" + id + "]";
	}
	//Override > Overloading과 유사한 개념. > 나중에 알아보기~

}
