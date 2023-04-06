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
<h1>fileUploadPro.jsp</h1>
<h2>파일 업로드</h2>
	<%
	// 업로드된 파일 저장공간 > upload 폴더 생성
	
	String uploadPath = request.getRealPath("/upload");
	System.out.println(uploadPath);
	// >> 톰캣에 저장되는 경로
	
	// > 톰캣에서 실행되고 있을때 생성된다.
	
	// 업로드 할 파일의 크기 (ex) 10mb)
	int maxSize = 10 * 1024 * 1024 ;
	//            10mb > 10*1024kb > 10*1024*1024byte
	
	// 파일 업로드
	MultipartRequest multi = new MultipartRequest( // 기본생성자가 없는 메서드
									request,
									uploadPath,
									maxSize,
									"UTF-8",
									new DefaultFileRenamePolicy() // 같은 이름을 가진 파일이 생성될 경우 실행될 메서드(ex) 파일이름, 파일이름 (1), 파일이름 (2))
									);
	// 해당 객체가 생성된 것으로 파일 업로드가 가능해진다.
	System.out.println("MultipartRequest 객체 생성파일 > 파일 업로드 성공!");
	
	// 업로드된 정보를 저장(DB)
	//	작성자
// 	String name = request.getParameter("name");
	String name = multi.getParameter("name");
	//	파일
// 	String file = request.getParameter("file");
// 	String file = multi.getParameter("file");
	String file1 = multi.getOriginalFileName("file");
	String file2 = multi.getFilesystemName("file");

	
	
	%>
	작성자: <%=name %><br>
	파일1: <%=file1 %> >> original name<br>
	파일2: <%=file2 %> >> rename policy name<br>
	
	
<h2>파일 다운로드</h2>

	다운로드 링크: <a href="../upload/<%=file2 %>"><%=file1 %></a> <!-- file1(원본파일)의 파일명을 띄우고, file2(서버에 있는 파일)을 다운받도록 한다. -->	<br>
	다운로드 링크: <a href="../upload/<%=file2 %>" download><%=file1 %></a><hr>
	
	<!-- 다운로드 페이지 fileDownload.jsp  -->
	
	파일 다운로드(JSP) : <a href="fileDownload.jsp?fileName=<%=file2 %>"><%=file1 %></a><br>
	
	
































</body>
</html>