<%@page import="com.itwillbs.board.BoardDAO"%>
<%@page import="com.itwillbs.board.BoardDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>fWritePro.jsp</h1>
	<%
	// 글쓰기 + 파일 업로드
	
	// 1) 파일 업로드 우선처리 (multipart/form-data > 일반적인 데이터처리 불가.("multi"객체 생성후 사용해야 함.))
	//																			>> 해당 객체 안에 request 클래스를 담을것이기 때문 !!!
	
	// 라이브러리 설치 (cos.jar)
	// upload 폴더 생성				// >> 이거 두개는 미리 했음
	
	// 파일이 저장되는 실제 경로
	 String realPath = request.getRealPath("/upload");
	
	// 파일의 크기제한 (10MB)
	int maxSize = 10 * 1024 * 1024;
	
	// MultipartRequest 객체 생성
	MultipartRequest multi = new MultipartRequest(
									request,							// 이건 뭐라고 해야하나
									realPath,							// 실제경로
									maxSize,							// 파일 최대크기
									"UTF-8",							// 인코딩 방식
									new DefaultFileRenamePolicy()		// 이름 정하는 방식
									);
	System.out.println("파일 업로드 완료!!");
	
	// 2) 글쓰기
	// 전달 정보 저장
	// 여기서는 액션태그 못씀 (폼태그 형태 변경)
	BoardDTO dto = new BoardDTO();
	
	dto.setName(multi.getParameter("name"));
	dto.setPass(multi.getParameter("pass"));
	dto.setSubject(multi.getParameter("subject"));
	dto.setContent(multi.getParameter("content"));
	// DB에 첨부파일명 저장.
// 	dto.setFile(multi.getParameter("file")); >> X
	dto.setFile(multi.getFilesystemName("file")); // 파일명
	dto.setIp(request.getRemoteAddr()); // ip
	
	// DB에 저장
	// BoardDAO 객체 생성
	BoardDAO dao = new BoardDAO();
	// 파일업로드, 글쓰기 동작 메서드 호출
	dao.insertBoard(dto);
	// 페이지이동 list
	response.sendRedirect("boardList.jsp");
	%>
	




































</body>
</html>