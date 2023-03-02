package mysql.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbConnect {
	
	private static final String MYSQL_DRIVER="com.mysql.cj.jdbc.Driver";
	private static final String MYSQL_URL="jdbc:mysql://localhost:3306/test?serverTimezone=Asia/Seoul";
	private static final String MYSQL_ID="root";
	private static final String MYSQL_PW="1234";
	
	public DbConnect()
	{
		try {
			Class.forName(MYSQL_DRIVER);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("MySQL드라이버 실패:"+e.getMessage());
		}
	}
	
	public Connection getConnection()
	{
		Connection conn=null;
		
		try {
			conn=DriverManager.getConnection(MYSQL_URL, MYSQL_ID, MYSQL_PW);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("MySQL 연결 실패: "+e.getMessage());
		}
		
		return conn;
	}
	
	public void Dbclose(Connection conn,Statement stmt)
	{
			try {
				if(stmt!=null)
					stmt.close();
				if(conn!=null)
					conn.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

	public void Dbclose(Connection conn,PreparedStatement pstmt)
	{
			try {
				if(pstmt!=null)
					pstmt.close();
				if(conn!=null)
					conn.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	public void Dbclose(Connection conn,Statement stmt,ResultSet rs)
	{
			try {
				if(rs!=null)
					rs.close();
				if(stmt!=null)
					stmt.close();
				if(conn!=null)
					conn.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	public void Dbclose(Connection conn,PreparedStatement pstmt,ResultSet rs)
	{
			try {
				if(rs!=null)
					rs.close();
				if(pstmt!=null)
					pstmt.close();
				if(conn!=null)
					conn.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

}
