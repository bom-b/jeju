package com.jeju.model.bean;

public class Member {
	private String id;
	private String password;
	private String name;
	private String gender;
	private String mquestion; 
	private String manswer;
	private int mphoneno;
	private String mrating;
	private String birth; // 날짜 형식
	private String ratingimg;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getMquestion() {
		return mquestion;
	}
	public void setMquestion(String mquestion) {
		this.mquestion = mquestion;
	}
	public String getManswer() {
		return manswer;
	}
	public void setManswer(String manswer) {
		this.manswer = manswer;
	}
	public int getMphoneno() {
		return mphoneno;
	}
	public void setMphoneno(int mphoneno) {
		this.mphoneno = mphoneno;
	}
	public String getMrating() {
		return mrating;
	}
	public void setMrating(String mrating) {
		this.mrating = mrating;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getRatingimg() {
		return ratingimg;
	}
	public void setRatingimg(String ratingimg) {
		this.ratingimg = ratingimg;
	}
	
	@Override
	public String toString() {
		return "Member [id=" + id + ", password=" + password + ", name=" + name + ", gender=" + gender + ", mquestion="
				+ mquestion + ", manswer=" + manswer + ", mphoneno=" + mphoneno + ", mrating=" + mrating + ", birth="
				+ birth + ", ratingimg=" + ratingimg + "]";
	}
	
	public Member(String id, String password, String name, String gender, String mquestion, String manswer,
			int mphoneno, String mrating, String birth, String ratingimg) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.gender = gender;
		this.mquestion = mquestion;
		this.manswer = manswer;
		this.mphoneno = mphoneno;
		this.mrating = mrating;
		this.birth = birth;
		this.ratingimg = ratingimg;
	}
	public Member() {
		
	}
	
	
	
}