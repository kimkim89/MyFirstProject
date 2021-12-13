package questionboard;

import java.sql.Timestamp;

public class BoardVO {

	//변수 선언
	private int num;
	private String writerID;
	private String pass;
	private String subject;
	private String content;
	private Timestamp date;
	
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getwriterID() {
		return writerID;
	}
	public void setwriterID(String writerID) {
		this.writerID = writerID;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}	
	
	
	public BoardVO(String writerID, String pass, String subject, String content) {
		super();
		this.writerID = writerID;
		this.pass = pass;
		this.subject = subject;
		this.content = content;
	}

	public BoardVO() { }
	
	

	
	
	
	
	
}


