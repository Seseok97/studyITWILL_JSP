package com.itwillbs.test;

public class Calculator {
	
	//Calculator - sum/avg
	public void sum(int k, int l, int m) {
		System.out.println("sum : "+(k+l+m));
	}
	public void sum(Student s) {
		System.out.println("sum : "+(s.getKor()+s.getEng()+s.getMath())+"점");
	}
	public void avg(Student s) {
		System.out.println("avg : "+((s.getKor()+s.getEng()+s.getMath())/3.0)+"점");
	}
//	public void sum(String name) {
//		System.out.println("sum : "+"점");
//	}
	public double avg(double k, double l, double m) {
		return (k+l+m)/3;
	}
	
	
}
