<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.MemberDao"%>
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
//dao
MemberDao dao=new MemberDao();

//전체 멤버 목록 출력
List<MemberDto> list=dao.getAllMembers();

SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

int no=1;
%>

<style type="text/css">
th{
	text-align: center;
}

</style>

</head>
<body>
	<div>
		<table class="table table-bordered" style="width: 900px;">
			<tr bgcolor="#fff0f5">
				<th width="60">번호</th>
				<th width="80">회원명</th>
				<th width="80">아이디</th>
				<th width="140">핸드폰</th>
				<th width="340">주소</th>
				<th width="160">이메일</th>
				<th width="130">가입일자</th>
				<th width="160">수정/삭제</th>
			</tr>
			
			<%
			for(MemberDto dto:list)
			{%>
				<tr align="center">
					<td><%=no++ %></td>
					<td><%=dto.getName() %></td>
					<td><%=dto.getId() %></td>
					<td><%=dto.getHp() %></td>
					<td><%=dto.getAddr() %></td>
					<td><%=dto.getEmail() %></td>
					<td><%=sdf.format(dto.getGaipday()) %></td>
					<td>
						<button type="button" class="btn btn-default" 
						onclick="location.href='member/memberdelete.jsp?num=<%=dto.getNum()%>'">삭제</button>
					</td>
				</tr>
			<%}
			%>
		</table>
	</div>
</body>
</html>























