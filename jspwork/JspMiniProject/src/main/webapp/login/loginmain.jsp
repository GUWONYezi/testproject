<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link
        href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
        rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>

</head>
<body>
	<%
	//세션에 저장된 loginok를 읽는다
	String loginok=(String)session.getAttribute("loginok");
	
	//로그아웃
	if(loginok==null)
	{%>
		<jsp:include page="loginform.jsp"></jsp:include>
	<%}else{%>
		<jsp:include page="logoutform.jsp"></jsp:include>
	<%}
	
	%>
</body>
</html>