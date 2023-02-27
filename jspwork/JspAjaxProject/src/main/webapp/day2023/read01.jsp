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
	<img src="../image/01.png">
	<br>
	<button type="button" class="btn btn-info" id="btn1">data1.xml읽기</button>
	<button type="button" class="btn btn-danger" id="btn2">data1.json읽기</button>
	<br>
	<div id="result">결과</div>
	
	<script type="text/javascript">
		$("#btn1").click(function() {
			$("#result").empty();
			
			//xml읽기
			$.ajax({
				type: "get",
				url: "data1.xml",
				dataType:"xml",
				success:function(data){
					var s="City: "+$(data).find("name").attr("city")+"<br>";
					s+="Name: "+$(data).find("name").text()+"<br>";
					s+="Age: "+$(data).find("age").text();
					
					$("#result").append(s);
				},
				
				statusCode:{
					404:function(){
						alert("xml파일을 찾을 수 없습니다"); //실패했을 때
					},
					
					500:function(){
						alert("서버오류...코드를 다시 한 번 보세요");
					}
				}
			});
		})
		
		//json읽기
		$("#btn2").click(function(){
			$("#result").empty();
		
			//json읽기
			$.ajax({
				type: "get",
				url:"data1.json",
				dataType:"json",
				success:function(data){
					
					var s="";
					s+="이름: "+data.name+"<br>";
					s+="주소: "+data.addr+"<br>";
					s+="점수:"+data.score+"<br>";
					
					$("#result").append(s);
					
				},
				
				statusCode:{
					404:function(){
						alert("json파일을 찾을 수 없습니다"); //실패했을 때
					},
					
					500:function(){
						alert("서버오류...코드를 다시 한 번 보세요");
					}
				}
				
			});
		});
		
		
		
		
		
	</script>
</body>
</html>









