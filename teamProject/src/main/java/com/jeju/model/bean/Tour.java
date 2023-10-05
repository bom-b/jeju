package com.jeju.model.bean;

public class Tour {
	
	private String tno;
	private String id;
	private String tcategory;
	private String ttitle;
	private String ttime;
	private String tbreaktime;
	private String tphoneno;
	private String tmenu;
	private String tplace;
	private String tmap;
	private String timage1;
	private String timage2;
	private String timage3;
	private String timage4;
	private String timage5;
	private int tlikes;
	private String regdate;
	
	public Tour() {
		// TODO Auto-generated constructor stub
	}

	public Tour(String tno, String id, String tcategory, String ttitle, String ttime, String tbreaktime,
			String tphoneno, String tmenu, String tplace, String tmap, String timage1, String timage2, String timage3,
			String timage4, String timage5, int tlikes, String regdate) {
		super();
		this.tno = tno;
		this.id = id;
		this.tcategory = tcategory;
		this.ttitle = ttitle;
		this.ttime = ttime;
		this.tbreaktime = tbreaktime;
		this.tphoneno = tphoneno;
		this.tmenu = tmenu;
		this.tplace = tplace;
		this.tmap = tmap;
		this.timage1 = timage1;
		this.timage2 = timage2;
		this.timage3 = timage3;
		this.timage4 = timage4;
		this.timage5 = timage5;
		this.tlikes = tlikes;
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "Tour [tno=" + tno + ", id=" + id + ", tcategory=" + tcategory + ", ttitle=" + ttitle + ", ttime="
				+ ttime + ", tbreaktime=" + tbreaktime + ", tphoneno=" + tphoneno + ", tmenu=" + tmenu + ", tplace="
				+ tplace + ", tmap=" + tmap + ", timage1=" + timage1 + ", timage2=" + timage2 + ", timage3=" + timage3
				+ ", timage4=" + timage4 + ", timage5=" + timage5 + ", tlikes=" + tlikes + ", regdate=" + regdate + "]";
	}



	public String getTno() {
		return tno;
	}

	public void setTno(String tno) {
		this.tno = tno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTcategory() {
		return tcategory;
	}

	public void setTcategory(String tcategory) {
		this.tcategory = tcategory;
	}

	public String getTtitle() {
		return ttitle;
	}

	public void setTtitle(String ttitle) {
		this.ttitle = ttitle;
	}

	public String getTtime() {
		return ttime;
	}

	public void setTtime(String ttime) {
		this.ttime = ttime;
	}

	public String getTbreaktime() {
		return tbreaktime;
	}

	public void setTbreaktime(String tbreaktime) {
		this.tbreaktime = tbreaktime;
	}

	public String getTphoneno() {
		return tphoneno;
	}

	public void setTphoneno(String tphoneno) {
		this.tphoneno = tphoneno;
	}

	public String getTmenu() {
		return tmenu;
	}

	public void setTmenu(String tmenu) {
		this.tmenu = tmenu;
	}

	public String getTplace() {
		return tplace;
	}

	public void setTplace(String tplace) {
		this.tplace = tplace;
	}

	public String getTmap() {
		return tmap;
	}

	public void setTmap(String tmap) {
		this.tmap = tmap;
	}

	public String getTimage1() {
		return timage1;
	}

	public void setTimage1(String timage1) {
		this.timage1 = timage1;
	}

	public String getTimage2() {
		return timage2;
	}

	public void setTimage2(String timage2) {
		this.timage2 = timage2;
	}

	public String getTimage3() {
		return timage3;
	}

	public void setTimage3(String timage3) {
		this.timage3 = timage3;
	}

	public String getTimage4() {
		return timage4;
	}

	public void setTimage4(String timage4) {
		this.timage4 = timage4;
	}

	public String getTimage5() {
		return timage5;
	}

	public void setTimage5(String timage5) {
		this.timage5 = timage5;
	}

	public int getTlikes() {
		return tlikes;
	}

	public void setTlikes(int tlikes) {
		this.tlikes = tlikes;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
}