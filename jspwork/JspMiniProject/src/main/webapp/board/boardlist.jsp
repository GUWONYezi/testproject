<%@page import="java.text.SimpleDateFormat"%>
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
//페이징--------------------------------
	SmartDao dao=new SmartDao();
	
	int totalCount; //총 게시글 수
	int totalPage; //총페이지수
	int startPage; //각 블럭의 시작 페이지(블럭=하단의 페이지를 나타내는 곳)
	int endPage; //각 블럭의 끝페이지
	int start; //각 페이지의 시작 번호
	int perPage=3; //한 페이지에 보여질 글의 개수
	int perBlock=5; //한 블럭당 보여지는 페이지 개수
	int currentPage; //현재 페이지1
	int no;
	
	//총 갯수
	totalCount=dao.getTotalCount();
	
	//현재 페이지 번호 읽기(단 null일 때는 1페이지로 설정)
	if(request.getParameter("currentPage")==null)
		currentPage=1;
	else
	    currentPage=Integer.parseInt(request.getParameter("currentPage"));
	
	//총 페이지 개수
	totalPage=totalCount/perPage+(totalCount%perPage==0?0:1); //마지막 게시글이 하나만 남더라도 한 페이지에 둔다.
	  
	//각 블럭의 시작 페이지..현재 페이지가3(s:1,e:5)	 6(s:6,e:10)
	//한 블럭당 보여지는 페이지 개수를 고려하여 보여질 시작페이지를 계산
	//perBlock(보여지는 개수)보다 작거나 같으면 나눴을 때 0이 나오기 때문에 시작 페이지가 1
	//크면 나눠진 몫 값*보여지는 개수+1 (1*5+1=6 : 하나 오버했을 때)
		startPage=(currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;
	
	 //총 페이지가 8. (6~10...endpage를 8로 수정해주어야 한다)
	 //위에서 계산된 마지막 페이지가 실제로 있는 게시글보다 오버됐을 때를 예방
	 if(endPage>totalPage)
	    endPage=totalPage;
	 
	 //각 페이지에서 불러올 시작번호 = limit start,perPage 에서 시작인덱스를 나타내는 start값
	 //(현재 페이지-1)*perPage <= 한 블럭당 보여지는 페이지 개수를 고려하여 시작번호를 구한다
	 // 1페이지 시작번호: 0, 5개씩 / 2페이지 시작번호: 5, 5개씩 (db인덱스는 0부터 시작, 실제 no에서 -1해준다)
	 start=(currentPage-1)*perPage;
	 
	 //각 페이지에서 필요한 게시글 가져오기
	 //limit start,perPage
	 List<SmartDto> list=dao.getList(start, perPage);
	 
	 SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	 
	 //현제 페이지에서 보여질 첫번째 게시글 번호=전체 게시글 수-(현재 페이지-1)*보여지는 게시글 수
	 //내림차순이라 마지막 게시글부터 보여줌-> 마지막 게시글 번호==전체 게시글 수
	 no=totalCount-(currentPage-1)*perPage;

%>

<style type="text/css">
a:link, a:visited {
	color: black;
	text-decoration: none;
}

</style>


<script type="text/javascript">

$(function(){
	//전체선택
	$("input.alldelcheck").click(function(){
		var chk=$(this).is(":checked")
		
		//console.log(chk); //true false
		
		//prop()=>값전달
		//전체체크값을 글앞의 체크에 일괄전달
		$(".alldel").prop("checked",chk);
		
		/*
		if(chk){
			$(".alldel").attr("checked","chekced");
		}else{
			$(".alldel").attr("checked",false);
		}*/
	})

	//삭제
	$("#btndel").click(function(){
		
		//체크된 길이
		var len=$(".alldel:checked").length;
		//alert(len);
		
		if(len==0){
			alert("최소 1개 이상의 글을 선택해주세요");
		}else{
			var a=confirm(len+"개의 글을 삭제하려면 [확인]을 눌러주세요");
			
			//체크된 곳의 value(num)
			
			var n="";
			$(".alldel:checked").each(function(idx){
				n+=$(this).val()+",";
			});
			//마지막 ,값 지워주기
			n=n.substring(0,n.length-1);
			//alert(n);
			
			//삭제파이롤 전송
			location.href="board/alldelete.jsp?nums="+n+"&currentPage="+<%=currentPage%>;
		}
		
	});
})

</script>

</head>
<body>

<div style="margin: 30px 30px; width: 800px;">
	<br>
	<h6><b>총 <%=totalCount %>개의 게시글이 있습니다</b></h6>
	<table class="table table-bordered">
		<caption><b>스마트 게시판 목록</b></caption>
		<tr>
			<th width="80">번호</th>
			<th width="400">제목</th>
			<th width="120">작성자</th>
			<th width="150">작성일</th>
			<th width="60">조회</th>
		</tr>
		
		<%
			if(totalCount==0)
			{%>
				<tr>
					<td colspan="5" align="center">
						<h3>등록된 게시글이 없습니다</h3>
					</td>
				</tr>	
			<%}else{
				for(SmartDto dto:list){%>
					<tr>
						<td align="center">
							<input type="checkbox" class="alldel" value="<%=dto.getNum() %>">
							&nbsp;&nbsp;
							<%=no-- %>
						</td>
						<td>
							<a href="index.jsp?main=board/detailview.jsp?num=<%=dto.getNum() %>&currentPage=<%=currentPage %>"><%=dto.getSubject() %></a>
						</td>
						<td>
							<b><%=dto.getWriter() %></b>
						</td>
						<td style="color: gray">
							<%=sdf.format(dto.getWriteday()) %>
						</td>
						<td>
							<%=dto.getReadcount() %>
						</td>
					</tr>
				<%}
			}
		%>
		
		<tr>
			<td colspan="5">
				<input type="checkbox" class="alldelcheck">전체선택
				<span style="float: right;">
					<button type="button" class="btn btn-danger btn-sm" id=btndel>
					<span class="glyphicon glyphicon-remove"></span>삭제</button>
					
					&nbsp;
					<button type="button" class="btn btn-success btn-sm" 
					onclick="location.href='index.jsp?main=board/smartform.jsp'"><span class="glyphicon glyphicon-pencil">글쓰기</span></button>
				</span>
			</td>
		</tr>
		
	</table>
</div>


<!-- 페이징 처리 -->
	<div style="width: 500px; text-align: center;">
		<ul class="pagination">
			<%
			//이전
			//현재 시작페이지가 1보다 크면
			if(startPage>1)
			{%>
				<li>
					<a href="index.jsp?main=board/boardlist.jsp?currentPage=<%=startPage-1 %>">이전</a>
				</li>	
			<%}
			
			//현재 보이는 블록의 페이지를 처리
			for(int pp=startPage;pp<=endPage;pp++)
			{
				//현재 페이지일 때
				//active효과를 줘서 현재 페이지임을 나타냄
				//누르면 해당 페이지로 넘어감(현재 페이지)
				if(pp==currentPage)
				{%>
					<li class="active">
						<a href="index.jsp?main=board/boardlist.jsp?currentPage=<%=pp %>"><%=pp %></a>
					</li>
				<%}
				//현재 페이지 이외의 페이지들
				//눌렀을 때 해당 페이지 번호를 넘긴다(페이지 이동)
				else
				{%>
					<li>
						<a href="index.jsp?main=board/boardlist.jsp?currentPage=<%=pp %>"><%=pp %></a>
					</li>	
				<%}
			}
			
			//다음
			//현재 보이는 마지막 페이지가 전체 페이지수가 아니면(즉, 최종 페이지가 아니라면)
			//마지막 페이지의 다음 페이지로 넘어간다(넘어가면 startPage를 아예 바꿈)
			if(endPage<totalPage)
			{%>
			<li>
				<a href="index.jsp?main=board/boardlist.jsp?currentPage=<%=endPage+1 %>">다음</a>
			</li>	
			<%}
			
			%>
		</ul>
	</div>

</body>
</html>





















