<%@page import="data.dao.SmartDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%

//nums를 읽는다
String nums=request.getParameter("nums");

String currentPage=request.getParameter("currentPage");

//,로 분리해서 []
String[] num=nums.split(",");

//배열의 갯수만큼 delete한 후
SmartDao dao=new SmartDao();

for(String n:num)
{
	dao.deleteSmart(n);
}

//목록
response.sendRedirect("../index.jsp?main=board/boardlist.jsp?currentPage="+1);

%>