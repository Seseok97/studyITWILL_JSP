<%@page import="com.itwillbs.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>boardDeletePro.jsp</h1>
	
	<%
	request.setCharacterEncoding("UTF-8");
	
	String pageNum = request.getParameter("pageNum");
	// 전달정보 저장, 액션태그
// 	int bno = Integer.parseInt(request.getParameter("bno"));
// 	String pass = request.getParameter("pass");
	// 액션태그나 위 방법, 둘중 하나만 사용하는것이 좋음
	// 적은양의 경우 위 방법(손 많이감), 많은 양의경우 아래 방법(메성비 떨어짐).
	// 단, DTO를 이용하는 경우 코드 보수성이 좋아진다. 메성비 엄청나게 크게 차이나는거도 아님
	// >> 강사님: 그냥 DTO 쓰세요
	%>
	<jsp:useBean id="dto" class="com.itwillbs.board.BoardDTO"/>
	<jsp:setProperty property="*" name="dto"/>
	수정할 정보: <%=dto %>
	<%
	BoardDAO dao = new BoardDAO();
	int result = dao.deleteBoard(dto);
	
	if(result == 1){
		%>
		<script type="text/javascript">
		alert('삭제 완료!');
		// 만약 글이 하나뿐인 페이지를 삭제하는 경우, 이전페이지가 아니라 -1p로 이동.
		if(true){
			location.href= "boardList.jsp?pageNum=<%=pageNum %>";
			// 복습하면서 구현해보기.
		}
		</script>
		<%
	}else if(result == 0){
		%>
		<script type="text/javascript">
		alert('비밀번호 오류!');
		history.back();
		</script>
		<%
	}else{
		// result == -1
		%>
		<script type="text/javascript">
		alert('비밀번호를 입력해주세요!');
		history.back();
		</script>
		<%
	}
	%>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>