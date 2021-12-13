package hotelgallery;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;






public class hgalleryDAO {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";

	private Connection getConnection() throws Exception {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/jspbeginner");
		Connection con = ds.getConnection();
		return con;
	}//getConnection()메소드 끝
	
	
	//자원해제() 메소드
	public void freeResource(){
		if(con != null){try {con.close();} catch (Exception e) {e.printStackTrace();}}
		if(rs != null){try {rs.close();} catch (Exception e) {e.printStackTrace();}}
		if(pstmt != null){try {pstmt.close();} catch (Exception e) {e.printStackTrace();}}
	}//freeResource()메소드 끝
	
	
	public int getBoardCount() {
		int count = 0;
		
		try {
			con = getConnection();
			sql = "select count(*) from kji_hgalleryboard";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("count얻기 실패 : "+e);
		}finally {
			freeResource();
		}
		
		return count;
	}//getBoardCount()메소드끝
	
	
	
	public ArrayList<hgalleryDTO> getBoardList() {
		
		ArrayList<hgalleryDTO>  boardList = new ArrayList<hgalleryDTO>();
		
		try {
			con = getConnection();
			sql = "select * from kji_hgalleryboard order by num desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				hgalleryDTO roomsdto = new hgalleryDTO();
				roomsdto.setContent(rs.getString("content"));
				roomsdto.setCount(rs.getInt("count"));
				roomsdto.setFilename(rs.getString("filename"));
				roomsdto.setIp(rs.getString("ip"));
				roomsdto.setName(rs.getString("name"));
				roomsdto.setNum(rs.getInt("num"));
				roomsdto.setRegdate(rs.getTimestamp("regdate"));
				roomsdto.setSubject(rs.getString("subject"));
				roomsdto.setPass(rs.getString("pass"));
				
				boardList.add(roomsdto);
			}
		} catch (Exception e) {
			System.out.println("getBoardList 얻기 실패 : "+e);
		}finally {
			freeResource();
		}
		
		return boardList;
	}//getBoardList 끝
	
	
	public void insertBoard(hgalleryDTO	rdto) {
			int num = 0;
			try {
				con = getConnection();
				
				sql = "select max(num) from kji_hgalleryboard";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					num=rs.getInt(1)+1;
				}else {
					num=1;
				}
				sql = "insert into kji_hgalleryboard (name, subject, content, count, ip, regdate, filename, num)"
					+ " values(?,?,?,?,?,?,?,?)";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, rdto.getName());
				pstmt.setString(2, rdto.getSubject());
				pstmt.setString(3, rdto.getContent());
				pstmt.setInt(4, rdto.getCount());
				pstmt.setString(5, rdto.getIp());
				pstmt.setTimestamp(6, rdto.getRegdate());
				pstmt.setString(7, rdto.getFilename());
				pstmt.setInt(8, num);
				
				pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println("insertBoard()메소드에서 예외 발생" + e);
			} finally {
				freeResource();			
		}
	}//insertBoard()메소드 끝
	
	public hgalleryDTO getBoard(int num){
		
		hgalleryDTO rdto = null;
		
		try {
			
			con = getConnection();
			
			sql = "select * from kji_hgalleryboard where num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);			
			rs = pstmt.executeQuery();  			
			
			if(rs.next()){
			
			rdto = new hgalleryDTO();			
			rdto.setContent(rs.getString("content"));
			rdto.setCount(rs.getInt("count"));
			rdto.setFilename(rs.getString("filename"));
			rdto.setIp(rs.getString("ip"));
			rdto.setName(rs.getString("name"));
			rdto.setNum(rs.getInt("num"));
			rdto.setRegdate(rs.getTimestamp("regdate"));
			rdto.setSubject(rs.getString("subject"));
			}else rdto = new hgalleryDTO();
			
		} catch (Exception e) {
			System.out.println("getBoard 얻기 실패 : "+e);
		} finally {
			freeResource();
		}//finally					
		return rdto; //getBoard 끝
	}//getBoard()메소드 끝
	
	
	public int updateBoard(hgalleryDTO rdto){
		int check = 0;
		
		try {
			con = getConnection();
			
			sql ="update kji_hgalleryboard set subject=?, content=?, filename=? where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, rdto.getSubject());
			pstmt.setString(2, rdto.getContent());
			pstmt.setString(3, rdto.getFilename());
			pstmt.setInt(4, rdto.getNum());
			
			pstmt.executeUpdate();
			
			check = 1;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();				
		}
		return check;	
		
	}//updateBoard()메소드
	
		
	public void deleteBoard(int num){		
		
		try {
			con = getConnection();
			
			sql = "delete from kji_hgalleryboard where num=?";	
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();								
		} catch (Exception e) {
			e.printStackTrace();
		} finally {			
			freeResource();
		}		

	}//deleteBoard()메소드 끝
	
	
	
	
	
	
	
	
}//roomsivitiesDAO 클래스 끝
