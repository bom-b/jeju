package com.jeju.model.dao;

import java.sql.Clob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.jeju.model.bean.Event;
import com.jeju.utility.Paging;

public class EventDao extends SuperDao {

	public List<Event> selectEventAll(String evSection, Paging pageInfo) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

		sql = "select * from (select row_number() over (order by A.eno) as rnum , A.* from (select * from event where 1=1 ";

		if (evSection.equals("진행중")) {
			sql += " and sysdate between startdate and enddate";

		} else if (evSection.equals("종료")) {
			sql += " and  enddate<sysdate";
		} else if (evSection.equals("예정중")) {
			sql += " and  startdate>sysdate";
		} else if (evSection.equals("전체")) {
			
		}

		String mode = pageInfo.getMode();
		String keyword = pageInfo.getKeyword();

		if (mode == null || mode.equals("all")) {
		} else { // 전체 모드가 아니면
			sql += " and " + mode + " like '%" + keyword + "%'";
		}

		sql += ") A) where rnum between ? and ? order by startdate";

		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pageInfo.getBeginRow());
		pstmt.setInt(2, pageInfo.getEndRow());
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
		/* bean.setEcontent(ConvertClob.set(rs.getClob("econtent"))); */

		bean.setEplace(rs.getString("eplace"));
		bean.setEmap(rs.getString("emap"));
		bean.setEimage1(rs.getString("eimage1"));
		bean.setEimage2(rs.getString("eimage2"));
		bean.setEimage3(rs.getString("eimage3"));
		bean.setEimage4(rs.getString("eimage4"));
		bean.setEimage5(rs.getString("eimage5"));
		bean.setRegdate(String.valueOf(rs.getDate("regdate")));
		bean.setEvsection(rs.getString("evsection"));

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

	public int insertData(Event bean) throws Exception {
		PreparedStatement pstmt = null;
		int cnt = -1;
		String sql = "INSERT INTO EVENT (ENO,ID,ENAME, STARTDATE, ENDDATE, ECONTENT, EPHONENO, EPLACE, EIMAGE1, EIMAGE2, EIMAGE3, EIMAGE4, EIMAGE5, REGDATE,EVSECTION) ";
		sql += " VALUES(SEQEVENT.nextval,'admin',?,?,?,?,?,?,?,?,?,?,?,sysdate,?)";
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
		pstmt.setString(12, bean.getEvsection());
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

	public int GetTotalRecordCount(String mode, String keyword) throws Exception {
		String sql = "select count(*)as cnt from event";
		if (mode == null || mode.equals("all")) {

		} else {
			sql += " where " + mode + " like'%" + keyword + "%'";
		}
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);

		rs = pstmt.executeQuery();

		int cnt = -1;
		if (rs.next()) {
			cnt = rs.getInt("cnt");
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
		return cnt;
	}

	public List<Event> selectEventGetAll(Paging pageInfo) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

		sql = "select * from (select row_number() over (order by A.eno) as rnum , A.* from (select * from event where 1=1 ";

		String mode = pageInfo.getMode();
		String keyword = pageInfo.getKeyword();

		if (mode == null || mode.equals("all")) {
		} else { // 전체 모드가 아니면
			sql += " and " + mode + " like '%" + keyword + "%'";
		}
		sql += ") A) where rnum between ? and ? order by startdate";

		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pageInfo.getBeginRow());
		pstmt.setInt(2, pageInfo.getEndRow());
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

	public int GetTotalRecordCountGubun(String mode, String keyword, String evSection) throws Exception {
		String sql = "";
		sql = "select count(*) as cnt from (select row_number() over(order by e1.eno) as rnum, e1.* from";

		if (evSection.equals("진행중")) {
			sql += " (select * from event where sysdate between startdate and enddate order by ename)e1)e";// 검색없을 //
																											// 떄..

		} else if (evSection.equals("종료")) {
			sql += " (select * from event where enddate<sysdate order by ename)e1)e";// 검색없을 // 떄..

		} else if (evSection.equals("예정중")) {
			sql += " (select * from event where startdate>sysdate order by ename)e1)e";// 검색없을

		}
		// 검색 조건에 따라 분기
		/*
		 * if (mode == null || mode.equals("all")) {
		 * 
		 * } else { // 전체 모드가 아니라면, sql += " and " + mode + " like '%" + keyword +
		 * "%' "; }
		 */

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);

		rs = pstmt.executeQuery();

		int cnt = -1;

		if (rs.next()) {
			cnt = rs.getInt("cnt");
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

		return cnt;
	}

	// 행사 삭제
	public int deleteData(int eno) throws Exception {
		String sql = "";
		PreparedStatement pstmt = null;
		int cnt = -1;

		conn = super.getConnection();
		conn.setAutoCommit(false);

		sql = "delete from event where eno = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, eno);
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

	public int updateData(Event bean) throws Exception {
		PreparedStatement pstmt = null;
		int cnt = -1;
		// 행사 수정
		String sql = "update event set  startdate=?, enddate=?, ename=?, ephoneno=?, econtent=?, eplace=?, eimage1=?, eimage2=?, eimage3=?, eimage4=?, eimage5=?, evsection=? where eno=?";

		conn = super.getConnection();
		conn.setAutoCommit(false);
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, bean.getStartdate());
		pstmt.setString(2, bean.getEnddate());
		pstmt.setString(3, bean.getEname());
		pstmt.setString(4, bean.getEphoneno());
		pstmt.setString(5, (String) bean.getEcontent());
		pstmt.setString(6, bean.getEplace());
		pstmt.setString(7, bean.getEimage1());
		pstmt.setString(8, bean.getEimage2());
		pstmt.setString(9, bean.getEimage3());
		pstmt.setString(10, bean.getEimage4());
		pstmt.setString(11, bean.getEimage5());
		pstmt.setString(12, bean.getEvsection());
		pstmt.setInt(13, bean.getEno());

		cnt = pstmt.executeUpdate();
		conn.commit();
		System.out.println("==========bean.toString:  " + bean.toString());
		System.out.println("==================bean update: " + bean.getEno());
		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}

		return cnt;
	}
}
