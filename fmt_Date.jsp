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
<h1>fmt_Date.jsp</h1>
<h2>날짜, 시간을 원하는 형태로 출력하기!</h2>
<c:set var="today" value="<%=new Date() %>"/>
todayInfo: ${today }<br>
defaultValue-Date(fmt:formatDate): <fmt:formatDate value="${today }"/><br> <!-- default: type="Date" -->
defaultValue-Time(fmt:formatDate, type="time"): <fmt:formatDate value="${today }" type="time"/><br>
defaultValue-Date,Time(fmt:formatDate, type="both"): <fmt:formatDate value="${today }" type="both"/><br>

<hr>
<h2>날짜 정보 출력</h2>
Date(fmt:formatDate): <fmt:formatDate value="${today }"/><br><!-- default: dateStyle="medium" -->
Date(fmt:formatDate, dateStyle="full"): <fmt:formatDate value="${today }" dateStyle="full"/><br>
Date(fmt:formatDate, dateStyle="long"): <fmt:formatDate value="${today }" dateStyle="long"/><br>
Date(fmt:formatDate, dateStyle="medium"): <fmt:formatDate value="${today }" dateStyle="medium"/><br> <!-- default! -->
Date(fmt:formatDate, dateStyle="short"): <fmt:formatDate value="${today }" dateStyle="short"/><br>

<hr>
<h2>시간 정보 출력</h2>
Time(fmt:formatDate, type="time"): <fmt:formatDate value="${today }" type="time"/><br><!-- default: timeStyle="medium" -->
Time(fmt:formatDate, type="time", timeStyle="full"): <fmt:formatDate value="${today }" type="time" timeStyle="full"/><br>
Time(fmt:formatDate, type="time", timeStyle="long"): <fmt:formatDate value="${today }" type="time" timeStyle="long"/><br>
Time(fmt:formatDate, type="time", timeStyle="medium"): <fmt:formatDate value="${today }" type="time" timeStyle="medium"/><br> <!-- default! -->
Time(fmt:formatDate, type="time", timeStyle="short"): <fmt:formatDate value="${today }" type="time" timeStyle="short"/><br>

<hr>
실습: "2023.4.14 오전 10:35:00" 출력하기.<br>
<c:set var="test" value="<%=new Date() %>"/>
<br>
내가 한거(따로적음..): <fmt:formatDate value="${test }"/> <fmt:formatDate value="${test }" type="time"/><br>
강사님(type="both" 하면 됩니다~): <fmt:formatDate value="${test }" type="both"/><!-- timeStyle="medium" --><br>
<hr>
 Date(fmt:formatDate): <fmt:formatDate value="${today }"/><br>
 Date(fmt:formatDate, type="date", pattern="yyyy/MM/dd"): <fmt:formatDate value="${today }" type="date" pattern="yyyy/MM/dd"/><br> <!-- "mm"은 분을 나타내는 단위이기때문에 사용하면 안된다!! -->
 Date(fmt:formatDate, type="date", pattern="yy-MM-dd"): <fmt:formatDate value="${today }" type="date" pattern="yy-MM-dd"/><br>
 Date(fmt:formatDate, type="date", pattern="[yy,MM,dd]"): <fmt:formatDate value="${today }" type="date" pattern="[yy,MM,dd]"/><br>
 Date(fmt:formatDate, type="date", pattern="[yy,MM,dd](E)"): <fmt:formatDate value="${today }" type="date" pattern="[yy,MM,dd](E)"/><br>
<hr>
Time(fmt:formatDate, type="time"): <fmt:formatDate value="${today }" type="time"/><br>
Time(fmt:formatDate, type="time" pattern="hhmmss"): <fmt:formatDate value="${today }" type="time" pattern="hhmmss"/><br>
Time(fmt:formatDate, type="time" pattern="hh:mm:ss"): <fmt:formatDate value="${today }" type="time" pattern="hh:mm:ss"/><br>
Time(fmt:formatDate, type="time" pattern="(a)hh:mm:ss"): <fmt:formatDate value="${today }" type="time" pattern="(a)hh:mm:ss"/><br>

</body>
</html>