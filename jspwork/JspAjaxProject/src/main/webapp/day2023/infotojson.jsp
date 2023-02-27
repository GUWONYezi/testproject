<%@page import="java.sql.SQLException"%>
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
	
	String sql="select * from info order by num asc";
	
	String s="[";
	
	try{
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		while(rs.next())
		{
			String num=rs.getString("num");
			String name=rs.getString("name");
			String hp=rs.getString("hp");
			String age=rs.getString("age"); //db에서 int형이었어도 String으로 받을 수 있음
			String photo=rs.getString("photo");
			
			s+="{";
			s+="\"num\":"+num+",";
			s+="\"name\":\""+name+"\",";
			s+="\"hp\":\""+hp+"\",";
			s+="\"age\":"+age+",";
			s+="\"photo\":\""+photo+"\"";
			s+="},";
		}
		//마지막 컴마 제거
		s=s.substring(0,s.length()-1); //(a,b) a부터 b-1까지
		
	
	}catch(SQLException e){
	
	}finally{
		db.Dbclose(conn, pstmt, rs);
	}
	
	s+="]";
%>

<%=s %>













