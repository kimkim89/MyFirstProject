package noticeboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import questionboard.BoardVO;



public class NoticeBoardDAO {
	// 전역변수 선언
	private Connection conn=null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";

	// 자원해제 메소드
	private void freeResource() {

		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			System.out.println("freeResource()메소드 예외 발생: " + e);
		}
	}// freeResource()메소드 끝

	// 커넥션풀(DataSource)을 얻은 후 Connection DB 접속하는 메소드
	private Connection getConnection() throws Exception {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/jspbeginner");
		Connection con = ds.getConnection();
		return con;

	}// getConnection()메소드 끝

	// 작성글 총 개수 출력 메소드
	public int totalNum() {

		int total = 0;

		try {
			conn = getConnection();
			sql = "select * from kji_noticeboard";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				total++;
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			freeResource();

		} // finally 구문 끝
		return total;

	}// totalNum()메소드 끝

	
	// DB 테이블에 저장되어 있는 글 검색해서 가져오는 메소드
	public Vector getBoardList(String keyField, String keyWord) {
		Vector v = new Vector();
		
		try {
			conn=getConnection();
			if(keyWord == null || keyField.isEmpty()) {
				sql = "select * from kji_questionboard order by num desc";
			
			}else {
				sql = "select * from kji_questionboard where " + keyField + " like '%" + keyWord + "%' order by num desc";
			}
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				NoticeBoardDTO vo = new NoticeBoardDTO();
				vo.setContent(rs.getString("content"));
				vo.setDate(rs.getTimestamp("date"));
				vo.setNum(rs.getInt("num"));
				vo.setSubject(rs.getString("subject"));
				vo.setWriterID(rs.getString("writerID"));
				vo.setFile(rs.getString("file"));
							
				v.add(vo);
			}//while문 끝
		
		} catch (Exception e) {
			System.out.println("getBoardList()메소드 내부에서 오류: " + e);
		
		} finally {
			freeResource();
		
		}
		return v;
	}//getBoardList()메소드 끝
	
}//BoardDAO클래스 끝
