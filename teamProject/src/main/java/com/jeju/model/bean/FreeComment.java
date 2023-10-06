package com.jeju.model.bean;

public class FreeComment {
	private int cno;
	private String id;
	private int boardno;
	private String category;
	private String content;
	private String regdate;
	
	
	public FreeComment() {}
	
	public FreeComment(int cno, String id, int boardno, String category, String content, String regdate) {
		super();
		this.cno = cno;
		this.id = id;
		this.boardno = boardno;
		this.category = category;
		this.content = content;
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "FreeComment [cno=" + cno + ", id=" + id + ", boardno=" + boardno + ", category=" + category
				+ ", content=" + content + ", regdate=" + regdate + "]";
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
}
