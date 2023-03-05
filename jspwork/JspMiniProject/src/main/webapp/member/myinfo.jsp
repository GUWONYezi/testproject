<%@page import="data.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
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

//세션
String loginok=(String)session.getAttribute("loginok");
String myid=(String)session.getAttribute("myid");

%>

<script>

function delfunc(num)
{
	var yes=confirm("정말 삭제 하시겠습니까?");
	
	if(yes)
	{
		location.href='member/myinfodelete.jsp?num='+num;
	}
}

</script>

</head>
<body>
	<table class="table table-bordered" style="width: 500px;">
			<%
			for(MemberDto dto:list)
			{%>
			
			<%
			//로그인중이면서 로그인한 아이디와 같은 사람만 보기
			if(loginok!=null && dto.getId().equals(myid)){%>
				<tr>
					<th>이름</th>
					<td><%=dto.getName() %></td>
				</tr>
				<tr>
					<th>아이디</th>
					<td><%=dto.getId() %></td>
				</tr>
				<tr>
					<th>핸드폰</th>
					<td><%=dto.getHp() %></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><%=dto.getAddr() %></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><%=dto.getEmail() %></td>
				</tr>
				<tr>
					<th>가입일</th>
					<td><%=sdf.format(dto.getGaipday()) %></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="button" class="btn btn-danger" 
						onclick="delfunc(<%=dto.getNum()%>)">삭제</button>
						<button type="button" class="btn btn-default" 
						onclick="location.href='index.jsp?main=member/updateform.jsp?num=<%=dto.getNum()%>'">수정</button>
						<!-- onclick="location.href='member/memberdelete.jsp?num=<%=dto.getNum()%>'" -->
					</td>
				</tr>
			<%}
			}
			%>
	</table>
</body>
</html>














