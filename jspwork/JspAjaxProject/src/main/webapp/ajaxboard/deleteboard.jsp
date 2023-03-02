<%@page import="ajaxboard.model.AjaxBoardDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	//num읽어오기
	String num=request.getParameter("num");
	
	//dao
	AjaxBoardDao dao=new AjaxBoardDao();
	//삭제
	dao.deleteAjaxBoard(num);
%>