<%@page import="data.dao.AnswerDao"%>
<%@page import="data.dto.AnswerDto"%>
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
request.setCharacterEncoding("utf-8");

//num,myid,currentPage
String num=request.getParameter("num");
String myid=request.getParameter("myid");
String content=request.getParameter("content");
String currentPage=request.getParameter("currentPage");

//dto
AnswerDto dto=new AnswerDto();

dto.setNum(num);
dto.setMyid(myid);
dto.setContent(content);

//dao
AnswerDao dao=new AnswerDao();

//insert
dao.insertAnswer(dto);

//페이지 이동
response.sendRedirect("../index.jsp?main=guest/guestlist.jsp?currentPage="+currentPage);

%>
</body>
</html>











