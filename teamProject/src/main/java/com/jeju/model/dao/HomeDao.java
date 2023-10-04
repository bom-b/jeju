package com.jeju.model.dao;

import java.sql.Clob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.jeju.model.bean.Event;

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

	
}
