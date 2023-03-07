<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="dao" class="data.dao.SmartAnswerDao"></jsp:useBean>
<jsp:useBean id="dto" class="data.dto.SmartAnswerDto"/>
<jsp:setProperty property="*" name="dto"/>

<%

	dao.insertSmartAnswer(dto);

%>