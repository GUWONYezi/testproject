<%@page import="java.io.File"%>
<%@page import="data.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%

	//값 받아오기(num, 페이지)
	String num=request.getParameter("num");
	String currentPage=request.getParameter("currentPage");
	
	//dao
	GuestDao dao=new GuestDao();
	
	//file삭제
	//이미지가 있다면 삭제
	String photoname=dao.getData(num).getPhotoname();
	
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
	
	//db삭제
	dao.deleteGuest(num);
	
	//방명록의 원래 있던 페이지로 돌아가기
	response.sendRedirect("../index.jsp?main=guest/guestlist.jsp?currentPage="+currentPage);

%>