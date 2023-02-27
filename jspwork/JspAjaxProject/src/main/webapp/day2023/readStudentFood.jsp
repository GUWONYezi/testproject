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

</head>
<body>
	<div style="margin:10px;">
		<h2>studentToJson.jsp ajax쿼리로 읽어오기</h2>
		<button type="button" class="btn btn-default" id="student">student.json</button>
		
		<h2>foodToXml.jsp ajax쿼리로 읽어오기</h2>
		<button type="button" class="btn btn-default" id="food">food.xml</button>
	</div>
	
	<div id="show" style="margin: 10px"></div>
	
	<script type="text/javascript">
		$("#student").click(function() {
			$.ajax({
				type:"get",
				url:"studentToJson.jsp",
				dataType:"json",
				success: function(res){
					var s="";
					
					$.each(res,function(i,ele){
						s+="<div class='alert alert-success' style='width:300px'>"
						s+="No. "+ele.num+",";
						s+="학생명: "+ele.stuname+"<br>";
						s+="자바 점수: "+ele.java+"<br>";
						s+="ajax 점수: "+ele.ajax+"<br>";
						s+="<img src='"+ele.photo+"' width='120'>";
						s+="</div>"
					});
					
					$("#show").html(s);
				}
			});
		});
		
		$("#food").click(function() {
			$.ajax({
				type:"get",
				url:"foodToXml.jsp",
				dataType:"xml",
				success: function(res){
					var s="";
					
					$(res).find("food").each(function(i,ele){
						var n=$(ele);
						s+="<div class='alert alert-warning' style='width:300px'>"
						s+="No. "+n.attr("num")+", ";
						s+="음식 이름: "+n.find("foodname").text()+"<br>";
						s+="가격: "+n.find("price").text()+"<br>";
						s+="수량: "+n.find("cnt").text()+"<br>";
						s+="<img src='"+n.find("foodphoto").text()+"' width='120'>";
						s+="</div>"
					});
					
					$("#show").html(s);
				}
			});
		});
	</script>
</body>
</html>












