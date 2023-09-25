package com.jeju.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.jeju.model.bean.Event;

public class EventDao extends SuperDao {

	public List<Event> selectEventAll() throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from event order by eno";
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

		bean.setEno(rs.getInt("eno"));
		bean.setId(rs.getString("id"));
		bean.setEname(rs.getString("ename"));
		bean.setEphoneno(rs.getString("ephoneno"));
		bean.setEduration(rs.getString("eduration"));
		bean.setEcontent(rs.getClob("econtent"));
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
		
		rs=pstmt.executeQuery();
		Event bean = null;
		
		if(rs.next()) {
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

}
