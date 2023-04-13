package com.itwillbs.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/set2")
public class TestServlet4 extends HttpServlet{
	//http://localhost:8088/JSP7/set2
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		System.out.println("TestServlet4 - doGet() 호출");
		
		//Person - "이름: 아이티윌" 정보를 "./jstl/core_set2.jsp" 페이지로 전달.
		Person p = new Person();
		p.setName("아이티윌");
		request.setAttribute("person", p);
		
		// ArrayList, 회원정보 2개 저장
		Person p1 = new Person();
		p1.setName("부산");// 정보 하나더 생성
		ArrayList memberList = new ArrayList();
		memberList.add(p);
		memberList.add(p1);
		request.setAttribute("memberList", memberList);

		
		// 페이지 이동(core_set2.jsp)
		RequestDispatcher dis =
				request.getRequestDispatcher("./jstl/core_set2.jsp");
		System.out.println("./jstl/core_set2.jsp 페이지로 이동~");
		dis.forward(request, response);
	}// doGet() method end
	
	

}// public class end
