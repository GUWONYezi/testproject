<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dto.AnswerDto"%>
<%@page import="data.dao.AnswerDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%

String idx=request.getParameter("idx");

AnswerDao dao=new AnswerDao();
AnswerDto dto=dao.getData(idx);

JSONObject ob=new JSONObject();

ob.put("content", dto.getContent());

%>

<%=ob.toString() %>