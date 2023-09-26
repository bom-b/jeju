package com.jeju.model.bean;

public class freeBoard {
		private int ono ; //글번호
		private int no ; //참조하는번호
		private String id ; //작성자 아이디
		private String oname ; // 글 제목
		private String ocontent ; //글 내용
		private int readhit ;	 //조회수 
		private String oregdate;// 날짜 형식
		private String pcategory;// 글 카테고리
		
		private String oimage1 ; //차례대로 자유게시판 이미지 12345
		private String oimage2 ;
		private String oimage3 ;
		private String oimage4 ; 
		private String oimage5 ;
		
		
		
		private int depth ; // 글의 깊이	
		private int groupno ; // 그룹 번호
		private int orderno ; // 순서 번호
		
		private int likes ; // 좋아요
		private int hates ; // 싫어요	
		
		public freeBoard() {
			
		}

	

		public int getNo() {
			return no;
		}



		public void setNo(int no) {
			this.no = no;
		}



		public String getOregdate() {
			return oregdate;
		}



		public void setOregdate(String oregdate) {
			this.oregdate = oregdate;
		}



	




		@Override
		public String toString() {
			return "freeBoard [ono=" + ono + ", no=" + no + ", id=" + id + ", oname=" + oname + ", ocontent=" + ocontent
					+ ", readhit=" + readhit + ", oregdate=" + oregdate + ", pcategory=" + pcategory + ", oimage1="
					+ oimage1 + ", oimage2=" + oimage2 + ", oimage3=" + oimage3 + ", oimage4=" + oimage4 + ", oimage5="
					+ oimage5 + ", depth=" + depth + ", groupno=" + groupno + ", orderno=" + orderno + ", likes="
					+ likes + ", hates=" + hates + "]";
		}



		public int getOno() {
			return ono;
		}



		public void setOno(int ono) {
			this.ono = ono;
		}



		public String getId() {
			return id;
		}



		public void setId(String id) {
			this.id = id;
		}



		public String getOname() {
			return oname;
		}



		public void setOname(String oname) {
			this.oname = oname;
		}



		public String getOcontent() {
			return ocontent;
		}



		public void setOcontent(String ocontent) {
			this.ocontent = ocontent;
		}



		public int getReadhit() {
			return readhit;
		}



		public void setReadhit(int readhit) {
			this.readhit = readhit;
		}



		






		public String getPcategory() {
			return pcategory;
		}



		public void setPcategory(String pcategory) {
			this.pcategory = pcategory;
		}



		public String getOimage1() {
			return oimage1;
		}



		public void setOimage1(String oimage1) {
			this.oimage1 = oimage1;
		}



		public String getOimage2() {
			return oimage2;
		}



		public void setOimage2(String oimage2) {
			this.oimage2 = oimage2;
		}



		public String getOimage3() {
			return oimage3;
		}



		public void setOimage3(String oimage3) {
			this.oimage3 = oimage3;
		}



		public String getOimage4() {
			return oimage4;
		}



		public void setOimage4(String oimage4) {
			this.oimage4 = oimage4;
		}



		public String getOimage5() {
			return oimage5;
		}



		public void setOimage5(String oimage5) {
			this.oimage5 = oimage5;
		}



		public int getDepth() {
			return depth;
		}



		public void setDepth(int depth) {
			this.depth = depth;
		}



		public int getGroupno() {
			return groupno;
		}



		public void setGroupno(int groupno) {
			this.groupno = groupno;
		}



		public int getOrderno() {
			return orderno;
		}



		public void setOrderno(int orderno) {
			this.orderno = orderno;
		}



		public int getLikes() {
			return likes;
		}



		public void setLikes(int likes) {
			this.likes = likes;
		}



		public int getHates() {
			return hates;
		}



		public void setHates(int hates) {
			this.hates = hates;
		}



		public freeBoard(int ono, String id, String oname, String ocontent, int readhit, String oregdate,
				String pcategory, String oimage1, String oimage2, String oimage3, String oimage4, String oimage5) {
			super();
			this.ono = ono;
			this.id = id;
			this.oname = oname;
			this.ocontent = ocontent;
			this.readhit = readhit;
			this.oregdate = oregdate;
			this.pcategory = pcategory;
			this.oimage1 = oimage1;
			this.oimage2 = oimage2;
			this.oimage3 = oimage3;
			this.oimage4 = oimage4;
			this.oimage5 = oimage5;
		}

		
		
		}
		
