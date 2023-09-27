package com.jeju.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.jeju.model.bean.Member;
import com.jeju.utility.Paging;

public class MemberDao extends SuperDao{
	public List<Member> selectAll(Paging pageInfo) throws Exception{
		// TopN 구문을 사용하여 페이징 처리된 게시물 목록을 반환합니다.
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		String sql = " select id, password, name, gender, mquestion, manswer, mphoneno, mrating, ratingimg";
		sql += " from ";
		sql += " (select id, password, name, gender, mquestion, manswer, mphoneno, mrating, ratingimg, rank() over(order by name asc) as ranking";
		sql += " from members)";
		sql += " where ranking between ? and ?";
		
		conn = super.getConnection();
		
		pstmt = conn.prepareStatement(sql) ;
		pstmt.setInt(1, pageInfo.getBeginRow());
		pstmt.setInt(2, pageInfo.getEndRow());
		
		rs = pstmt.executeQuery() ;
		
		List<Member> lists = new ArrayList<Member>();
		
		while(rs.next()) {
			lists.add(getBeanData(rs)) ;
		}
		
		if(rs != null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return lists;
	}	
	
	
	public int GetTotalRecordCount() throws Exception {
		// 테이블의 총 행개수를 구합니다.
		String sql = " select count(*) as cnt from members " ;
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		conn = super.getConnection() ;
		pstmt = conn.prepareStatement(sql) ;
		
		rs = pstmt.executeQuery() ; 
		
		int cnt = -1 ;
		
		if(rs.next()) {
			cnt = rs.getInt("cnt") ;
		}
		
		if(rs!=null) {rs.close();}
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}
		
		return cnt;
	}	
	
	
	public Member getDataByPrimaryKey(String id) throws Exception{
		// 기본 키 정보를 이용하여 Bean 객체를 구합니다.
		String sql = " select * from members " ;
		sql += " where id = ?" ;
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		conn = super.getConnection() ;
		pstmt = conn.prepareStatement(sql) ;
		pstmt.setString(1, id);
		
		rs = pstmt.executeQuery() ; 
		
		Member bean = null ;
		
		if(rs.next()) {
			bean = this.getBeanData(rs) ;
		}
		
		if(rs!=null) {rs.close();}
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}
		
		return bean;
	}	

	public Member getDataByPk(String id, String password) throws Exception {		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		/* ?를 placehoder라고 합니다. 치환되어야 할 영역 */
		
		String sql = " select * from members" ;
		sql += " where id = ? and password = ?" ;
		
		conn = super.getConnection() ; // 단계 02		
		pstmt = conn.prepareStatement(sql) ; // 단계 03
		
		pstmt.setString(1, id);
		pstmt.setString(2, password);
		
		rs = pstmt.executeQuery() ; // 단계 04-01
		
		Member bean = null ;
		if(rs.next()) { // 1건이 조회됨
			bean = getBeanData(rs); 
		}
		
		// 단계 05
		if(rs != null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return bean ;
	}

	private Member getBeanData(ResultSet rs) throws Exception{
		// ResultSet의 데이터를 읽어서 Bean에 기록한 다음, 반환해 줍니다.
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
		
		
		return bean;
	}

	public int InsertData(Member bean) throws Exception {
		System.out.println(bean); 
		
		// Bean 객체 정보를 이용하여 데이터 베이스에 추가합니다.
		int cnt = -1 ;
		
		String sql = " insert into members(id, password, name, gender, mquestion, manswer, mphoneno, birth)" ;
		sql += " values(?, ?, ?, ?, ?, ?, ?, ?)" ; 
		
		PreparedStatement pstmt = null ;
		
		conn = super.getConnection() ;
		conn.setAutoCommit(false);
		
		pstmt = conn.prepareStatement(sql) ;
		
		pstmt.setString(1, bean.getId());
		pstmt.setString(2, bean.getPassword());
		pstmt.setString(3, bean.getName());		
		pstmt.setString(4, bean.getGender());	
		pstmt.setString(5, bean.getMquestion());
		pstmt.setString(6, bean.getManswer());	
		pstmt.setInt(7, bean.getMphoneno());
		/* pstmt.setString(8, bean.getMrating()); */
		pstmt.setString(8, bean.getBirth());
		/* pstmt.setString(10, bean.getRatingimg()); */

		
		
		cnt = pstmt.executeUpdate() ; 
		conn.commit();
		
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return cnt ;
	}

	public List<Member> selectAll() throws Exception{
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		String sql = " select * from members order by name asc";
		
		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql) ;
		
		rs = pstmt.executeQuery() ;
		
		List<Member> lists = new ArrayList<Member>();
		
		while(rs.next()) {
			lists.add(getBeanData(rs)) ;
		}
		
		if(rs != null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return lists;
	}
	
	public int UpdateData(Member bean) throws Exception {
	    int cnt = -1;
	   
	    String sql = "UPDATE members SET " +
	            "password = ?, " +
	            "name = ?, " +
	            "gender = ?, " +
	            "mquestion = ?, " +
	            "manswer = ?, " +
	            "mphoneno = ?, " +
	            "birth = ? " +
	            "WHERE id = ?";

	    PreparedStatement pstmt = null;

	    conn = super.getConnection();
	    conn.setAutoCommit(false);

	    pstmt = conn.prepareStatement(sql);

	    pstmt.setString(1, bean.getPassword());
	    pstmt.setString(2, bean.getName());
	    pstmt.setString(3, bean.getGender());
	    pstmt.setString(4, bean.getMquestion());
	    pstmt.setString(5, bean.getManswer());
	    pstmt.setInt(6, bean.getMphoneno());
	    pstmt.setString(7, bean.getBirth());

	    // WHERE 절에 현재 로그인한 사용자의 ID 설정
	    pstmt.setString(8, bean.getId());

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


	public int DeleteData(String id) {
	    conn = null;
	    PreparedStatement pstmt = null;
	    
	    try {
	        conn = super.getConnection();
	        
	        String sql = "DELETE FROM members WHERE id = ?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, id);
	        
	        int cnt = pstmt.executeUpdate();
	        
	        return cnt;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return -1; // 실패 시 -1 반환
	    } finally {
	        try {
	            if (pstmt != null) {
	                pstmt.close();
	            }
	            if (conn != null) {
	                conn.close();
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	}


}
