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
		
		String sql = " select id, password, name, gender, mquestion, manswer, mphoneno, mrating, birth, ratingimg";
		sql += " from ";
		sql += " (select id, password, name, gender, mquestion, manswer, mphoneno, mrating, birth, ratingimg, rank() over(order by name asc) as ranking";
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
	
	public int updateMrating(String id) {
	    conn = null;
	    PreparedStatement pstmt = null;

	    try {
	        conn = super.getConnection();

	        // 현재 mrating 값을 검색합니다.
	        String selectSql = "SELECT mrating FROM members WHERE id = ?";
	        pstmt = conn.prepareStatement(selectSql);
	        pstmt.setString(1, id);
	        ResultSet rs = pstmt.executeQuery();

	        int currentRating = 0;
	        if (rs.next()) {
	            currentRating = Integer.parseInt(rs.getString("mrating"));
	        }

	        // 새로운 mrating 및 해당하는 ratingimg를 계산합니다.
	        int newRating = currentRating + 5;
	        String newRatingImg = calculateRatingImg(newRating);

	        // mrating 및 ratingimg를 업데이트합니다.
	        String updateSql = "UPDATE members SET mrating = ?, ratingimg = ? WHERE id = ?";
	        pstmt = conn.prepareStatement(updateSql);
	        pstmt.setString(1, Integer.toString(newRating));
	        pstmt.setString(2, newRatingImg);
	        pstmt.setString(3, id);

	        int updatedRows = pstmt.executeUpdate();

	        return updatedRows;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return -1; // 업데이트 실패
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

	private String calculateRatingImg(int mrating) {
	    if (mrating >= 0 && mrating <= 10) {
	        return "1st.png";
	    } else if (mrating >= 11 && mrating <= 20) {
	        return "2nd.png";
	    } else if (mrating >= 21 && mrating <= 30) {
	        return "3rd.png";
	    } else if (mrating >= 31 && mrating <= 40) {
	        return "4th.png";
	    } else if (mrating >= 41) {
	        return "5th.png";
	    } else {
	        return "logo.png"; // 다른 경우 처리 가능
	    }
	}

	public boolean isIdDuplicate(String id) throws Exception {
        conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = super.getConnection();
            String sql = "SELECT COUNT(*) FROM members WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0; // 중복된 아이디가 있으면 true, 아니면 false 반환
            }

            return false; // 아이디가 존재하지 않음

        } finally {
            // 리소스 해제
            if (rs != null) {
                rs.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

}
