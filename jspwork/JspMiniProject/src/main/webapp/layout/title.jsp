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
<%
	//프로젝트 경로 구하기
	String root=request.getContextPath();
%>

<body>
	<a href="<%=root %>">
	<img alt="" src="image/title.png">
	JSP%Jquery 미니프로젝트
	</a>
	
	<div style="float: right; padding-right: 100px; ">
		<%
		//로그인 세션 얻기
		String loginok=(String)session.getAttribute("loginok");
		//아이디 얻기+이름
		String myid=(String)session.getAttribute("myid");
		MemberDao dao=new MemberDao();
		String name=dao.getName(myid);
		
		//로그아웃 상태
		if(loginok==null)
		{%>
			<button type="button" class="btn btn-success" 
			style="width: 100px;" 
			onclick="location.href='index.jsp?main=login/loginmain.jsp'">Login</button>
		<%}else{
		//로그인 상태
		%>
			<b style="font-size: 12pt;"><%=name %>님 로그인중...</b>
			<button type="button" class="btn btn-danger" 
			style="width: 100px;" 
			onclick="location.href='login/logoutaction.jsp'">Logout</button>
		<%}
		
		%>
	</div>
</body>
</html>












