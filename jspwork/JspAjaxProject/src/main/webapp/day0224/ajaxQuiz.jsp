<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.6.3.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Stylish&family=Sunflower&display=swap" rel="stylesheet">

<style type="text/css">
.menu>li{
	float:left;
	list-style: none;
	padding: 10px 20px 10px 20px;
	background-color: lightyellow;
	border: 2px solid orange;
}

.menu>li:hover{
	background-color: orange;
	cursor: pointer;
}

#show{
	margin: 15px;
}

div.box{
	width:15px;
	height:15px;
	border: 2px solid grya;
	border-radius: 20px;
}
</style>

<script type="text/javascript">
	$(function(){
		/////
		
		$("#home").click(function(){
			var imgname="../image/home.jpg";
			var imgtag="<img src='"+imgname+"'>"
			
			$("#show").html(imgtag);
		});
		
		$("#jshop").click(function(){
			$.ajax({
				type:"get",
				url:"jshopToJson.jsp",
				dataType:"json",
				success:function(data){
					var s="";
					
					s+="<h3 class='alert alert-warning' style='width:700px;'><b>Jshop</b></h3>";
						
					$.each(data,function(i,elt){	
						s+="<div class='alert alert-warning' style='width:700px;'>";
						s+="No. "+elt.num+"&nbsp;";
						s+="상품명: "+elt.sangpum+"<br>";
						s+="색상: "+elt.color+"&nbsp;"+
						"<div class='box' style='background-color:"+elt.color+";'></div><br>";
						s+="가격: "+elt.price+"<br>";
						s+="<img src='"+elt.imagename+"' width='50'>";
						s+="</div>"
					});
					
					s+="</div>";
					s+=$("#show").html(s);
				}
			});
		});
		
		$("#simpleboard").click(function(){
			$.ajax({
				type:"get",
				url:"sboardToJson.jsp",
				dataType:"json",
				success:function(data){
					var s="<table class='table table-condensed' style='width:700px;'>";
					
					s+="<caption><b>simpleboard</b></caption>";
					s+="<tr bgcolor='skyblue'>";
					s+="<th>번호</th><th>작성자</th><th>제목</th><th>내용</th><th>조회수</th><th>작성일</th>";
					s+="</tr>";
						
					$.each(data,function(i,elt){	
						s+="<tr>";
						s+="<td>"+elt.num+"</td>";
						s+="<td>"+elt.writer+"</td>";
						s+="<td>"+elt.subject+"</td>";
						s+="<td>"+elt.content+"</td>";
						s+="<td>"+elt.readcount+"</td>";
						s+="<td>"+elt.writeday+"</td>";
						s+="</tr>";
					});
					
					s+="</table>";
					s+=$("#show").html(s);
				}
			});
		});
		
		
		/////
	});
</script>

</head>
<body>
	<ul class="menu">
		<li id="home">Home</li>
		<li id="jshop">Jshop</li>
		<li id="simpleboard">SimpleBoard</li>
	</ul>
	<br style="clear: both;">
	<div id="show"></div>
</body>
</html>










