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

<%
//id
String id=(String)session.getAttribute("myid");

MemberDao dao=new MemberDao();

String name=dao.getName(id);
%>

</head>
<body>
	<img alt="" src="image2/8.png">
	<span><b><%=name %></b>님</span>
	<br><br>
	<button type="button" class="btn btn-danger" id="logout" style="width: 120px;"
	onclick="location.href='login/logoutaction.jsp'">로그아웃</button>
	
</body>
</html>