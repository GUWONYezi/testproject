<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link
        href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
        rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>

</head>
<body>
<%
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	String cbsave=request.getParameter("cbsave"); //체크안하면 null
	
	MemberDao dao=new MemberDao();
	boolean b=dao.isIdPassCheck(id, pass);
	
	//아이디와 비번이 맞으면 3개의 세션을 저장하고
	//로그인 메인으로 이동
	if(b)
	{
		//세션 유지시간(생략시 기본 30분)
		session.setMaxInactiveInterval(60*60*8); //8시간 유지
		session.setAttribute("loginok", "yes");
		session.setAttribute("myid", id);
		session.setAttribute("saveok", cbsave==null?null:"yes");
		
		//로그인메인 이동
		response.sendRedirect("../index.jsp?main=login/loginmain.jsp");
	}else{%>
		<script type="text/javascript">
			alert("아이디와 비번이 맞지 않습니다.");
			history.back();
		</script>
	<%}
%>
</body>
</html>