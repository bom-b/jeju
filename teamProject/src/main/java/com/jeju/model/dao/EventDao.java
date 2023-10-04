package com.jeju.model.dao;

import java.sql.Clob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.jeju.model.bean.Event;

public class EventDao extends SuperDao {

	public List<Event> selectEventAll(String dayConfirm) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		if (dayConfirm.equals("allDate")) {
			sql = "select * from event order by eno";
		} else if (dayConfirm.equals("presentDate")) {
			sql = "select * from event where sysdate between startdate and enddate order by eno";
		} else if (dayConfirm.equals("passDate")) {
			sql = "select * from event where enddate < sysdate ";
		}
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

	private Event getEventBeanData(ResultSet rs) throws Exception {
		Event bean = new Event();
		Clob clob = rs.getClob("econtent");

		bean.setEno(rs.getInt("eno"));
		bean.setId(rs.getString("id"));
		bean.setEname(rs.getString("ename"));
		bean.setEphoneno(rs.getString("ephoneno"));
		bean.setStartdate(String.valueOf(rs.getDate("startdate")));
		bean.setEnddate(String.valueOf(rs.getDate("enddate")));
		bean.setEcontent(clob.getSubString(1, (int) clob.length()));
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

	public Event GetDataByPk(Integer eno) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from event where eno=? ";

		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, eno);

		rs = pstmt.executeQuery();
		Event bean = null;

		if (rs.next()) {
			bean = this.getEventBeanData(rs);
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

		return bean;
	}

	public List<Event> selectSearch(String searchType) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		String ename = "select ename from event";

		if (searchType.equals("subject")) {
			sql = "select * from event where ename like '%?%'";
			pstmt.setString(1, ename);
		}
		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);

		return null;
	}

	public int insertData(Event bean, String confirmDate) throws Exception {
		confirmDate = "allDate";
		
		PreparedStatement pstmt = null;
		int cnt = -1;
		String sql = "INSERT INTO EVENT (ENO,ID,ENAME, STARTDATE, ENDDATE, ECONTENT, EPHONENO, EPLACE, EIMAGE1, EIMAGE2, EIMAGE3, EIMAGE4, EIMAGE5, REGDATE) ";
		sql += " VALUES(SEQEVENT.nextval,'admin',?,?,?,?,?,?,?,?,?,?,?,sysdate)";
		conn = super.getConnection();
		conn.setAutoCommit(false);

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bean.getEname());
		pstmt.setString(2, bean.getStartdate());
		pstmt.setString(3, bean.getEnddate());
		pstmt.setString(4, (String) bean.getEcontent());
		pstmt.setString(5, bean.getEphoneno());
		pstmt.setString(6, bean.getEplace());
		pstmt.setString(7, bean.getEimage1());
		pstmt.setString(8, bean.getEimage2());
		pstmt.setString(9, bean.getEimage3());
		pstmt.setString(10, bean.getEimage4());
		pstmt.setString(11, bean.getEimage5());
		cnt = pstmt.executeUpdate();
		conn.commit();

		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}
		return cnt;
	}
}
