<%@page import="data.dto.GuestDto"%>
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

<%
//값 읽어오기
String num=request.getParameter("num");
String currentPage=request.getParameter("currentPage");

//dao
GuestDao dao=new GuestDao();

//dto
GuestDto dto=dao.getData(num);

//내용,사진
String content=dto.getContent();
String photoname=dto.getPhotoname();

System.out.println(currentPage);

%>

<script type="text/javascript">

$(function(){
	$("span.camera").click(function(){
		$("#photo").trigger("click"); //이벤트 강제 호출
	});
	
	//만약 사진이 있다면, 미리보기 띄워놓기
	if(photo!=null)
	{
		$('#showimg').attr('src',"save/<%=photoname%>");
	}
	
	
});

function readURL(input) {
    if(input.files && input.files[0]) {
        var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
        reader.onload = function (e) {
        	//파일 읽어들이기를 성공했을 때 호출되는 이벤트 핸들러
            $('#showimg').attr('src', e.target.result);
        	//이미지 Tag의 src속성에 읽어들인 File내용을 지정
        	//(아래 코드에서 읽어들인 dataURL형식)
        }
        reader.readAsDataURL(input.files[0]);
        //File내용을 읽어 dataURL형식의 문자열로 저장
    }
}
</script>

</head>
<body>
	<!-- 이미지 미리보기할 위치 -->
	<div>
		<img id="showimg" style="position: absolute; left: 800px; top: 100px; max-width: 200px;">
		
		<form action="guest/update.jsp" method="post" enctype="multipart/form-data">
			<input type="hidden" value=<%=num %> name="num">
			<input type="hidden" value=<%=currentPage %> name="currentPage">
			<table style="width: 600px">
				<caption>
					<b>방명록 수정</b>
					<span class="glyphicon glyphicon-camera camera"></span>
					<input type="file" name="photo" id="photo" style="visibility: hidden"
					 onchange="readURL(this)">
				</caption>
				
				<tr height="100">
					<td width="500">
						<textarea style="width: 480px; height: 100px;" 
						class="form-control" name="content" required="required"><%=content%></textarea>
					</td>
					<td>
						<button type="submit" class="btn btn-default" 
						style="width: 100px; height: 100px;">수정</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>