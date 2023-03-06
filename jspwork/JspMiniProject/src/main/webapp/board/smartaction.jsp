<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
/*
String writer=request.getParameter("writer");
String subject=request.getParameter("subject");
String content=request.getParameter("content");

SmartDto dto=new SmartDto();

dto.setWriter(writer);
dto.setSubject(subject);
dto.setContent(content);

SmartDao dao=new SmartDao();

dao.insertSmart(dto);*/

//이미지가 업로드되는 실제경로
	String realPath=getServletContext().getRealPath("/save");
	System.out.println(realPath);
	
	int uploadSize=1024*1024*2;
	MultipartRequest multi=null;
	
	try{
		multi=new MultipartRequest(request,realPath,uploadSize,"utf-8", 
			new DefaultFileRenamePolicy());
		
		//multi변수로 모든 폼데이터 읽어오기
		String writer=multi.getParameter("writer");
		String subject=multi.getParameter("subject");
		String content=multi.getParameter("content");
		
		//dto에 저장
		SmartDto dto=new SmartDto();
		
		dto.setWriter(writer);
		dto.setSubject(subject);
		dto.setContent(content);
		
		//dao
		SmartDao dao=new SmartDao();

		dao.insertSmart(dto);
		
		//목록으로 이동
		response.sendRedirect("../index.jsp?main=board/boardlist.jsp");
		
		
	}catch(Exception e){
		System.out.println("업로드 오류"+e.getMessage());
	}


%>
</body>
</html>









