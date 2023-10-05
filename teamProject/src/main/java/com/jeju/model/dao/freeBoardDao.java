package com.jeju.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.jeju.model.bean.Food;
import com.jeju.model.bean.freeBoard;
import com.jeju.utility.Paging;

public class freeBoardDao extends SuperDao {
	private freeBoard getBeanData(ResultSet rs) throws Exception {
		// ResultSet 정보를 Bean으로 만들어서 반환해 줍니다.
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
		bean.setOlikes(rs.getInt("olikes")); // 좋아요

		return bean;
	}

	public freeBoard getDataByPrimaryKey(String ono) throws Exception {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = " select * from openforum ";
		sql += " where ono = ? ";

		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, ono);

		rs = pstmt.executeQuery();

		freeBoard bean = null;

		if (rs.next()) {
			bean = this.getBeanData(rs);
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

	public List<freeBoard> selectAll() throws Exception {
		// 게시물 목록을 게시물 글번호 역순 정렬하여 반환합니다.
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = " select * from openforum order by ono desc";

		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);

		rs = pstmt.executeQuery();

		List<freeBoard> lists = new ArrayList<freeBoard>();

		while (rs.next()) {
			lists.add(getBeanData(rs));
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

		return lists;
	}

	public int GetTotalRecordCount(String mode, String keyword,  String pcategory) throws Exception {
		System.out.print("검색할 필드명 : " + mode);
		System.out.println(", 검색할 키워드 : " + keyword);

		// 테이블의 총 행개수를 구합니다.
		String sql = " select count(*) as cnt from openforum ";
		
		// 카테고리에 따라 분기
		  if (pcategory == "잡담") {
		        sql += "WHERE pcategory = '잡담' ";
		    } else if (pcategory == "정보공유") {
		        sql += "WHERE pcategory = '정보공유' ";
		    } else if (pcategory == "질문") {
		        sql += "WHERE pcategory = '질문' ";
		    } else {
		        // 다른 경우에는 모든 카테고리를 가져오도록 설정
		    }
		  
		  
		// 검색 조건에 따라 분기
					if (mode == null || mode.equals("all")) {
						// 전체 모드, 또는 입력값이 안들어왔을경우
						
					} else {
						// 전체 모드가 아니라면,
						sql += " and " + mode + " like '%" + keyword + "%' " ;
					}
					
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
	public List<freeBoard> selectAll(Paging pageInfo)  throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = " select ono, id, oname, ocontent , readhit, oregdate, pcategory , oimage1, oimage2, oimage3, oimage4, oimage5, olikes ";
		
		sql += " from (select ono, id, oname, ocontent, readhit, oregdate,  pcategory ,oimage1, oimage2, oimage3, oimage4, oimage5, olikes, rank() over(order by ono desc) as ranking ";
		sql += " from openforum ";
		
	
		String mode = pageInfo.getMode();
		String keyword = pageInfo.getKeyword();
		if (mode == null || mode.equals("all")) {
			// 전체 모드, 또는 입력값이 안들어왔을경우

		} else {
			// 전체 모드가 아니라면,
			sql += " where " + mode + " like '%" + keyword + "%' " ;
		}
		
		sql += " ) " ;
		sql += " where ranking between ? and ? " ;
		
		conn = super.getConnection();
		
		pstmt = conn.prepareStatement(sql) ;
		pstmt.setInt(1, pageInfo.getBeginRow());
		pstmt.setInt(2, pageInfo.getEndRow());
		
		rs = pstmt.executeQuery() ;
		
		List<freeBoard> lists = new ArrayList<freeBoard>();
		
		while(rs.next()) {
			lists.add(getBeanData(rs)) ;
		}
		
		if(rs != null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return lists;
  
	}
	public List<freeBoard> selectAll(Paging pageInfo, String pcategory) throws Exception {
		// TopN 구문을 사용하여 페이징 처리된 게시물 목록을 반환합니다.
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = " select ono, id, oname, ocontent , readhit, oregdate, pcategory , oimage1, oimage2, oimage3, oimage4, oimage5,  olikes ";
		
		sql += " from (select ono, id, oname, ocontent, readhit, oregdate,  pcategory ,oimage1, oimage2, oimage3, oimage4, oimage5,  olikes, rank() over(order by ono desc) as ranking ";
		sql += " from openforum ";
		
		// 카테고리에 따라 분기
		  if (pcategory == "잡담") {
		        sql += "WHERE pcategory = '잡담' ";
		    } else if (pcategory == "정보공유") {
		        sql += "WHERE pcategory = '정보공유' ";
		    } else if (pcategory == "질문") {
		        sql += "WHERE pcategory = '질문' ";
		    } else {
		        // 다른 경우에는 모든 카테고리를 가져오도록 설정
		    }
		String mode = pageInfo.getMode();
		String keyword = pageInfo.getKeyword();

		if (mode == null || mode.equalsIgnoreCase("all")) {
		} else { // 전체 모드가 아니면
			sql += " where " + mode + " like '%" + keyword + "%'";
		}

		sql += " ) ";
		sql += " where ranking between ? and ? ";

		conn = super.getConnection();

		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pageInfo.getBeginRow());
		pstmt.setInt(2, pageInfo.getEndRow());

		rs = pstmt.executeQuery();

		List<freeBoard> lists = new ArrayList<freeBoard>();

		while (rs.next()) {
			lists.add(getBeanData(rs));
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

		return lists;

	}

	public int InsertData(freeBoard bean) throws Exception {// 고쳐야함
		System.out.println(bean);
		// bean 객체 정보를 이용하여 데이터 베이스에 추가합니다.
		int cnt = -1;

		String sql = "INSERT INTO openforum (ono, id, oname, ocontent, oregdate, pcategory, oimage1, oimage2, oimage3, oimage4, oimage5) ";
	    sql += "VALUES (seqopen.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		// 수정할 내용

		PreparedStatement pstmt = null;
		conn = super.getConnection();
		conn.setAutoCommit(false);
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, bean.getId());
		pstmt.setString(2, bean.getOname());
		pstmt.setString(3, bean.getOcontent());
		pstmt.setString(4, bean.getOregdate());
		pstmt.setString(5, bean.getPcategory());
		pstmt.setString(6, bean.getOimage1());
		pstmt.setString(7, bean.getOimage2());
		pstmt.setString(8, bean.getOimage3());
		pstmt.setString(9, bean.getOimage4());
		pstmt.setString(10, bean.getOimage5());

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

	public freeBoard GetDataByPk(String ono) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " select * from openforum where ono = ? ";


		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, ono);

		rs = pstmt.executeQuery();

		freeBoard bean = null;

		if (rs.next()) {
			bean = this.getBeanData(rs);

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

	public int UpdateData(freeBoard bean) throws Exception { // 고쳐야함
		System.out.println(bean);

		int cnt = -1;

		String sql = " update openforum set id = ?, oname = ?, ocontent = ?, oregdate = ?, pcategory = ?,oimage1 = ?,oimage2 = ?,oimage3 = ?,oimage4 = ?,oimage5 = ?";
		sql += " where ono = ? ";

		PreparedStatement pstmt = null;
		conn = super.getConnection();
		conn.setAutoCommit(false);
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, bean.getId());
		pstmt.setString(2, bean.getOname());
		pstmt.setString(3, bean.getOcontent());
		pstmt.setString(4, bean.getOregdate());
		pstmt.setString(5, bean.getPcategory());
		pstmt.setString(6, bean.getOimage1());
		pstmt.setString(7, bean.getOimage2());
		pstmt.setString(8, bean.getOimage3());
		pstmt.setString(9, bean.getOimage4());
		pstmt.setString(10, bean.getOimage5());
		 pstmt.setString(11, bean.getOno());

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
	// 추천을 했는지 체크하기
			public int	CheckLikes(String ono, String id) throws Exception {
				int cnt = -1;
				int count = 0;
				
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				conn = super.getConnection();
				conn.setAutoCommit(false);
				
				// 추천기록 테이블에서 해당 유저의 추천기록 확인하기
				String sql = " select count(*) as cnt from likes ";
				sql += " where no = ? and category = 'free' and id = ? "; // 여기에 'food' 대신 event, tour, free 입력
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, ono);
				pstmt.setString(2, id);

				rs = pstmt.executeQuery();
				if (rs.next()) {
					count = rs.getInt("cnt");
			    }
				
				if (count == 1) {
					// 이미 추천을 했을 경우
					cnt = -1;
					
				} else {
					// 추천 안했을 경우
					cnt = 1;
				}
				
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				if(conn != null) {conn.close();}
				
				return cnt;
			}
	public int UpdateEmoticon(String ono, String id) throws Exception {
		

		int cnt = -1;
		PreparedStatement pstmt = null;
		
		conn = super.getConnection();
		conn.setAutoCommit(false);
		
		// step1. 추천수 업데이트
		String sql = " update openforum set olikes = olikes +1 "; 
		sql += " where ono = ? ";
		
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, ono);

		cnt = pstmt.executeUpdate();
		pstmt = null;
		// step2. 추천 테이블에 추천기록 입력
		sql = " insert into likes(no, category, id) "; 
		sql += " values(?, 'free' ,?) "; // 여기에 'food' 대신 event, tour, free 입력
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, ono); // no는 int 타입
		pstmt.setString(2, id); // id는 String 타입
		
		cnt = pstmt.executeUpdate();
		
		conn.commit();
		
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return cnt;
	}

	public int DeleteDate(String ono) throws Exception{

		int cnt = 0;
		PreparedStatement pstmt = null;
		conn = super.getConnection();
		conn.setAutoCommit(false);
		
		String sql = " delete from openforum where ono = ? ";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, ono); // ono 값을 바인딩

		cnt = pstmt.executeUpdate();
		pstmt = null;
		// step2. 댓글 테이블에서 게시물 넘버에 해당하는 댓글 삭제하기
					sql = " delete from comments where BOARDNO = ? and CATEGORY = ' free' ";
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, ono);
					cnt = pstmt.executeUpdate();
					pstmt = null;
					
					// step3. 추천 테이블에서 게시물 넘버에 해당하는 추천기록 삭제하기
					sql = " delete from likes where NO = ? and CATEGORY = 'free' ";
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, ono);
					cnt = pstmt.executeUpdate();
					
					conn.commit();
					
					if (pstmt != null) {pstmt.close();} 
					if (conn != null) {conn.close();} 
					
					return cnt;
	}

	public int GetTotalRecordCount(String mode, String keyword) throws Exception{ //(전체)
		System.out.print("검색할 필드명 (칼럼명) : " + mode);
		System.out.println(" / 검색할 키워드 : " + keyword);
		
		
		String sql = " select count(*) as cnt from openforum " ;
		
		if (mode == null || mode.equals("all")) {
			// 전체 모드, 또는 입력값이 안들어왔을경우
			
		} else {
			// 전체 모드가 아니라면,
			sql += " where " + mode + " like '%" + keyword + "%' " ;
		}
		
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
}
