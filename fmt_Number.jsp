<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>fmt_Number.jsp</h1>
<h2>숫자를 원하는 형태로 출력하기!</h2>

월급: 1000000000<br>
월급(fmt_formatNumber): <fmt:formatNumber value="1000000000"/><br>
월급(fmt_formatNumber, groupingUsed=true): <fmt:formatNumber value="1000000000" groupingUsed="true"/><br>
월급(fmt_formatNumber, groupingUsed=false): <fmt:formatNumber value="1000000000" groupingUsed="false"/><br>
<!-- groupingUsed="true"가 디폴트인것을 알수있다!! -->

<hr>
3.141592 > 소수점 2자리까지만 표시!<br>
결과(fmt_formatNumber): <fmt:formatNumber value="3.141592"/><br>
결과(fmt_formatNumber,pattern=#.##): <fmt:formatNumber value="3.141592" pattern="#.##"/><br>
결과(fmt_formatNumber,pattern=#.#######): <fmt:formatNumber value="3.141592" pattern="#.#######"/><br>
<!-- 표현할 숫자보다 더 길게 #을 적는 경우, 표현범위를 벗어나기때문에 출력되지않는다. -->
<!-- #.##으로 표현할 경우, 소수점 셋째자리에서 반올림이 일어난다. -->

<hr>
10.5 소수점 2자리까지("10.50") 표시<br>
결과(fmt:formatNumber,pattern=##.00): <fmt:formatNumber value="10.5" pattern="##.00"/><br>
결과(fmt:formatNumber,pattern=##.0000): <fmt:formatNumber value="10.5" pattern="##.0000"/><br>
<!-- 비어있는 자리수를 표시하기 위해서는, 패턴에 0을 채우는것으로 표현이 가능하다. -->
결과(fmt:formatNumber,pattern=##.0011): <fmt:formatNumber value="10.5" pattern="##.0011"/><br>
<!-- 0이 아니라, 다른 수를 적어도 비어있는 자리를 채울수 있다. -->

<hr>
0.5 > 퍼센트 표시<br>
결과(fmt:formatNumber): <fmt:formatNumber value="0.5"/><br>
결과(fmt:formatNumber,type="percent"): <fmt:formatNumber value="0.5" type="percent"/><br>
결과(fmt:formatNumber,type="percent"): <fmt:formatNumber value="0.888" type="percent"/><br>
결과(fmt:formatNumber,type="percent"): <fmt:formatNumber value="2" type="percent"/><br>
결과(fmt:formatNumber,type="percent", EL): <fmt:formatNumber value="${3/12 }" type="percent"/><br>
<hr>
결과(fmt:formatNumber): <fmt:formatNumber value="1000000000"/><br>
결과(fmt:formatNumber, type="currency"): <fmt:formatNumber value="1000000000" type="currency"/><br>
결과(fmt:formatNumber, type="currency",currencySymbol="$"): <fmt:formatNumber value="1000000000" type="currency" currencySymbol="$"/><br>
결과(fmt:formatNumber, type="currency",currencySymbol="❤"): <fmt:formatNumber value="100" type="currency" currencySymbol="❤"/><br>

</body>
</html>
