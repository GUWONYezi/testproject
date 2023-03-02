<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
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

	//회원가입 값 받아오기
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	String name=request.getParameter("name");
	String hp=request.getParameter("hp");
	String addr=request.getParameter("addr");
	String email=request.getParameter("email1")+"@"+request.getParameter("email2");

	//dto
	MemberDto dto=new MemberDto();

	dto.setId(id);
	dto.setPass(pass);
	dto.setName(name);
	dto.setHp(hp);
	dto.setAddr(addr);
	dto.setEmail(email);
	
	//dao
	MemberDao dao=new MemberDao();
	
	//insert
	dao.insertMember(dto);
	
	//메인으로 이동 <- sendRedirect로 이동할 때는 ../ 를 붙여줘야함!
	response.sendRedirect("../index.jsp?main=member/gaipsuccess.jsp?id="+id);
%>

</body>
</html>



















