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
	<h2>jquery의 ajax함수를 이용해서 person(xml)_db읽어오기</h2>
	<button type="button" class="btn btn-success" id="btn1">persontoxml읽기</button>
	
	<h2>jquery의 ajax함수를 이용해서 info(json)_db읽어오기</h2>
	<button type="button" class="btn btn-success" id="btn2">infotojson읽기</button>
	
	<div id="show"></div>
	
	<script>
		$("#btn1").click(function() {
			$.ajax({
				type:"get",
				url:"persontoxml.jsp",
				dataType:"xml",
				success:function(res){
					var s="";
					$(res).find("person").each(function(i,ele){
						var n=$(ele);
						s+="<div class='alert alert-info' style='width:400px;'>";
						s+="No: "+n.attr("num")+",";
						s+="이름: "+n.find("name").text()+"<br>";
						s+="나이: "+n.find("age").text()+"<br>";
						s+="핸드폰: "+n.find("hp").text()+"<br>";
						s+="</div>"
					});
					
					$("#show").html(s);
				}
			})
		});
	
		$("#btn2").click(function() {
			$.ajax({
				type:"get",
				url:"infotojson.jsp",
				dataType:"json",
				success:function(res){
					var s="";
					$.each(res,function(i,ele){
						s+="<div class='alert alert-warning' style='width:400px;'>";
						s+="No: "+ele.num+",";
						s+="이름: "+ele.name+"<br>";
						s+="핸드폰: "+ele.hp+"<br>";
						s+="나이: "+ele.age+"<br>";
						s+="<img src='"+ele.photo+"' width='100'>";
						s+="</div>"
					});
					
					$("#show").html(s);
				}
			});
		});
	
	</script>
</body>
</html>














