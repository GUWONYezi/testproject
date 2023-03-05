<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
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
String num=request.getParameter("num");

MemberDao dao=new MemberDao();
MemberDto dto=dao.getData(num);

String[] email=dto.getEmail().split("@");

%>


<script type="text/javascript">

$(function(){
	isIdOk=true;
	
	//id중복체크
	$("#btncheck").click(function(){
		//id읽기
		var id=$("#id").val();
		//alert(id);
		
		$.ajax({
			type:"get",
			url:"member/idserach.jsp",
			dataType:"json",
			data:{"id":id},
			success:function(res)
			{
				console.log(res.count);
				
				if(res.count==1){
					//원래 자신의 아이디라면 상관X
					if(id=="<%=dto.getId()%>")
					{
						$("span.idsuccess").text("아이디 변경 안함");
						isIdOk=true;
					}
					
					else{
						//alert("이미 가입된 아이디입니다\n다시 입력해주세요");
						$("span.idsuccess").text("가입불가");
						$("#id").val('');
						$("#id").focus();
						isIdOk=false;
					}
					
				}else{
					//alert("가입이 가능한 아이디입니다.");
					$("span.idsuccess").text("가입가능");
					isIdOk=true;
				}
			}
		});
		
	});
	
	//id란 바꾸면 중복체크 다시
	$("#id").change(function(){
		$("span.idsuccess").text("");
		isIdOk=false;
	});
	
	
	//이메일
	$("#selEmail").change(function(){
		if($(this).val()=='-'){
			$("#email2").val('');
			$("#email2").attr("readonly",false)
		}else{
			$("#email2").val($(this).val());
			$("#email2").attr("readonly","readonly")
		}
	});
	
	
});

//비밀번호 확인
function passCheck(f)
{
	if(f.pass.value!=f.pass2.value){
		alert("비밀번호가 서로 다릅니다");
		
		f.pass.value="";
		f.pass2.value="";
		
		//form의 action이 호출되지 않는다
		return false;
	}
	
	//아이디 중복체크 안했을 시
	if(isIdOk==false)
	{
		alert("아이디 중복체크를 해주세요");
		$("#id").focus();
		
		return false;
	}
}



</script>

</head>
<body>
	<form action="member/myinfoupdate.jsp" method="post" class="form-inline" 
	onsubmit="return passCheck(this)">
		<input type="hidden" name="num" value=<%=dto.getNum() %>>
		<table class="table table-bordered" style="width: 500px">
			<caption><b>개인정보 수정</b></caption>
			<tr>
				<th width="100" bgcolor="#aaa">아이디</th>
				<td>
					<input type="text" name="id" id="id" class="form-control" 
					required="required" style="width: 120px;" value="<%=dto.getId() %>">
					<button type="button" class="btn btn-danger" id="btncheck">중복체크</button>
					<span class="idsuccess"></span>
				</td>
			</tr>
			
			<tr>
				<th width="100" bgcolor="#aaa">비밀번호</th>
				<td>
					<input type="password" name="pass" class="form-control" 
					required="required" style="width: 120px;" placeholder="비밀번호">
					<input type="password" name="pass2" class="form-control" 
					required="required" style="width: 120px;" placeholder="비밀번호 확인">
				</td>
			</tr>
			
			<tr>
				<th width="100" bgcolor="#aaa">이름</th>
				<td>
					<input type="text" name="name" class="form-control" 
					required="required" style="width: 120px;" 
					value="<%=dto.getName() %>">
				</td>
			</tr>
			
			<tr>
				<th width="100" bgcolor="#aaa">핸드폰</th>
				<td>
					<input type="text" name="hp" class="form-control" 
					required="required" style="width: 200px;" 
					value="<%=dto.getHp() %>">
				</td>
			</tr>
			
			<tr>
				<th width="100" bgcolor="#aaa">주소</th>
				<td>
					<input type="text" name="addr" class="form-control" 
					required="required" style="width: 400px;" 
					value="<%=dto.getAddr() %>">
				</td>
			</tr>
			
			<tr>
				<th width="100" bgcolor="#aaa">이메일</th>
				<td>
					<input type="text" name="email1" class="form-control" 
					required="required" style="width: 120px;" value="<%=email[0] %>">
					<b>@</b>
					<input type="text" name="email2" id="email2" class="form-control" 
					required="required" style="width: 120px;" value="<%=email[1]%>">
					<select id="selEmail" class="form-control">
						<option value="-">직접입력</option>
						<option value="naver.com" 
						<%=email[1].equals("naver.com")?"checked":"" %>>네이버</option>
						<option value="gmail.com" 
						<%=email[1].equals("gmail.com")?"checked":"" %>>구글</option>
						<option value="hanmail.net" 
						<%=email[1].equals("hanmail.net")?"checked":"" %>>다음</option>
						<option value="nate.com" 
						<%=email[1].equals("nate.com")?"checked":"" %>>네이트</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-default" 
					style="width: 100px">수정하기</button>
					<button type="reset" class="btn btn-default" 
					style="width: 100px">초기화</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>













