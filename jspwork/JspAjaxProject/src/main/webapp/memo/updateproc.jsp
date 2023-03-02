<%@page import="meno.model.MemoDao"%>
<%@page import="meno.model.MemoDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	//수정폼에서 받은 값 읽기(unum,uwriter...)
	String num=request.getParameter("unum");
	String writer=request.getParameter("uwriter");
	String content=request.getParameter("ucontent");
	String avata=request.getParameter("uavata");

	//dto
	MemoDto dto=new MemoDto();
	
	dto.setNum(num);
	dto.setWriter(writer);
	dto.setContent(content);
	dto.setAvata(avata);
	
	//updqte(수정)
	MemoDao dao=new MemoDao();
	dao.updateMemo(dto);
%>