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
	div.memo{
		position: absolute;
		border: 0px solid gray;
		font-size: 1.5em;
		font-family: 'Gamja Flower';
	}
	
	div.button{
		line-height: 140px;
		top: 30px;
		width: 400px;
		height: 100px;
		line-height: 100px;
		text-align: center;
	}
	
	div.addform{
		left: 100px;
		top: 150px;
		width: 500px;
		height: 400px;
		padding: 20px 20px;
	}
	
	div.updateform{
		left: 100px;
		top: 150px;
		width: 500px;
		height: 400px;
		padding: 20px 20px;
	}
	
	div.list{
		left: 700px;
		top: 100px;
		width: 600px;
		height: 700px;
		padding: 20px 20px;
	}
	
	img.select{
		border: 2px solid red;
	}
	
	img.avata{
		cursor: pointer;
	}
</style>

<script type="text/javascript">
	$(function(){
		//처음 로딩시 목록 출력하기
		list();
	});

	//사용자 함수..list
	function list()
	{
		$.ajax({
			type:"get",
			dataType:"json",
			url:"memolistproc.jsp",
			success:function(res){
				//alert(res.length);
				
				var s="";
				if(res.length==0){
					s+="<h3 class='alert alert-info'>저장된 메모가 없습니다</h3>";
				}else{
					$.each(res,function(i,elt){
						s+="<table class='table'>";
						s+="<tr height='100'><td>";
						s+="<span class='wirter'>작성자:"+elt.writer+"</span>";
						s+="<span class='wirteday'>"+elt.writeday+"</span>";
						s+="<br>";
						s+="<pre>"+elt.content;
						s+="<img src='"+elt.avata+"' align='right' width='80'>";
						s+="</pre>";
						s+="</td></tr>";
						s+="</table><br>";
					});
				}
				
				$("div.list").html(s);
			}
		});
	}
	
</script>

</head>
<body>
	<div class="memo button">
		<button type="button" class="btn btn-info" id="btnadd" style="width: 120px;">
			메모추가
		</button>
	</div>
	
	<div class="memo addform">
		<form id="addform">
			<table class="table table-bordered">
				<caption><b>메모추가</b></caption>
				<tr>
					<th width="100" bgcolor="lightyellow">작성자</th>
					<td>
						<input type="text" class="form-control" name="writer" id="writer" 
						style="width: 120px">
					</td>
				</tr>
				
				<tr>
					<th width="100" bgcolor="lightyellow">메모</th>
					<td>
						<textarea style="width: 300px; height: 100px;" 
						name="content" id="cotent" class="form-control"></textarea>
					</td>
				</tr>
				
				<tr>
					<th width="100" bgcolor="lightyellow">아바타</th>
					<td>
						<input type="hidden" name="avata" id="avata">
						<script>
							var tag="";
							for(var i=1;i<=10;i++)
							{
								tag+="<img src='../avata/"+i+".png' width='50' class='avata'>";
								
								if(i==5)
									tag+="<br>";
							}
							
							document.write(tag);
						</script>
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center" style="cursor: pointer;" 
					class="dbsave">
						DB에 저장하기
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<div class="memo updateform">update</div>
	<div class="memo list">list</div>
</body>
</html>




















