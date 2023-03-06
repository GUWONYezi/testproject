<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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

</head>
<body>
<%

request.setCharacterEncoding("utf-8");

//////

//이미지가 업로드되는 실제경로
String realPath=getServletContext().getRealPath("/save");
//System.out.println(realPath);
	
int uploadSize=1024*1024*2;

MultipartRequest multi=null;

try{
	multi=new MultipartRequest(request,realPath,uploadSize,"utf-8", 
		new DefaultFileRenamePolicy());
	
	//multi변수로 모든 폼데이터 읽어오기
	String num=multi.getParameter("num");
	String currentPage=multi.getParameter("currentPage"); //넘길 페이지 번호
	
	//System.out.println(currentPage);
	
	String content=multi.getParameter("content");
	String photoname=multi.getFilesystemName("photo");
	
	String noimg=multi.getParameter("noimg");
	
	//dao
	GuestDao dao=new GuestDao();
	
	//사진은 수정하지 않았다면(사진 유지)
	if(photoname==null || photoname.equals(""))
	{
		//원래 photo값으로 대체
		GuestDto photoDto=dao.getData(num);
		photoname=photoDto.getPhotoname();
		
	}
	
	//만약 사진을 삭제했다면
	if(noimg.equals("true"))
	{	
		GuestDto photoDto=dao.getData(num);
		photoname=photoDto.getPhotoname();
		
		//file삭제
		if(photoname!=null)
		{
			//업로드 경로 구하기
			String uploadPath=getServletContext().getRealPath("/save");
			//파일 생성
			File file=new File(uploadPath+"\\"+photoname);
			
			//만약 파일이 존재한다면 파일 삭제
			if(file.exists()){
				file.delete();
			}
		}
		
		photoname=null;
	}

	//dto
	GuestDto dto=new GuestDto();

	//dto 값 넣기(수정할 값)
	dto.setNum(num);
	dto.setContent(content);
	dto.setPhotoname(photoname);

	//수정
	dao.updateGuest(dto);
	
	//방명록 목록으로 이동
	response.sendRedirect("../index.jsp?main=guest/guestlist.jsp?currentPage="+currentPage);
	
	
}catch(Exception e){
	System.out.println("수정 오류"+e.getMessage());
}


%>

</body>
</html>