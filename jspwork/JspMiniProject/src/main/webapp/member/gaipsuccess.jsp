<%@page import="data.dao.MemberDao"%>
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
	//id읽어오기
	String id=request.getParameter("id");
	
	//dao
	MemberDao dao=new MemberDao();
	
	//아이디에 따른 이름 얻기
	String name=dao.getName(id);
%>

<div>
	<img alt="" src="image2/1.png">
	<b><%=name %>님의 회원가입을 축하합니다.</b>
	<br><br>
	<button type="button" class="btn btn-success" 
	onclick="location.href='index.jsp?main=login/loginmain.jsp'">로그인</button>
	<button type="button" class="btn btn-success" 
	onclick="location.href='index.jsp'">홈</button>
</div>

</body>
</html>