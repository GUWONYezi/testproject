<%@page import="data.dto.GuestDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.GuestDao"%>
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

<%
	//로그인상태 확인후 입력폼 나타내기
	String loginok=(String)session.getAttribute("loginok");
%>

</head>
<body>
	<%
		if(loginok!=null)
		{%>
			<jsp:include page="addform.jsp"/>
			<hr align="left" width="800">
		<%}
	%>
	
	<b>방명록 출력할 곳!!!</b>
</body>
</html>