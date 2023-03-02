<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="ajaxboard.model.AjaxBoardDto"%>
<%@page import="ajaxboard.model.AjaxBoardDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%
	//num값을 읽어오기
	String num=request.getParameter("num");

	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");

	//해당 num값의 데이터 가져오기
	AjaxBoardDao dao=new AjaxBoardDao();
	AjaxBoardDto dto=dao.getData(num);
	
	//json으로 변환
	JSONObject ob=new JSONObject();
	
	ob.put("num", dto.getNum());
	ob.put("writer",dto.getWriter());
	ob.put("subject",dto.getSubject());
	ob.put("content",dto.getContent());
	ob.put("avata",dto.getAvata());
	ob.put("writeday",sdf.format(dto.getWriteday()));
	
%>

<%=ob.toString()%>