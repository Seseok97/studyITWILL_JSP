<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script type="text/javascript">
		function popClose() {
			window.close(); // 창 닫기 function
		}
		function setPopup(obj){
			//js에서의 this : 이벤트 발생 시점의 대상
			if(obj.checked == true){
				//쿠키생성
				var expDate = new Date(); // 오늘의 날짜정보 저장(유효기간 만들기)
				expDate.setMonth(expDate.getMonth()+1); // 유효기간을 1달으로 지정함(+1 한게 그거임.)
				
				document.cookie = "notShowPop="+"true"+";path=/;expires="+expDate.toGMTString();
				//				   notShowPop=true;path=/;expires=20230402		// cookie의 내용
				//					이런식으로 구분짓고 떨어뜨리고 하는 이유는 나중에 변수로 대체될 가능성을 고려한 것 !!
				window.close();
			}
			
		}
	
	</script>
</head>
<body>
	<h1>popUp.jsp</h1>
	<h2>팝업창(광고)</h2>

	<img src="a.png">
	
	<br>
	<br>
	<br>
	<br>
	
	<input type="checkbox" onclick="setPopup(this);">오늘 더 이상 팝업창 띄우지 않기.
	<input type="button" value="종료" onclick=" popClose(); ">

</body>
</html>