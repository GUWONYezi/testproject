<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dto.GuestDto"%>
<%@page import="data.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	//num
	String num=request.getParameter("num");

	//dao
	GuestDao dao=new GuestDao();
	
	//num에 해당하는 chu 1증가
	dao.updateChu(num);
	
	//num에 해당하는 chu값 json형식으로 반환
	int chu=dao.getData(num).getChu();
	
	//json
	JSONObject ob=new JSONObject();
	ob.put("chu", chu);
	
%>

<%=ob.toString() %>