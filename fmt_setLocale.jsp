<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>fmt_setLocale.jsp</h1>

<c:set var="today" value="<%=new Date() %>"/>
today: ${today }<br>
<hr>

<fmt:setLocale value="ko_kr"/>
today(fmt,setLocale): ${today }<br>
today(fmt_formatDate): <fmt:formatDate value="${today }"/><br>
today(fmt_formatDate,dateStyle=full): <fmt:formatDate value="${today }" dateStyle="full"/><br>
<fmt:formatNumber value="100000000" type="currency"/><br>
<hr>
<fmt:setLocale value="en_us"/>
today(fmt,setLocale): ${today }<br>
today(fmt_formatDate): <fmt:formatDate value="${today }"/><br>
today(fmt_formatDate,dateStyle=full): <fmt:formatDate value="${today }" dateStyle="full"/><br>
<fmt:formatNumber value="100000000" type="currency"/><br>
<hr>
<fmt:setLocale value="ja_jp"/>
today(fmt,setLocale): ${today }<br>
today(fmt_formatDate): <fmt:formatDate value="${today }"/><br>
today(fmt_formatDate,dateStyle=full): <fmt:formatDate value="${today }" dateStyle="full"/><br>
<fmt:formatNumber value="100000000" type="currency"/><br>
<!-- 가능하다는거지, 실제로 많이 사용하는건 아님! -->

</body>
</html>