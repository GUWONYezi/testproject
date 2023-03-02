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

<style type="text/css">
	div.layout{
		border: 0px solid gray;
		position: absolute;
		font-family: 'Gamja Flower';
	}
	
	div.title{
		width: 100%;
		height: 80px;
		line-height: 80px;
		font-size: 25px;
		top: 50px;
		text-align: center;
	}
	
	div.menu{
		width: 100%;
		height: 80px;
		font-size: 20px;
		top: 150px;
		text-align: center;
	}
	
	div.info{
		width: 170px;
		height: 200px;
		font-size: 15pt;
		top: 280px;
		border: 1px solid gray;
		border-radius: 20px;
		left: 50px;
		padding: 20px 10px;
	}
	
	div.main{
		width: 1200px;
		height: 800px;
		font-size: 12pt;
		top: 280px;
		left: 250px;
		padding: 30px;
		margin-left: 50px;
	}
</style>

</head>
<body>
<!-- 프로젝트 최초 실행시 호출되는 파일 -->
<%
	String mainPage="layout/main.jsp";

	//url을 통해서 main값을 읽어서 메인페이지에 출력
	if(request.getParameter("main")!=null)
	{
		mainPage=request.getParameter("main");	
	}
	
	//프로젝트 경로 구하기
	String root=request.getContextPath();
%>

<%=root%>
</body>

	<div class="layout title">
		<jsp:include page="layout/title.jsp"></jsp:include>
	</div>
	
	<div class="layout menu">
		<jsp:include page="layout/menu.jsp"></jsp:include>
	</div>
	
	<div class="layout info">
		<jsp:include page="layout/info.jsp"></jsp:include>
	</div>
	
	<div class="layout main">
		<jsp:include page="<%=mainPage %>"></jsp:include>
	</div>

</html>













