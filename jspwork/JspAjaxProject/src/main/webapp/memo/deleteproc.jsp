<%@page import="meno.model.MemoDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	//dao
	MemoDao dao=new MemoDao();
	
	//num읽기
	String num=request.getParameter("num");
	
	//delete메서드 호출
	dao.deleteMemo(num);
%>