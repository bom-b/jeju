package com.jeju.model.bean;

public class Tour {
	private String tno ;
	private String id ;
	private String tname ;
	private String ttime ;
	private int tphoneno ;
	private String tprice ;
	private String tplace ;
	private String tmap ;
	private String tlikes ;
	private String timage1 ;
	private String timage2 ;
	private String timage3 ;
	private String timage4 ;
	private String timage5 ;
	private String regdate ;
	private String tcategory;
	
	public Tour(String tno, String id, String tname, String ttime, int tphoneno, String tprice, String tplace,
			String tmap, String tlikes, String timage1, String timage2, String timage3, String timage4, String timage5,
			String regdate, String tcategory) {
		super();
		this.tno = tno;
		this.id = id;
		this.tname = tname;
		this.ttime = ttime;
		this.tphoneno = tphoneno;
		this.tprice = tprice;
		this.tplace = tplace;
		this.tmap = tmap;
		this.tlikes = tlikes;
		this.timage1 = timage1;
		this.timage2 = timage2;
		this.timage3 = timage3;
		this.timage4 = timage4;
		this.timage5 = timage5;
		this.regdate = regdate;
		this.tcategory = tcategory;
	}


	@Override
	public String toString() {
		return "Tour [tno=" + tno + ", id=" + id + ", tname=" + tname + ", ttime=" + ttime + ", tphoneno=" + tphoneno
				+ ", tprice=" + tprice + ", tplace=" + tplace + ", tmap=" + tmap + ", tlikes=" + tlikes + ", timage1="
				+ timage1 + ", timage2=" + timage2 + ", timage3=" + timage3 + ", timage4=" + timage4 + ", timage5="
				+ timage5 + ", regdate=" + regdate + ", tcategory=" + tcategory + "]";
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


	public String getTname() {
		return tname;
	}


	public void setTname(String tname) {
		this.tname = tname;
	}


	public String getTtime() {
		return ttime;
	}


	public void setTtime(String ttime) {
		this.ttime = ttime;
	}


	public int getTphoneno() {
		return tphoneno;
	}


	public void setTphoneno(int tphoneno) {
		this.tphoneno = tphoneno;
	}


	public String getTprice() {
		return tprice;
	}


	public void setTprice(String tprice) {
		this.tprice = tprice;
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


	public String getTlikes() {
		return tlikes;
	}


	public void setTlikes(String tlikes) {
		this.tlikes = tlikes;
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


	public String getRegdate() {
		return regdate;
	}


	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}


	public String getTcategory() {
		return tcategory;
	}


	public void setTcategory(String tcategory) {
		this.tcategory = tcategory;
	}


	public Tour() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}
