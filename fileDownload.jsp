<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="org.apache.commons.collections4.bag.SynchronizedSortedBag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>fileDownload.jsp</h1>
	<%
	// 전달정보 저장 fileName
	String fileName = request.getParameter("fileName");
	// 서버에 업로드 했던 파일이 있는 경로!
	String savePath = "upload"; // 가상경로
	// upload 폴더의 실제 폴더를 찾는 방법
// 	String uploadPath = request.getRealPath("/upload");
	// >> 권장하지 않는 방법
	ServletContext CTX = getServletContext();
	String downloadPath = CTX.getRealPath(savePath);
	System.out.println("downloadPath = "+downloadPath);
	
	// 다운로드할 파일의 경로
	String filePath = downloadPath+"\\"+fileName;
	System.out.println("filePath : " +filePath);
	
	/////////////////////////////////////////////////////////////////////////////////////////////////
	
	// 버퍼: 파일을 일정 크기만큼씩 전달하는 배열
	//       콤퓨타는 기본적으로 정보를 옮길때 1바이트씩만 옮긴다.
	//		 근데 이렇게 하면 너무 할일이 많으니까 버퍼에 담아서 넘김.
	byte[] b = new byte[4096]; // 4KB
	
	// 파일을 읽고, 쓰고, 처리하는 객체
	FileInputStream fis = new FileInputStream(filePath);
	
	// MIME 타입?
	// 	>>  MIME 타입이란 클라이언트에게 전송된 문서의 다양성을 알려주기 위한 메커니즘입니다.
	//		웹에서 파일의 확장자는 별 의미가 없습니다. 
	//		그러므로, 각 문서와 함께 올바른 MIME 타입을 전송하도록, 
	//		서버가 정확히 설정하는 것이 중요합니다.
	//		브라우저들은 리소스를 내려받았을 때 해야 할 기본 동작이 무엇인지를 결정하기 위해 
	//		대게 MIME 타입을 사용합니다. 
	
	String mimeType = getServletContext().getMimeType(filePath); // 파일의 종류를 미리 알아둔다.
	System.out.println("mimeType: "+mimeType);
	
	if(mimeType == null){
		mimeType="application/octet-stream";
	}
	
	response.setContentType(mimeType);
	// 전달하는 데이터타입은 "mimeType" 설정
	// fileDownload.jsp의 모습을 mimeType으로 변경하겠다.
	
	///////////////////////////////////////////////////////////////////////////////////
	
	// 인코딩 영역: 8859-1 < EUC-KR < MS-949 < UTF-8 >> 한글의 표현 범위, UTF-8이 가장 넓다.
	// 현재 상황상, 업로드 할때는 UTF-8로 전달되고 있지만, 다운로드 받을때는 UTF-8 설정이 아니기때문에 깨진다!
	
	String agent = request.getHeader("User-Agent");
	boolean ieBrowser = (agent.indexOf("MSIE") > -1) 		// agent 안에 MSIE라는 글자가 있는지 확인하고, 인덱스넘버를 리턴한다. 존재하는경우 true, 없는경우 false 를 리턴하게 된다.
						|| (agent.indexOf("Trident") > -1); // agent 안에 Trident라는 글자가 있는지 확인하고, 인덱스넘버를 리턴한다. 존재하는경우 true, 없는경우 false 를 리턴하게 된다.
	if(ieBrowser){
		// ie일때
		fileName = URLEncoder.encode(fileName,"UTF-8").replaceAll("\\+", "%20");
		// >> ie 에서는 한글 파일이 깨지기때문에 UTF-8로 인코딩을 하고, \+라는 데이터를 %20(< 이거 공백임)으로 교체한다. 
	}else{
		// ie가 아닐때
		fileName = new String(fileName.getBytes("UTF-8"),"iso-8859-1");
		// >> 파일이름 한글처리 인코딩!
	} // i-e end
	
	
	System.out.println("파일전달 준비 완료!");
	/////////////////////////////////////////////////////////////////////////////////////////////
	
	// 브라우저에 포함되어있는 파서가 존재하는 경우도 다운로드의 형태로 처리!
	response.setHeader("Content-Disposition", "attachment; fileName="+fileName );
	
	out.clear();
	out = pageContext.pushBody();
	// >> 기존의 out객체를 정리!!
	
	// 데이터 전송
	ServletOutputStream out2 = response.getOutputStream(); // 전화로 치면, 전화하기전에 전파로 연결되는 것
	// >> inputStream >> 파일을 읽어오는것
	// >> outputStream >> 파일을 출력하는것!!
	// response로 정보를 출력할 준비 (통로 열어두기)

	
	int data = 0;
	while( (data = fis.read(b,0,b.length)) != -1 ){		// -1 >> 파일의 끝 (EOF)
		out2.write(b,0,data);
	}// while end
	
	out2.flush(); // 배열(버퍼)의 여백공간을 공백으로 채워서 전달한다.
	out2.close();
	fis.close(); // >> 메모리 자원을 활용하였기 때문에 끊어줘야 한다.(Stream이라서 그런듯?)

	%>
</body>
</html>