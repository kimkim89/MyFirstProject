package member;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
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
	}
	

	// insertMember()메소드
	public int insertMember(MemberDTO mdto) {
			int check = 0;
			
		try {
			con = getConnection();

			sql = "insert into kji_member(id, passwd, name, email, zipcode, address1, address2, phone, reg_date)"
					+ "values(?, ?, ?, ?, ?, ?, ?, ?, now())";

			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, mdto.getId());
			pstmt.setString(2, mdto.getPasswd());
			pstmt.setString(3, mdto.getName());
			pstmt.setString(4, mdto.getEmail());
			pstmt.setString(5, mdto.getZipcode());
			pstmt.setString(6, mdto.getAddress1());
			pstmt.setString(7, mdto.getAddress2());
			pstmt.setString(8, mdto.getPhone());
			

			check = pstmt.executeUpdate(); // Insert실행

		} catch (Exception e) {
			System.out.println("insertMember()메소드 내부에서 예외 발생 : " + e.toString());
			e.printStackTrace();

		} finally {
			freeResource();
		} // finally
		return check;

	}// insertMember메소드 끝
	
	
	// userCheck()=> 아이디/비밀번호 확인 메소드 
	public int userCheck(String id, String passwd){
		
		int check = -1;   
	
		try {
			con = getConnection();
			sql = "select * from kji_member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if(rs.next()){ 
				if(passwd.equals(rs.getString("passwd"))){
					check=1;
				}else{ //비번틀림
					check=0; 
				}
			}else{ //rs.next()값이 없을 때
				check = -1;  
			}
			
		} catch (Exception e) {
			System.out.println("userCheck 얻기 실패 : "+e);
		} finally {
			freeResource();
		}
					
		return check;
	}//userCheck()메소드 끝
	
	
	// idCheck()메소드 => 아이디 중복체크 메소드
	public int idCheck(String id) {

		int check = 0;

		try {
			con = getConnection();

			sql = "select * from kji_member where id=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				check = 1;
			} else {
				check = 0;
			}
		} catch (Exception e) {
			System.out.println("idCheck 실패 : " + e);
		} finally {
			freeResource();
		}

		return check;
	}//idCheck()메소드 끝
	
	//id값으로 회원정보 가져오는 메소드
	public MemberDTO getMember(String id){

		MemberDTO mdto = null;
		
		try {
			con = getConnection();

			sql = "select * from kji_member where id=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);			
			rs = pstmt.executeQuery();  			
			rs.next();
			
			
			mdto = new MemberDTO();			
			
			mdto.setId(rs.getString("id"));
			mdto.setPasswd(rs.getString("passwd"));
			mdto.setName(rs.getString("name"));
			mdto.setEmail(rs.getString("email"));
			mdto.setZipcode(rs.getString("zipcode"));
			mdto.setAddress1(rs.getString("address1"));
			mdto.setAddress2(rs.getString("address2"));
			mdto.setPhone(rs.getString("phone"));
			mdto.setReg_date(rs.getTimestamp("reg_date"));
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		}//finally					
		return mdto; 
	}//getMember 메소드 끝
	
	
	//회원 정보수정 메소드
	public int updateMember(MemberDTO mdto){
		int check = 0;
		
		try {
			con = getConnection();
			
				sql ="update kji_member set passwd=?, name=?, email=?, zipcode=?, address1=?, address2=?, phone=? where id=?";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, mdto.getPasswd());
				pstmt.setString(2, mdto.getName());
				pstmt.setString(3, mdto.getEmail());
				pstmt.setString(4, mdto.getZipcode());
				pstmt.setString(5, mdto.getAddress1());
				pstmt.setString(6, mdto.getAddress2());
				pstmt.setString(7, mdto.getPhone());
				pstmt.setString(8, mdto.getId());
				
				//UPDATE
				check = pstmt.executeUpdate();
				
		} catch (Exception e) {
			System.out.println("updateMember()메소드 실패 : "+e);
	
		}finally {
			freeResource();		
		}	
		return check;
	} //updateMember() 끝
	
	
	// 아이디값으로 비밀번호 가져오는 메소드
	public int getPass(String id,String pass) {
		int check = 0;
		try {
			con = getConnection();
			sql = "select passwd from kji_member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if(pass.equals(rs.getString("passwd"))){
					check = 1;
				}
			}
			
		} catch (Exception e) {
			System.out.println("비밀번호 얻기 실패 :"+e);
		}finally {
			freeResource();
		}
		
		return check;
		
	} //getPass()메소드 끝
	
	
	// 회원 삭제 메소드
	public void deleteMember(String id) {
		try {
			con = getConnection();
			
			sql="delete from kji_member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("deleteMember_회원탈퇴 실패 오류" + e);
		}finally {
			freeResource();
		}
	}//deleteMember()메소드 끝
	
	
	// 본인인증 메소드(ID, E-mail 필요) 
	public int confirm(String name, String email) {
		
		int check = 0;
		
		try {
			con = getConnection();
			
			sql = "select * from kji_member where name=? and email=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				check = 1;
			}
			
		} catch (Exception e) {
			System.out.println("insert 실패 : "+e);
		}finally {
			freeResource();
		}		
		return check;
		
	}//confirm()메소드 끝

	
	// ID찾기 메소드
	public String getID(String name, String email) {
		
		String id="";
		
		try {
			con = getConnection();
			
			sql = "select id from kji_member where name=? and email=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			id=rs.getString(1);
			
		} catch (Exception e) {
			System.out.println("insert 실패 : "+e);
		}finally {
			freeResource();
		}		
		return id;
		
	}//getID()메소드 
	
	
	//비밀번호 찾기
	public int getPasswd(String id,String passwd) {
		int check = 0;
		try {
			con = getConnection();
			sql = "select passwd from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if(passwd.equals(rs.getString("passwd"))){
					check = 1;
				}
			}
			
		} catch (Exception e) {
			System.out.println("비밀번호 얻기 실패 :"+e);
		}finally {
			freeResource();
		}
		return check;
	}//getPasswd()메소드 끝
	

	
}
