package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.dto.GuestDto;
import data.dto.MemberDto;
import mysql.db.DbConnect;

public class GuestDao {
	DbConnect db=new DbConnect();
	
	//insert
	public void insertGuest(GuestDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into guest (myid,content,photoname,writeday) values(?,?,?,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getMyid());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getPhotoname());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.Dbclose(conn, pstmt);
		}
	}
	
	//페이징처리_#1_totalCount
	//전체개수
	public int getTotalCount()
	{
		int n=0;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select count(*) from guest";
		
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
		
		
	//페이징처리_#2_List(start,perpage)
	//페이지에서 필요한 만큼만 리턴
	public List<GuestDto> getList(int start,int perPage)
	{
		List<GuestDto> list=new Vector<>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from guest order by num desc limit ?,?";
		// limit = 제한을 주는 것 ex) limit 0,5 -> 0~4까지의 데이터만을 가져온다
		
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setInt(1, start);
			pstmt.setInt(2, perPage);
				
			rs=pstmt.executeQuery();
				
			while(rs.next())
			{
				GuestDto dto=new GuestDto();
			
				dto.setNum(rs.getString("num"));
				dto.setMyid(rs.getString("myid"));
				dto.setContent(rs.getString("content"));
				dto.setPhotoname(rs.getString("photoname"));
				dto.setChu(rs.getInt("chu"));
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
	
	
	//삭제
	public void deleteGuest(String num)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from guest where num=?";
		
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
	
	
	//num값에 해당하는 데이터 가져오기
	public GuestDto getData(String num)
	{
		GuestDto dto=new GuestDto();
			
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
			
		String sql="select * from guest where num=?";
			
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
				
			if(rs.next())
			{
				dto.setNum(rs.getString("num"));
				dto.setMyid(rs.getString("myid"));
				dto.setContent(rs.getString("content"));
				dto.setPhotoname(rs.getString("photoname"));
				dto.setChu(rs.getInt("chu"));
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
	
}












