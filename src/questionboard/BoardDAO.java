package questionboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class BoardDAO {
	// 전역변수 선언
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String sql;

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
			sql = "select * from kji_questionboard";
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
				BoardVO vo = new BoardVO();
				vo.setContent(rs.getString("content"));
				vo.setDate(rs.getTimestamp("date"));
				vo.setNum(rs.getInt("num"));
				vo.setSubject(rs.getString("subject"));
				vo.setwriterID(rs.getString("writerID"));
							
				v.add(vo);
			}//while문 끝
		
		} catch (Exception e) {
			System.out.println("getBoardList()메소드 내부에서 오류: " + e);
		
		} finally {
			freeResource();
		
		}
		return v;
	}//getBoardList()메소드 끝
	
	
		
	//게시판 board테이블에 새 글 정보를 추가시키는 메소드
	public void insertBoard(BoardVO vo) {
		
		sql = "";
		int num = 0;
		
		try {
			conn = getConnection(); //DB연결
			sql = "select max(num) from kji_questionboard;"; 
			pstmt = conn.prepareStatement(sql); 
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt("max(num)") + 1;  
			}else {				
				num = 1; 
			}
							
			sql = "insert into kji_questionboard(num, writerID, pass, "
									+ "subject, content, date)"
									+ "values (?, ?, ?, ?, ?, now())";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num); 
			pstmt.setString(2, vo.getwriterID());
			pstmt.setString(3, vo.getPass());
			pstmt.setString(4, vo.getSubject());
			pstmt.setString(5, vo.getContent());
			
				
			pstmt.executeUpdate();//insert실행
						
		} catch (Exception e) {
			System.out.println("insertBoard()메소드 내부에서 예외발생: " + e.getMessage());
		} finally {
			freeResource();
		}
	
	}//insertBoard()메소드 끝
	
	

	//board테이블에 저장되어 있는 전체 글 수를 검색해서 반환하는 메소드
	public int getBoardCount() {
		
		int count = 0; //검색한 전체 글 수를 저장할 용도
		
		try {
			//DB연결
			conn = getConnection();
			
			//SQL문 : 전체 글 개수 검색
			sql = "select count(*) from kji_questionboard"; //전체 개수 = count(*)함수 
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(); //select문 실행
			
			if(rs.next()) {
				count = rs.getInt(1); //검색한 전체 글 개수 얻기
			}
		
		} catch (Exception e) {
			System.out.println("getBoardCount()메소드에서 예외발생: " + e);
		
		} finally {
			freeResource();
		}
		return count; //검색한 전체 글 수 notice.jsp로 반환 
		
		
	} //getBoardCount()메소드 끝	
	
	
	public BoardVO getBoard(int num) {
		
		//매개변수로 전달받은 글번호에 해당하는 글을 검색해서 저장할 BoardVO객체 생성
		BoardVO vo = new BoardVO();
		
		try {
			//커넥션풀로부터 커넥션 얻기(DB접속)
			conn = getConnection();
					
			//-------------필요한 값을 가지고 와서 저장시키고 Read.jsp로 보내려고 만든 구문 시작!-------------
			//매개변수로 전달 받은 글번호에 해당되는, 글 하나의 정보를 검색하는 Select구문 만들기
			sql = "select * from kji_questionboard where num=?;";
			
			// ?기호에 해당되는 값을 제외한 나머지 Select문장을 저장한 PreparedStatement실행 객체 얻어오기
			pstmt = conn.prepareStatement(sql);
			
			// ?기호에 해당되는 글번호를 설정
			pstmt.setInt(1, num);	
			
			//Select구문 실행한 후 검색된 글 하나의 정보를 ResultSet에 저장후 반환 받기
			rs = pstmt.executeQuery();
			
			//ResultSet이라는 임시저장소에 검색한 데이터(글 하나의 정보)가 존재한다면?
			if(rs.next()) {
				
				//ResultSet에서 검색한 글의 정보들을 꺼내와서 BoardVO개체의 각 변수에 저장
				vo.setNum(rs.getInt("num"));
				vo.setwriterID(rs.getString("writerID"));
				vo.setPass(rs.getString("pass"));
				vo.setSubject(rs.getString("subject"));
				vo.setContent(rs.getString("content"));
				vo.setDate(rs.getTimestamp("date"));		
								
			}
			
			
		} catch (Exception e) {
			
			System.out.println("getBoard메소드 내부에서 오류: " + e);
			
		} finally {
			//자원해제
			freeResource();
		}
		
		return vo;	//DB로부터 검색한 하나의 글정보를 BoardVO객체에 저장한 후, Read.jsp로 반환
		
	}//getBoard메소드
	
	
	
	public BoardVO getBoardInfo(int num) {
		
		BoardVO vo = new BoardVO();
		
		try {
			
			conn = getConnection();

			String sql = "select * from kji_questionboard where num=?;";
			
		
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);	
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setNum(rs.getInt("num"));
				vo.setwriterID(rs.getString("writerID"));
				vo.setSubject(rs.getString("subject"));
				vo.setContent(rs.getString("content"));
				vo.setPass(rs.getString("pass"));
				vo.setDate(rs.getTimestamp("date"));
								
			}
			
		} catch (Exception e) {
			
			System.out.println("getBoard메소드 내부에서 오류: " + e);
			
		} finally {
			freeResource();
		}
		
		return vo;
		
		
	}//getBoardInfo(int num)메소드	
	
	
	public int updateBoard1(BoardVO vo) {
		
		int result = 0; //메소드 내부에서 사용할 것이기 때문에 값 초기화 시켜줘야함! 
		
		
			try {
				//커넥션풀로부터 커넥션객체 얻기(DB연결객체얻기) 
				conn = getConnection();
				
				String sql = "update kji_questionboard set subject=?, content=? " + "where num=?";
				
				//Update를 실행할 객체 얻기
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, vo.getSubject());
				pstmt.setString(2, vo.getContent());
				pstmt.setInt(3, vo.getNum());
				
				result = pstmt.executeUpdate(); 
				
			} catch (Exception e) {
				
				System.out.println("updateBoard1메소드에서 오류: " + e);
				
			} finally {
				freeResource();
				
			}
		
		return result;	
	}//updateBoard1()메소드 끝
	
	
	public void deleteBoard(int num) {
		
		try {
	
			conn = getConnection();
			
			pstmt = conn.prepareStatement("delete from kji_questionboard where num=?");
			
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate(); 
		
		} catch (Exception e) {
			System.out.println("deleteBoard메소드에서 오류 : " + e);
			
		} finally {
			freeResource();
		}
		
		
	}//deleteBoard() 끝
	
}//BoardDAO클래스 끝
