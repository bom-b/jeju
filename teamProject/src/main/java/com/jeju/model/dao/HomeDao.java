package com.jeju.model.dao;

import java.sql.Clob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.jeju.model.bean.Event;
import com.jeju.model.bean.Food;
import com.jeju.model.bean.Member;
import com.jeju.model.bean.Tour;
import com.jeju.model.bean.freeBoard;

public class HomeDao extends SuperDao {

	// 행사 최신순 top3 추출
	public List<Event> selectEvent() throws Exception {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = " SELECT * FROM (SELECT * FROM event ORDER BY regdate) WHERE ROWNUM <= 3 ";
		//String sql = " SELECT * FROM (SELECT * FROM event ORDER BY regdate DESC) WHERE ROWNUM <= 3 ";
		
		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();

		List<Event> eventList = new ArrayList<Event>();
		while (rs.next()) {
			eventList.add(getEventBeanData(rs));
		}
		if (rs != null) {
			rs.close();
		}
		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}
		return eventList;
	}
	
	// 이벤트 bean 한개를 만듭니다.
	private Event getEventBeanData(ResultSet rs) throws Exception {
	    Event bean = new Event();
	    Clob clob = rs.getClob("econtent");

	    bean.setEno(rs.getInt("eno"));
	    bean.setId(rs.getString("id"));
	    bean.setEname(rs.getString("ename"));
	    bean.setEphoneno(rs.getString("ephoneno"));
	    bean.setStartdate(String.valueOf(rs.getDate("startdate")));
	    bean.setEnddate(String.valueOf(rs.getDate("enddate")));

	    // Clob가 null인 경우 빈 문자열로 설정
	    if (clob != null) {
	        bean.setEcontent(clob.getSubString(1, (int) clob.length()));
	    } else {
	        bean.setEcontent(""); // 빈 문자열 또는 원하는 기본값으로 설정
	    }

	    bean.setEplace(rs.getString("eplace"));
	    bean.setEmap(rs.getString("emap"));
	    bean.setEimage1(rs.getString("eimage1"));
	    bean.setEimage2(rs.getString("eimage2"));
	    bean.setEimage3(rs.getString("eimage3"));
	    bean.setEimage4(rs.getString("eimage4"));
	    bean.setEimage5(rs.getString("eimage5"));
	    bean.setRegdate(String.valueOf(rs.getDate("regdate")));
	    return bean;
	}

	// 맛집 추천순 top4 추출
	public List<Food> selectFood() throws Exception {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = " SELECT * FROM (SELECT * FROM foodiespot ORDER BY LIKES DESC) WHERE ROWNUM <= 4 ";
		
		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();

		List<Food> foodtList = new ArrayList<Food>();
		while (rs.next()) {
			foodtList.add(getFoodBeanData(rs));
		}
		if (rs != null) {
			rs.close();
		}
		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}
		return foodtList;
	}

	// ResultSet 정보를 bean으로 만들어서 반환해 줍니다.
	private Food getFoodBeanData(ResultSet rs) throws Exception {
		Food bean = new Food();
		
		bean.setNo(rs.getString("no"));
		bean.setId(rs.getString("id"));
		bean.setCategory(rs.getString("category"));
		bean.setTitle(rs.getString("title"));
		bean.setTime(rs.getString("time"));
		bean.setBreaktime(rs.getString("breaktime"));
		bean.setPhoneno(rs.getString("phoneno"));
		bean.setMenu(rs.getString("menu"));
		bean.setPlace(rs.getString("place"));
		bean.setMap(rs.getString("map"));
		bean.setImage1(rs.getString("image1"));
		bean.setImage2(rs.getString("image2"));
		bean.setImage3(rs.getString("image3"));
		bean.setImage4(rs.getString("image4"));
		bean.setImage5(rs.getString("image5"));
		bean.setLikes(rs.getInt("likes"));
		bean.setRegdate(rs.getString("regdate"));
	
		return bean;
	}

	// 관광지 추천순 top4 추출
	public List<Tour> selectTour() throws Exception {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = " SELECT * FROM (SELECT * FROM tourist ORDER BY TLIKES DESC) WHERE ROWNUM <= 4 ";
		
		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();

		List<Tour> tourtList = new ArrayList<Tour>();
		while (rs.next()) {
			tourtList.add(getTourBeanData(rs));
		}
		if (rs != null) {
			rs.close();
		}
		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}
		return tourtList;
	}
	
	// ResultSet 정보를 Bean으로 만들어서 반환해 줍니다.
	private Tour getTourBeanData(ResultSet rs) throws Exception {
		Tour bean = new Tour() ;
		
		bean.setTno(rs.getString("tno"));		
		bean.setTname(rs.getString("TTITLE"));
		bean.setTlikes(rs.getString("tlikes")); // 좋아요
		bean.setTimage1(rs.getString("timage1"));
		bean.setTcategory(rs.getString("tcategory"));
		
		return bean;
	}

	// 자유 추천순 top5 추출
	public List<freeBoard> selectFree() throws Exception {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = " SELECT * FROM (SELECT * FROM openforum ORDER BY OLIKES DESC) WHERE ROWNUM <= 5 ";
		
		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();

		List<freeBoard> freeList = new ArrayList<freeBoard>();
		while (rs.next()) {
			freeList.add(getFreeBeanData(rs));
		}
		if (rs != null) {
			rs.close();
		}
		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}
		return freeList;
	
	}
	
	// ResultSet 정보를 Bean으로 만들어서 반환해 줍니다.
	private freeBoard getFreeBeanData(ResultSet rs) throws Exception {
		
		freeBoard bean = new freeBoard();

		bean.setOno(rs.getString("ono"));
		bean.setId(rs.getString("id"));
		bean.setOname(rs.getString("oname"));
		bean.setOcontent(rs.getString("ocontent"));
		bean.setPcategory(rs.getString("pcategory"));

		bean.setReadhit(rs.getInt("readhit"));
		bean.setOregdate(rs.getString("oregdate"));

		bean.setOimage1(rs.getString("oimage1"));
		bean.setOimage2(rs.getString("oimage2"));
		bean.setOimage3(rs.getString("oimage3"));
		bean.setOimage4(rs.getString("oimage4"));
		bean.setOimage5(rs.getString("oimage5"));

		bean.setDepth(rs.getInt("depth"));
		bean.setGroupno(rs.getInt("groupno"));
		bean.setOrderno(rs.getInt("orderno"));

		bean.setLikes(rs.getInt("likes")); // 좋아요
		bean.setOlikes(rs.getInt("olikes")); // 좋아요

		return bean;
	}

	// 멤버 포인트순 top10 추출
	// 포인트가 같을 시 아이디순으로 비교, 랭크 컬럼 추가
	public List<Member> selectMember() throws Exception {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = " SELECT RANK() OVER (ORDER BY MRATING DESC, ID) AS rank, M.* "
				+ " FROM members M "
				+ " WHERE ROWNUM <= 10 "
				+ " ORDER BY MRATING DESC, ID ";
		
		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();

		List<Member> memberList = new ArrayList<Member>();
		while (rs.next()) {
			memberList.add(getMemberBeanData(rs));
		}
		if (rs != null) {
			rs.close();
		}
		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}
		return memberList;
	
	}

	// ResultSet의 데이터를 읽어서 Bean에 기록한 다음, 반환해 줍니다.
	private Member getMemberBeanData(ResultSet rs) throws Exception {
		
		Member bean = new Member()  ;
		
		bean.setId(rs.getString("id"));
		bean.setPassword(rs.getString("password"));
		bean.setName(rs.getString("name"));
		bean.setGender(rs.getString("gender"));
		bean.setMquestion(rs.getString("mquestion"));
		bean.setManswer(rs.getString("manswer"));
		bean.setMphoneno(rs.getInt("mphoneno"));
		bean.setMrating(rs.getString("mrating"));
		bean.setBirth(String.valueOf(rs.getDate("birth")));
		bean.setRatingimg(rs.getString("ratingimg"));
		
		// 랭크
		bean.setRank(rs.getInt("rank"));
		
		
		return bean;
	}
}
