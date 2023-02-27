<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="mysql.db.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	DbConnect db=new DbConnect();
	Connection conn=db.getConnection();
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	String sql="select * from student order by num asc";
	
	String s="[";
	
	try{
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		while(rs.next())
		{
			String num=rs.getString("num");
			String stuname=rs.getString("stuname");
			String photo=rs.getString("photo");
			String java=rs.getString("java");
			String ajax=rs.getString("ajax");
			
			s+="{";
			s+="\"num\":"+num+",";
			s+="\"stuname\":\""+stuname+"\",";
			s+="\"photo\":\""+photo+"\",";
			s+="\"java\":"+java+",";
			s+="\"ajax\":"+ajax;
			s+="},";
		}
		
		s=s.substring(0,s.length()-1);
		
	}catch(Exception e){
		
	}finally{
		db.Dbclose(conn, pstmt, rs);
	}

	s+="]";
%>

<%=s %>