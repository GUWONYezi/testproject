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
	div.box{
		width:15px;
		height:15px;
		border: 2px solid grya;
		border-radius: 20px;
	}
</style>
<script type="text/javascript">
	$(function(){
		
		$("#btn1").click(function(){
			
			$.ajax({
				type:"get",
				url:"jshopToJson.jsp",
				dataType:"json",
				success:function(data){
					var s="<table class='table table-bordered' style='width:700px;'>";
					
					s+="<caption><b>json jshop읽어오기</b></caption>";
					s+="<tr bgcolor='lightyellow'>";
					s+="<th>번호</th><th>상품명</th><th>색상</th><th>가격</th><th>이미지</th>";
					s+="</tr>";
						
					$.each(data,function(i,elt){	
						s+="<tr align='center'>";
						s+="<td>"+elt.num+"</td>";
						s+="<td>"+elt.sangpum+"</td>";
						s+="<td>"+elt.color+"<br>"+
						"<div class='box' style='background-color:"+elt.color+";'></div></td>";
						s+="<td>"+elt.price+"</td>";
						s+="<td>"+"<img src='"+elt.imagename+"' width='50'>"+"</td>";
						s+="</tr>";
					});
					
					s+="</table>";
					s+=$("#show").html(s);
				}
			});
			
		});
		
	});

</script>

</head>
<body>
	<button type="button" class="btn btn-info" id="btn1">Jshop DB읽어오기</button>
	
	<div id="show"></div>
</body>
</html>