<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//front에서 보낸 데이터 읽어오기
	String photono=request.getParameter("photono");
	String photostu=request.getParameter("photostu");
	String java=request.getParameter("java");
	String oracle=request.getParameter("oracle");
	String spring=request.getParameter("spring");
	
	//총점 ...String==>int
	int tot=Integer.parseInt(java)+Integer.parseInt(oracle)+Integer.parseInt(spring);
	
	//평균
	double avg=tot/3.0;
	
	//front형태로 만들어서 froont로 보내기
	JSONObject ob=new JSONObject();
	
	ob.put("photo", "../image/"+photono+".png");
	ob.put("stu", photostu);
	ob.put("tot", tot);
	ob.put("avg", avg);
%>

<%=ob.toString() %>