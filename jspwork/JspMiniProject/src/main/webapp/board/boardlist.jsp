<%@page import="java.util.Vector"%>
<%@page import="data.dto.SmartDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.SmartDao"%>
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

<%

SmartDao sdao=new SmartDao();
List<SmartDto> list=sdao.getAllDatas();

%>

</head>
<body>

<table class="table" style="width: 500px">
	<%
	for(SmartDto adto:list){%>
		<tr>
			<td align="left">
				<span style="font-size: 20pt"><b>제목:&nbsp;<%=adto.getSubject() %></b></span>
			</td>
			<td style="color: gray" align="right">
				<%=adto.getWriteday() %>
			</td>
		</tr>
		
		<tr>	
			<td align="left">
				<%=adto.getWriter() %>
			</td>
			<td align="right">
				<span style="color: gray; font-size: 10pt;">조회:&nbsp;<%=adto.getReadcount() %></span>
			</td>
		</tr>
		
		<tr>
			<td colspan="2" style="padding-bottom: 50px; font-size: 15pt;">
				<%=adto.getContent().replace("\n", "<br>") %>
			</td>
		</tr>
	<%}
	%>
</table>

</body>
</html>