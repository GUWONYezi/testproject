<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.SmartDto"%>
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

<style type="text/css">

</style>

<script type="text/javascript">

$(function(){
	
	//처음에 시작시 리스트 호출
	//list();
	
	$("#btnanswer").click(function(){
		var nickname=$("#nickname").val();
		var content=$("#content").val();
		var num=$("#num").val();
		
		location.href="smartanswer/insertanswer.jsp?nickname="+nickname+"&content="+content+"&num="+num;
	});
	
	
});

//list 사용자정의 함수
function list(){
	
}

</script>

</head>

<body>
<%
	SmartDao dao=new SmartDao();

	String num=request.getParameter("num");
	String currentPage=request.getParameter("currentPage");
	
	//조회수 증가
	dao.updateReadCount(num);
	
	//dto가져오기
	SmartDto dto=dao.getData(num);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
%>

<div style="margin: 30px 30px;">
	<table class="table table-bordered" style="width: 500px;">
		<caption>
			<h3><b><%=dto.getSubject() %></b></h3>
		</caption>
		
		<tr>
			<td>
				<b>작성자: <%=dto.getWriter() %></b><br>
				<span class="day"><%=sdf.format(dto.getWriteday()) %></span>
				&nbsp;&nbsp;조회 <%=dto.getReadcount() %>
			</td>
		</tr>
		
		<tr>
			<td>
				<%=dto.getContent() %>
			</td>
		</tr>
		
		<!-- 댓글창 -->
		<tr>
			<td>
				<b class="acount">댓글 <span>0</span></b>
				<div class="alist">
					댓글목록
				</div>
				
				<div class="aform form-inline">
					<input type="hidden" name="num" value="<%=num %>" id="num">
					<input type="text" id="nickname" class="form-control" style="width: 100px;" placeholder="닉네임입력">
					<input type="text" id="content" class="form-control" style="width: 300px;" placeholder="댓글입력">
					<button type="button" id="btnanswer" class="btn btn-info">저장</button>
				</div>
			</td>
		</tr>
		
		<!-- 버튼 -->
		<tr>
			<td align="right">
				<button type="button" class="btn btn-default" onclick="location.href='index.jsp?main=board/smartform.jsp'">
					<span class="glyphicon glyphicon-pencil"></span>글쓰기
				</button>
				
				<button type="button" class="btn btn-default" onclick="location.href='index.jsp?main=board/updateform.jsp?num=<%=dto.getNum() %>&currentPage=<%=currentPage %>'">
					<span class="glyphicon glyphicon-edit"></span>수정
				</button>
				
				<button type="button" class="btn btn-default" onclick="funcdel(<%=num%>,<%=currentPage%>)">
					<span class="glyphicon glyphicon-trash"></span>삭제
				</button>
				
				<button type="button" class="btn btn-default" onclick="location.href='index.jsp?main=board/boardlist.jsp?currentPage=<%=currentPage %>'">
					<span class="glyphicon glyphicon-th-list"></span>목록
				</button>
			</td>
		</tr>
		
	</table>
</div>

<script type="text/javascript">

function funcdel(num,currentPage)
{

	//alert(num+","+currentPage);
	var isdel=confirm("삭제하려면 [확인]을 눌러주세요");
	
	if(isdel){
		location.href="board/deleteaction.jsp?num="+num+"&currentPage="+currentPage;
	}

}

</script>

</body>
</html>













