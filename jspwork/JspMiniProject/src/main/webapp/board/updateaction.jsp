<%@page import="data.dao.SmartDao"%>
<%@page import="data.dto.SmartDto"%>
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

//값 얻기
String writer=request.getParameter("writer");
String subject=request.getParameter("subject");
String content=request.getParameter("content");

//num, currentPage
String num=request.getParameter("num");
String currentPage=request.getParameter("currentPage");

//dto
SmartDto dto=new SmartDto();

dto.setWriter(writer);
dto.setSubject(subject);
dto.setContent(content);
dto.setNum(num);

//dao
SmartDao dao=new SmartDao();

//update
dao.updateSmart(dto);

response.sendRedirect("../index.jsp?main=board/detailview.jsp?num="+num+"&currentPage="+currentPage);

%>
</body>
</html>







