<%@page import="data.dao.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.GuestDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.GuestDao"%>
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

span.day{
	float: right;
	font-size: 11pt;
	color: gray;
}

</style>

<%
	//로그인상태 확인후 입력폼 나타내기
	String loginok=(String)session.getAttribute("loginok");

	//id
	String myid=(String)session.getAttribute("myid");

	//페이징--------------------------------
	GuestDao dao=new GuestDao();
	
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
	 List<GuestDto> list=dao.getList(start, perPage);
	 
	 SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	 
	 //현제 페이지에서 보여질 첫번째 게시글 번호=전체 게시글 수-(현재 페이지-1)*보여지는 게시글 수
	 //내림차순이라 마지막 게시글부터 보여줌-> 마지막 게시글 번호==전체 게시글 수
	 no=totalCount-(currentPage-1)*perPage;
%>

</head>
<body>
	<%
		if(loginok!=null)
		{%>
			<jsp:include page="addform.jsp"/>
			<hr align="left" width="800">
		<%}
	%>
	
	<!-- 페이징 -->
	<div>
		<b>총 <%=totalCount %>개의 방명록 글이 있습니다</b>
		<%
			MemberDao mdao=new MemberDao();
		
			for(GuestDto dto:list)
			{
				//이름얻기
				String name=mdao.getName(dto.getMyid());
				%>
				
				<table class="table" style="width: 600px;">
					<tr>
						<td>
							<span class="glyphicon glyphicon-user"></span>
							<b><%=name %>(<%=dto.getMyid() %>)</b>
							
							<%
								//로그인한 아이디와 글을 쓴 아이디가 같을 경우에만 수정삭제 보이게...
								if(loginok!=null && dto.getMyid().equals(myid))
								{%>
									| <a href="" style="color: black;">수정</a>
									| <a href="guest/delete.jsp?num=<%=dto.getNum() %>&currentPage=<%=currentPage %>" 
										style="color: black;">삭제</a>
								<%}
							%>
							
							<span class="day"><%=sdf.format(dto.getWriteday()) %></span>
						</td>
					</tr>
					
					<tr>
						<td>
							<!-- 이미지가 null이 아닌 경우만 출력 -->
							<%
								if(dto.getPhotoname()!=null){%>
									<a href="save/<%=dto.getPhotoname()%>" target="_new">
									<img alt="" src="save/<%=dto.getPhotoname()%>" align="left" 
									style="width: 100px;"></a>
								<%}
							%>
							
							<%=dto.getContent().replace("\n", "<br>") %>
						</td>
					</tr>
				</table>
				
			<%}
		%>
	</div>
	
	<!-- 페이징 처리 -->
	<div style="width: 500px; text-align: center;" class="container">
		<ul class="pagination">
			<%
			//이전
			//현재 시작페이지가 1보다 크면
			if(startPage>1)
			{%>
				<li>
					<a href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=startPage-1 %>">이전</a>
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
						<a href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=pp %>"><%=pp %></a>
					</li>
				<%}
				//현재 페이지 이외의 페이지들
				//눌렀을 때 해당 페이지 번호를 넘긴다(페이지 이동)
				else
				{%>
					<li>
						<a href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=pp %>"><%=pp %></a>
					</li>	
				<%}
			}
			
			//다음
			//현재 보이는 마지막 페이지가 전체 페이지수가 아니면(즉, 최종 페이지가 아니라면)
			//마지막 페이지의 다음 페이지로 넘어간다(넘어가면 startPage를 아예 바꿈)
			if(endPage<totalPage)
			{%>
			<li>
				<a href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=endPage+1 %>">다음</a>
			</li>	
			<%}
			
			%>
		</ul>
	</div>
</body>
</html>