<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script type="text/javascript">
	// 페이지 로드(실행) 될 때 팝업창 실행
	window.onload = pageLoad(); // function에 담지 않았을때와 같으나, 시점을 지정하였다는 점이 다르다 !!
	
	function pageLoad(){
		// 페이지 로드시 팝업을 보여줄지, 아닐지 판단(오늘 안보기 체크했다던가 !!)
		
		//쿠키정보 가져오기(js)
		var notShowPop = getCookieValue();
		
		if(notShowPop != "true"){
			//팝업열기
			window.open("popUp.jsp","pop","width=400,height=500,top=200,left=500"); // 새 창 열기
		}//if
	}//pageLoad()
	
	function getCookieValue(){
		// 쿠키정보 가져오기
		var result="false"; // 쿠키 기본값
		
		// 밑에 하는거는 쿠키의 구조를 알면 쉬운내용이라고 하심. 한번 찾아보던지 하자.
		if(document.cookie != ""){
// 			alert(document.cookie);
			var cookie = document.cookie.split(";"); // ;를 기준으로 나누어 배열으로 저장한다.
			
			for(var i=0;i<cookie.length;i++){
				var elements = cookie[i].split("=");
				var value = elements[0]; // 쿠키이름(key)
				value = value.replace(/^\s*/,''); // 정규표현식 >> 쿠키 정보속의 공백을 제거하는 것.
				
				if(value == "notShowPop"){
					result = element[1]; // 해당 쿠키값을 저장
				}//if
			}//for
		}//if
		return result;
	}//getCookieValue() function end
	
	// popUp.jsp 페이지의 setPopup() 펑션 참고해서 따라가기. 원리만 알면 그렇게 어려운 개념은 아님.
	// 그냥 쿠키 내용을 뚝딱뚝딱 만들어서 이 페이지에서 분해한 다음에 저장하는 ,, 그런거 !!
	
	function deleteCookie(){
		//쿠키정보 삭제(쿠키의 유효기간을 제거 !)
		//notShowPop=true;path=/;expires=20230402
		document.cookie="notShowPop="+"false"+";path=/;expires=-1"
		// 변수의 여지에 따라 떨어뜨리거나 붙이거나 하는 것 !!
	}//deleteCookie() function end
	
	
	
	</script>

</head>
<body>
	<h1>cookiePopup.jsp</h1>
	<h2>쿠키(해더)</h2>
	
	<input type="button" value="쿠키 삭제" onclick="deleteCookie();">
	
</body>
</html>