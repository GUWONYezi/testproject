<%@page import="data.dao.AnswerDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%

	//idx 받기
	String idx=request.getParameter("idx");

	//dao
	AnswerDao adao=new AnswerDao();
	
	//delete
	adao.deleteAnswer(idx);

%>