<%@page import="data.dao.AnswerDao"%>
<%@page import="data.dto.AnswerDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
request.setCharacterEncoding("utf-8");

String content=request.getParameter("content");
String idx=request.getParameter("idx");
String currentPage=request.getParameter("currentPage");

AnswerDto dto=new AnswerDto();

dto.setContent(content);
dto.setIdx(idx);

AnswerDao dao=new AnswerDao();

dao.updateAnswer(dto);

response.sendRedirect("../index.jsp?main=guest/guestlist.jsp?currentPage="+currentPage);


%>