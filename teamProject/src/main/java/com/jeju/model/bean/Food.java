package com.jeju.model.bean;

public class Food {
	
	private String no;
	private String id;
	private String category;
	private String title;
	private String time;
	private String breaktime;
	private String phoneno;
	private String menu;
	private String place;
	private String map;
	private String image1;
	private String image2;
	private String image3;
	private String image4;
	private String image5;
	private int likes;
	private String regdate;
	
	public Food() {
		// TODO Auto-generated constructor stub
	}

	public Food(String no, String id, String category, String title, String time, String breaktime, String phoneno,
			String menu, String place, String map, String image1, String image2, String image3, String image4,
			String image5, int likes, String regdate) {
		super();
		this.no = no;
		this.id = id;
		this.category = category;
		this.title = title;
		this.time = time;
		this.breaktime = breaktime;
		this.phoneno = phoneno;
		this.menu = menu;
		this.place = place;
		this.map = map;
		this.image1 = image1;
		this.image2 = image2;
		this.image3 = image3;
		this.image4 = image4;
		this.image5 = image5;
		this.likes = likes;
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "FoodDao [no=" + no + ", id=" + id + ", category=" + category + ", title=" + title + ", time=" + time
				+ ", breaktime=" + breaktime + ", phoneno=" + phoneno + ", menu=" + menu + ", place=" + place + ", map="
				+ map + ", image1=" + image1 + ", image2=" + image2 + ", image3=" + image3 + ", image4=" + image4
				+ ", image5=" + image5 + ", likes=" + likes + ", regdate=" + regdate + "]";
	}

	
	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getBreaktime() {
		return breaktime;
	}

	public void setBreaktime(String breaktime) {
		this.breaktime = breaktime;
	}

	public String getPhoneno() {
		return phoneno;
	}

	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getMap() {
		return map;
	}

	public void setMap(String map) {
		this.map = map;
	}

	public String getImage1() {
		return image1;
	}

	public void setImage1(String image1) {
		this.image1 = image1;
	}

	public String getImage2() {
		return image2;
	}

	public void setImage2(String image2) {
		this.image2 = image2;
	}

	public String getImage3() {
		return image3;
	}

	public void setImage3(String image3) {
		this.image3 = image3;
	}

	public String getImage4() {
		return image4;
	}

	public void setImage4(String image4) {
		this.image4 = image4;
	}

	public String getImage5() {
		return image5;
	}

	public void setImage5(String image5) {
		this.image5 = image5;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
}
