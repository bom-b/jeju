package com.jeju.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.jeju.model.bean.Tour;
import com.jeju.utility.MyUtility;
import com.jeju.utility.Paging;

public class TourDao extends SuperDao {
	
		// 검색어를 받아서 테이블의 총 행 개수를 구합니다. (전체)
		public int GetTotalRecordCount(String mode, String keyword) throws Exception{
			System.out.print("검색할 필드명 (칼럼명) : " + mode);
			System.out.println(" / 검색할 키워드 : " + keyword);
			
			
			String sql = " select count(*) as cnt from tourist " ;
			
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
		
		// GetTotalRecordCount 오버라이딩 (category를 변수로 받음)
		public int GetTotalRecordCount(String mode, String keyword, String tcategory) throws Exception{
			System.out.print("검색할 필드명 (칼럼명) : " + mode);
			System.out.println(" / 검색할 키워드 : " + keyword);
			
			
			String sql = " select count(*) as cnt from tourist " ;
			
			// 카테고리에 따라 분기
			if (tcategory == "ac") {
				sql += " where tcategory = '액티비티 체험' " ;
				
			} else if (tcategory == "or") {
				sql += " where tcategory = '오름 명소' " ;
				
			} else if (tcategory == "sea") {
				sql += " where tcategory = '해수욕장' " ;
				
			} else if (tcategory == "te") {
				sql += " where tcategory = '테마파크' " ;
				
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
		
		// 페이징 클래스의 객체를 매개변수로 받아서 조건에 맞는 목록 반환하기
		// TopN 구문을 사용하여 페이징 처리된 게시물 목록을 반환하는 것임
		public List<Tour> selectAll(Paging pageInfo) throws Exception {

			PreparedStatement pstmt = null ;
			ResultSet rs = null ;
			
			String sql = " select tno, id, tcategory, ttitle, ttime, tbreaktime, tphoneno, tmenu, tplace, tmap, timage1, timage2, timage3, timage4, timage5, tlikes, regdate " ;
			
			sql += " from (select tno, id, tcategory, ttitle, ttime, tbreaktime, tphoneno, tmenu, tplace, tmap, timage1, timage2, timage3, timage4, timage5, tlikes, regdate, rank() over(order by tno desc) as ranking " ;
			sql += " from foodiespot " ;
			
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
			
			List<Tour> lists = new ArrayList<Tour>();
			
			while(rs.next()) {
				lists.add(getBeanData(rs)) ;
			}
			
			if(rs != null) {rs.close();}
			if(pstmt != null) {pstmt.close();}
			if(conn != null) {conn.close();}
			
			return lists;
		}
		
		// selectAll 오버라이딩 (카테고리 변수 받기)
		public List<Tour> selectAll(Paging pageInfo, String tcategory) throws Exception {

			PreparedStatement pstmt = null ;
			ResultSet rs = null ;
			
			String sql = " select tno, id, tcategory, ttitle, ttime, tbreaktime, tphoneno, tmenu, tplace, tmap, timage1, timage2, timage3, timage4, timage5, tlikes, regdate " ;
			
			sql += " from (select tno, id, tcategory, ttitle, ttime, tbreaktime, tphoneno, tmenu, tplace, tmap, timage1, timage2, timage3, timage4, timage5, tlikes, regdate, rank() over(order by tno desc) as ranking " ;
			sql += " from tourist " ;
			
			// 카테고리에 따라 분기
			if (tcategory == "ac") {
				sql += " where tcategory = '액티비티 체험' " ;
				
			} else if (tcategory == "or") {
				sql += " where tcategory = '오름 명소' " ;
				
			} else if (tcategory == "sea") {
				sql += " where tcategory = '해수욕장' " ;
				
			} else if (tcategory == "te") {
				sql += " where tcategory = '테마파크' " ;
				
			}
			
			// 검색 조건에 따라 분기
			String mode = pageInfo.getMode();
			String keyword = pageInfo.getKeyword();
			if (mode == null || mode.equals("all")) {
				// 전체 모드, 또는 입력값이 안들어왔을경우
					
			} else {
				// 전체 모드가 아니라면,
				sql += " and " + mode + " like '%" + keyword + "%' " ;
			}
			
			sql += " ) " ;
			sql += " where ranking between ? and ? " ;
			
			conn = super.getConnection();
			
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setInt(1, pageInfo.getBeginRow());
			pstmt.setInt(2, pageInfo.getEndRow());
			
			rs = pstmt.executeQuery() ;
			
			List<Tour> lists = new ArrayList<Tour>();
			
			while(rs.next()) {
				lists.add(getBeanData(rs)) ;
			}
			
			if(rs != null) {rs.close();}
			if(pstmt != null) {pstmt.close();}
			if(conn != null) {conn.close();}
			
			return lists;
		}
	
		// 게시물 목록을 게시물 번호 역순 정렬하여 반환한다.
		public List<Tour> selectAll() throws Exception {
			PreparedStatement pstmt = null;
			// rs : 컴퓨터 메모리에 놓여있는 n행 n열의 테이블같은것
			ResultSet rs = null;
			
			String sql = " SELECT * FROM tourist order by tno desc";
			
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			List<Tour> lists = new ArrayList<Tour>();
			
			while(rs.next()) {
				Tour bean = new Tour();
				bean = getBeanData(rs);
				lists.add(bean);

			}
			
			if(rs != null) {rs.close();}
			if(pstmt != null) {pstmt.close();}
			if(conn != null) {conn.close();}
			
			return lists;
		}

		// ResultSet 정보를 bean으로 만들어서 반환해 줍니다.
		private Tour getBeanData(ResultSet rs) throws Exception {
			Tour bean = new Tour();
			
			bean.setTno(rs.getString("tno"));
			bean.setId(rs.getString("id"));
			bean.setTcategory(rs.getString("tcategory"));
			bean.setTtitle(rs.getString("ttitle"));
			bean.setTtime(rs.getString("ttime"));
			bean.setTbreaktime(rs.getString("tbreaktime"));
			bean.setTphoneno(rs.getString("tphoneno"));
			bean.setTmenu(rs.getString("tmenu"));
			bean.setTplace(rs.getString("tplace"));
			bean.setTmap(rs.getString("tmap"));
			bean.setTimage1(rs.getString("timage1"));
			bean.setTimage2(rs.getString("timage2"));
			bean.setTimage3(rs.getString("timage3"));
			bean.setTimage4(rs.getString("timage4"));
			bean.setTimage5(rs.getString("timage5"));
			bean.setTlikes(rs.getInt("tlikes"));
			bean.setRegdate(rs.getString("regdate"));
		
			return bean;
		}

		// 기본키 정보를 이용하여 Bean 객체를 구한다.
		public Tour getDataByPrimarykey(String tno) throws Exception {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = " SELECT * FROM tourist where tno=?";
			
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, tno);
			
			rs = pstmt.executeQuery();
			
			Tour bean = null;
			
			if (rs.next()) {
				bean = getBeanData(rs);
			}	
				
			if(rs != null) {rs.close();}
			if(pstmt != null) {pstmt.close();}
			if(conn != null) {conn.close();}
			
			return bean;
		}
		
		// 추천을 했는지 체크하기
		public int	CheckLikes(String tno, String id) throws Exception {
			int cnt = -1;
			int count = 0;
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			conn = super.getConnection();
			conn.setAutoCommit(false);
			
			// 추천기록 테이블에서 해당 유저의 추천기록 확인하기
			String sql = " select count(*) as cnt from tlikes ";
			sql += " where tno = ? and tcategory = 'tour' and id = ? "; // 여기에 'food' 대신 event, tour, free 입력
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tno);
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
		
		// 게시물의 pk 값을 받아서 likes 업데이트
		public int UpdateLikes(String tno, String id) throws Exception {
			
			int cnt = -1;
			PreparedStatement pstmt = null;
			
			conn = super.getConnection();
			conn.setAutoCommit(false);
			
			// step1. 추천수 업데이트
			String sql = " update tourist set tlikes = tlikes +1 "; 
			sql += " where tno = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tno);
			
			cnt = pstmt.executeUpdate();
			pstmt = null;
			
			// step2. 추천 테이블에 추천기록 입력
			sql = " insert into tlikes(tno, tcategory, id) "; 
			sql += " values(?, 'tour' ,?) "; // 여기에 'food' 대신 event, tour, free 입력
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tno);
			pstmt.setString(2, id);
			
			cnt = pstmt.executeUpdate();
			
			conn.commit();
			
			if(pstmt != null) {pstmt.close();}
			if(conn != null) {conn.close();}
			
			return cnt;
		}

		// Bean 객체 정보를 이용하여 데이터 베이스에 추가합니다.
		public int InsertData(Tour bean) throws Exception {
			System.out.println(bean); 
			
			int cnt = -1 ;
			
			String sql = " insert into tourist (tno, id, TCATEGORY, TTITLE, TTIME, TBREAKTIME, TPHONENO, TMENU, TPLACE, TMAP, TIMAGE1, TIMAGE2, TIMAGE3, TIMAGE4, TIMAGE5) " ;
			sql += " values(seqtour.nextval, ?, ?, ?, ?, ?, ?, ?, ?, null, ?, ?, ?, ?, ?) " ; 
			
			PreparedStatement pstmt = null ;		
			conn = super.getConnection() ;
			conn.setAutoCommit(false);		
			pstmt = conn.prepareStatement(sql) ; 
			
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getTcategory());
			pstmt.setString(3, bean.getTtitle());
			pstmt.setString(4, bean.getTtime());
			pstmt.setString(5, bean.getTbreaktime());
			pstmt.setString(6, bean.getTphoneno());
			pstmt.setString(7, bean.getTmenu());
			pstmt.setString(8, bean.getTplace());
			pstmt.setString(9, bean.getTimage1());
			pstmt.setString(10, bean.getTimage2());
			pstmt.setString(11, bean.getTimage3());
			pstmt.setString(12, bean.getTimage4());
			pstmt.setString(13, bean.getTimage5());
			
			cnt = pstmt.executeUpdate() ; 
			conn.commit();
			
			if(pstmt != null) {pstmt.close();}
			if(conn != null) {conn.close();}
			
			return cnt ;
		}

		// 게시물 번호를 이용하여 해당 게시물을 삭제합니다. 댓글과 추천기록도 함께 삭제.
		public int DeleteDate(String tno) throws Exception {
			String sql = "";
			int cnt = 0;
			
			PreparedStatement pstmt = null;
			conn = super.getConnection();
			conn.setAutoCommit(false);
			
			// step1. 관광지 테이블에서 해당 번호와 관련된 행 삭제하기
			sql = " delete from tourist where tno = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tno);
			cnt = pstmt.executeUpdate();
			pstmt = null;
			
			// step2. 댓글 테이블에서 게시물 넘버에 해당하는 댓글 삭제하기
			sql = " delete from comments where BOARDNO = ? and CATEGORY = 'tour' ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tno);
			cnt = pstmt.executeUpdate();
			pstmt = null;
			
			// step3. 추천 테이블에서 게시물 넘버에 해당하는 추천기록 삭제하기
			sql = " delete from likes where NO = ? and CATEGORY = 'tour' ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tno);
			cnt = pstmt.executeUpdate();
			
			conn.commit();
			
			if (pstmt != null) {pstmt.close();} 
			if (conn != null) {conn.close();} 
			
			return cnt;
		}
		
		// 게시물 번호를 입력하여 해당 게시물에 대한 bean 객체를 반환해줍니다.
		public Tour GetDataByPK(String tno) throws Exception {
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = " select * from tourist where tno = ? ";
			
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			// 치환
			pstmt.setString(1, tno);
			
			rs = pstmt.executeQuery();
			
			Tour bean = null;
			
			// 존재할때만 객체 생성을 하는게 좋다. 처음엔 null로 지정하는게 좋음
			if(rs.next()) {
				bean = getBeanData(rs);
			}
			
			if(rs != null) {rs.close();}
			if(pstmt != null) {pstmt.close();}
			if(conn != null) {conn.close();}
			
			return bean;
		}

		// 업데이트
		public int UpdateData(Tour bean) throws Exception{
			System.out.println("게시물 수정 빈 :\n" + bean);
			
			PreparedStatement pstmt = null;
		    String sql = " update tourist set TCATEGORY = ?, TTITLE = ?, TTIME = ?, TBREAKTIME = ?, TPHONENO = ?, TMENU = ?, TPLACE = ?, TIMAGE1 = ?, TIMAGE2 = ?, TIMAGE3 = ?, TIMAGE4 = ?, TIMAGE5 = ? " ;
		    sql += " where tno = ? " ; 
		
			int cnt = -1;
			
			conn = super.getConnection();
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement(sql);
			
			// 물음표 치환
			pstmt.setString(1, bean.getTcategory());
			pstmt.setString(2, bean.getTtitle());
			pstmt.setString(3, bean.getTtime());
			pstmt.setString(4, bean.getTbreaktime());
			pstmt.setString(5, bean.getTphoneno());
			pstmt.setString(6, bean.getTmenu());
			pstmt.setString(7, bean.getTplace());
			pstmt.setString(8, bean.getTimage1());
			pstmt.setString(9, bean.getTimage2());
			pstmt.setString(10, bean.getTimage3());
			pstmt.setString(11, bean.getTimage4());
			pstmt.setString(12, bean.getTimage5());
			pstmt.setString(13, bean.getTno());
			
			cnt = pstmt.executeUpdate();
			conn.commit();
			
			if(pstmt != null) {pstmt.close();}
			if(conn != null) {conn.close();}
			
			return cnt;
			
		}
	
	
}
