package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import org.apache.tomcat.jni.OS;

import data.dto.AnswerDto;
import data.dto.GuestDto;
import data.dto.SmartDto;
import mysql.db.DbConnect;

public class SmartDao {
	DbConnect db=new DbConnect();
	
	//insert
	public void insertSmart(SmartDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into smartboard (writer,subject,content,writeday) values(?,?,?,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.Dbclose(conn, pstmt);
		}
	}
	
	//전체 데이터
	public List<SmartDto> getAllDatas()
	{
		List<SmartDto> list=new Vector<>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from smartboard order by num desc";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				SmartDto dto=new SmartDto();
				
				dto.setNum(rs.getString("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.Dbclose(conn, pstmt, rs);
		}
		
		return list;		
	}
	
	//페이징처리 list
	//해당 페이지의 데이터값만 가져오기(limit)
	public List<SmartDto> getList(int start,int perPage)
	{
		List<SmartDto> list=new Vector<>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from smartboard order by num desc limit ?,?";
		// limit = 제한을 주는 것 ex) limit 0,5 -> 0~4까지의 데이터만을 가져온다
		
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setInt(1, start);
			pstmt.setInt(2, perPage);
				
			rs=pstmt.executeQuery();
				
			while(rs.next())
			{
				SmartDto dto=new SmartDto();
			
				dto.setNum(rs.getString("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setWriteday(rs.getTimestamp("writeday"));
					
				//리스트에 추가
				list.add(dto);
			}
		
		} catch (SQLException e) {
		// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.Dbclose(conn, pstmt, rs);
		}
		
		return list;
	}
	
	//전체개수
	public int getTotalCount()
	{
		int n=0;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select count(*) from smartboard";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next())
				n=rs.getInt(1);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.Dbclose(conn, pstmt, rs);
		}
		
		return n;
	}
	
	//num에 대한 하나의 dto
	public SmartDto getData(String num)
	{
		SmartDto dto=new SmartDto();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from smartboard where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				dto.setNum(rs.getString("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setWriteday(rs.getTimestamp("writeday"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.Dbclose(conn, pstmt, rs);
		}
		
		return dto;
	}
	
	//추천수 증가
	public void updateReadCount(String num)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update smartboard set readcount=readcount+1 where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, num);
			
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.Dbclose(conn, pstmt);
		}
	}
	
	//maxnum구하기(가장 최근에 추가된 글의 num값을 얻기)
	public int getMaxNum()
	{
		int max=0;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select max(num) max from smartboard";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				max=rs.getInt("max");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.Dbclose(conn, pstmt, rs);
		}
		
		return max;
	}
	
	//수정
	public void updateSmart(SmartDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update smartboard set writer=?,subject=?,content=? where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getNum());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.Dbclose(conn, pstmt);
		}
		
	}
	
	
	//삭제
	public void deleteSmart(String num)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from smartboard where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, num);
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.Dbclose(conn, pstmt);
		}
		
	}
	
	
	
	
	
	
	
	

}
