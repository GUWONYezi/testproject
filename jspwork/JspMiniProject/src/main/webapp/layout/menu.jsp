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

<link rel="stylesheet" type="text/css" href="menu/css/font-awesome.css">
	<link rel="stylesheet" type="text/css" href="menu/css/menu.css">
    
	<script type="text/javascript" src="menu/js/jquery.js"></script>
	<script type="text/javascript" src="menu/js/function.js"></script>

</head>
<%
	//프로젝트 경로 구하기
	String root=request.getContextPath();

	//아이디
	String myid=(String)session.getAttribute("myid");
	
	//로그인 상태
	String loginok=(String)session.getAttribute("loginok");
%>

<body>
<div id="wrap">
	<header>
		<div class="inner relative" style="padding-top: 10px;">
			<a class="logo" href="http://www.freshdesignweb.com"></a>
			<a id="menu-toggle" class="button dark" href="#"><i class="icon-reorder"></i></a>
			<nav id="navigation">
				<ul id="main-menu">
					<li class="current-menu-item"><a href="<%=root %>/index.jsp">Home</a></li>
					<li class="parent">
						<a href="#">Member</a>
						<ul class="sub-menu">
							<li><a href="<%=root %>/index.jsp?main=member/addform.jsp">회원가입</a></li>
							<li><a href="<%=root %>/index.jsp?main=member/myinfo.jsp">마이정보</a></li>
							
							<%
							//관리자만 멤버목록을 볼 수 있게
							//로그인중이고 그 아이디가 관리자
							if(loginok!=null && myid.equals("admin")){%>
								<li><a href="<%=root %>/index.jsp?main=member/memberlist.jsp">회원목록</a></li>
							<%
							}%>
						</ul>
					</li>
					<li class="parent">
						<a href="#">방명록</a>
						<ul class="sub-menu">
							<li><a href="<%=root %>/index.jsp?main=guest/guestlist.jsp">방명록</a></li>
						</ul>
					</li>
					<li class="parent">
						<a href="#">Board</a>
						<ul class="sub-menu">
							<li><a href="<%=root %>/index.jsp?main=board/boardlist.jsp">Q&A게시판</a></li>
							<li><a href="#">업로드게시판</a></li>
							<li><a href="index.jsp?main=board/smartform.jsp">스마트게시판</a></li>
						</ul>
					</li>
					<li><a href="#">SHOP</a></li>
				</ul>
			</nav>
			<div class="clear"></div>
		</div>
	</header>	
</div>    
<%-- 	<a href="<%=root %>/index.jsp">메인</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="<%=root %>/index.jsp?main=login/loginmain.jsp">로그인</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="<%=root %>/index.jsp?main=member/addform.jsp">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="<%=root %>/index.jsp?main=member/memberlist.jsp">회원목록</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="<%=root %>/index.jsp?main=guest/guestlist.jsp">방명록</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="<%=root %>/index.jsp?main=board/boardlist.jsp">Q&A게시판</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="#">스마트게시판</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="#">상품등록</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --%>
</body>
</html>