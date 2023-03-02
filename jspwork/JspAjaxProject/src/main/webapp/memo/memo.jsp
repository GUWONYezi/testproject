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
	
	img.avata {
		cursor: pointer;
	}
	
	img.uavata {
		cursor: pointer;
	}
	
	span.writeday{
		float: right;
		color: #bbb;
	}
	
	 span.writer{
	 	font-weight: bolder;
	 }
	 
	 span.mod{
	 	cursor: pointer;
	 }
	 
	 span.del{
	 	cursor: pointer;
	 }
</style>

<script type="text/javascript">
	$(function(){
		//처음 로딩시 목록 출력하기
		list();
		
		$("div.addform").hide();
		$("div.updateform").hide();
		
		//추가버튼 나오면 addform나오고 updateform은 안 나오게
		$("#btnadd").click(function(){
			$("div.updateform").hide();
			$("div.addform").slideToggle('fast');
		});
		
		//아바타 2번 인덱스에 select클래스 추가
		$("img.avata").eq(2).addClass("select");
		
		//아바타 2번 src값을 얻어서 input태그에 넣어주기
		$("#avata").val($("img.avata").eq(2).attr("src"));
		
		//아바타 선택시 값변경
		$("img.avata").click(function(){
			//다른 형제들(다른 img태그들)의 select클래스를 삭제
			$(this).siblings().removeClass("select");
			$(this).addClass("select");
			$("#avata").val($(this).attr("src"));
		});
		
		//수정아바타 선택시 값변경
		$("img.uavata").click(function(){
			//다른 형제들(다른 img태그들)의 select클래스를 삭제
			$(this).siblings().removeClass("select");
			$(this).addClass("select");
			$("#uavata").val($(this).attr("src"));
		});
		
		//저장(insert)
		$("td.dbsave").click(function(){
			var data=$("#addform").serialize();
			//alert(data);
			
			$.ajax({
				type:"post",
				dataType:"html",
				url:"insertproc.jsp",
				data:data,
				success:function(res){
					//성공했을 시 목록 다시출력
					list();
					
					//입력값 지우기
					$("#writer").val("");
					$("#content").val("");
					
					//선택아바타 클래스 제거
					$("img.avata").removeClass("select");
					$("img.avata").eq(2).addClass("select");
					$("#avata").val($("img.avata").eq(2).attr("src"));
					
				}
			});
		
		});
		
		
		//삭제 이벤트(on<-동적이벤트)
		$(document).on("click","span.del",function(){
			var num=$(this).attr("num");
			//alert(num);
			
			$.ajax({
				
				type:"get",
				dataType:"html",
				url:"deleteproc.jsp",
				data:{"num":num},
				success:function(res){
					//성공했을 시 목록 다시출력
					list();
				}
				
			});
		});
		
		//목록의 수정버튼을 누르면 수정폼 나오게
		$(document).on("click","span.mod",function(){
			//수정할 num, 속성에서 가져오기
			var num=$(this).attr("num");
			//alert(num);
			
			//폼의 unum에 num넣기
			$("#unum").val(num);
				
			$.ajax({
				type:"get",
				url:"getdataproc.jsp",
				dataType:"json",
				data:{"num":num},
				success:function(res){
					//수정폼 태그안에 받은 값들을 채워준다.
					$("#unum").val(res.num);
					$("#uwriter").val(res.writer);
					$("#ucontent").val(res.content);
					$("#uavata").val(res.avata);
					
					//해당 이미지에 select클래스 추가
					$("img.uavata").each(function(i,ele){
						
						if($(ele).attr("src")==res.avata)
							$(ele).addClass("select");
						else
							$(ele).removeClass("select");
					});
					
					//추가폼은 숨기고 수정폼은 나타낸다
					$("div.addform").hide();
					$("div.updateform").show();
				}
					
			})
			
		});
		
		//수정(update)
		$("td.dbupdate").click(function(){
			var data=$("#updateform").serialize();
			//alert(data);
			
			$.ajax({
				type:"post",
				dataType:"html",
				url:"updateproc.jsp",
				data:data,
				success:function(res){
					//성공했을 시 목록 다시출력
					list();
					
					//updateform숨기기
					$("div.updateform").hide();
					
				}
			});
		
		});
		
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
						s+="<span class='writer'>작성자:"+elt.writer+"</span>";
						
						s+="<span class='mod' num="+elt.num+">수정|</span>";
						s+="<span class='del' num="+elt.num+">삭제</span>";
						
						s+="<span class='writeday'>"+elt.writeday+"</span>";
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
						name="content" id="content" class="form-control"></textarea>
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
	
	<div class="memo updateform">
		<form id="updateform">
		<!-- hidden으로 num보내기 -->
		<input type="hidden" id="unum" name="unum">
			<table class="table table-bordered">
				<caption><b>메모수정</b></caption>
				<tr>
					<th width="100" bgcolor="lightgray">작성자</th>
					<td>
						<input type="text" class="form-control" name="uwriter" id="uwriter" 
						style="width: 120px">
					</td>
				</tr>
				
				<tr>
					<th width="100" bgcolor="lightgray">메모</th>
					<td>
						<textarea style="width: 300px; height: 100px;" 
						name="ucontent" id="ucontent" class="form-control"></textarea>
					</td>
				</tr>
				
				<tr>
					<th width="100" bgcolor="lightgray">아바타</th>
					<td>
						<input type="hidden" name="uavata" id="uavata">
						<script>
							var tag="";
							for(var i=1;i<=10;i++)
							{
								tag+="<img src='../avata/"+i+".png' width='50' class='uavata'>";
								
								if(i==5)
									tag+="<br>";
							}
							
							document.write(tag);
						</script>
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center" style="cursor: pointer;" 
					class="dbupdate">
						DB에 수정하기
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<div class="memo list">list</div>
</body>
</html>




















