package com.jeju.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.jeju.model.bean.Food;
import com.jeju.utility.MyUtility;
import com.jeju.utility.Paging;

public class FoodDao extends SuperDao {
	
		// 검색어를 받아서 테이블의 총 행 개수를 구합니다. (전체)
		public int GetTotalRecordCount(String mode, String keyword) throws Exception{
			System.out.print("검색할 필드명 (칼럼명) : " + mode);
			System.out.println(" / 검색할 키워드 : " + keyword);
			
			
			String sql = " select count(*) as cnt from foodiespot " ;
			
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
		public int GetTotalRecordCount(String mode, String keyword, String category) throws Exception{
			System.out.print("검색할 필드명 (칼럼명) : " + mode);
			System.out.println(" / 검색할 키워드 : " + keyword);
			
			
			String sql = " select count(*) as cnt from foodiespot " ;
			
			// 카테고리에 따라 분기
			if (category == "ko") {
				sql += " where category = '한식' " ;
				
			} else if (category == "fo") {
				sql += " where category = '세계음식' " ;
				
			} else if (category == "ca") {
				sql += " where category = '카페' " ;
				
			} else if (category == "be") {
				sql += " where category = '술집' " ;
				
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
		public List<Food> selectAll(Paging pageInfo) throws Exception {

			PreparedStatement pstmt = null ;
			ResultSet rs = null ;
			
			String sql = " select no, id, category, title, time, breaktime, phoneno, menu, place, map, image1, image2, image3, image4, image5, likes, regdate " ;
			
			sql += " from (select no, id, category, title, time, breaktime, phoneno, menu, place, map, image1, image2, image3, image4, image5, likes, regdate, rank() over(order by no desc) as ranking " ;
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
			
			List<Food> lists = new ArrayList<Food>();
			
			while(rs.next()) {
				lists.add(getBeanData(rs)) ;
			}
			
			if(rs != null) {rs.close();}
			if(pstmt != null) {pstmt.close();}
			if(conn != null) {conn.close();}
			
			return lists;
		}
		
		// selectAll 오버라이딩 (카테고리 변수 받기)
		public List<Food> selectAll(Paging pageInfo, String category) throws Exception {

			PreparedStatement pstmt = null ;
			ResultSet rs = null ;
			
			String sql = " select no, id, category, title, time, breaktime, phoneno, menu, place, map, image1, image2, image3, image4, image5, likes, regdate " ;
			
			sql += " from (select no, id, category, title, time, breaktime, phoneno, menu, place, map, image1, image2, image3, image4, image5, likes, regdate, rank() over(order by no desc) as ranking " ;
			sql += " from foodiespot " ;
			
			// 카테고리에 따라 분기
			if (category == "ko") {
				sql += " where category = '한식' " ;
				
			} else if (category == "fo") {
				sql += " where category = '세계음식' " ;
				
			} else if (category == "ca") {
				sql += " where category = '카페' " ;
				
			} else if (category == "be") {
				sql += " where category = '술집' " ;
				
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
			
			List<Food> lists = new ArrayList<Food>();
			
			while(rs.next()) {
				lists.add(getBeanData(rs)) ;
			}
			
			if(rs != null) {rs.close();}
			if(pstmt != null) {pstmt.close();}
			if(conn != null) {conn.close();}
			
			return lists;
		}
	
		// 게시물 목록을 게시물 번호 역순 정렬하여 반환한다.
		public List<Food> selectAll() throws Exception {
			PreparedStatement pstmt = null;
			// rs : 컴퓨터 메모리에 놓여있는 n행 n열의 테이블같은것
			ResultSet rs = null;
			
			String sql = " SELECT * FROM foodiespot order by no desc";
			
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			List<Food> lists = new ArrayList<Food>();
			
			while(rs.next()) {
				Food bean = new Food();
				bean = getBeanData(rs);
				lists.add(bean);

			}
			
			if(rs != null) {rs.close();}
			if(pstmt != null) {pstmt.close();}
			if(conn != null) {conn.close();}
			
			return lists;
		}

		// ResultSet 정보를 bean으로 만들어서 반환해 줍니다.
		private Food getBeanData(ResultSet rs) throws Exception {
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

		// 기본키 정보를 이용하여 Bean 객체를 구한다.
		public Food getDataByPrimarykey(String no) throws Exception {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = " SELECT * FROM foodiespot where no=?";
			
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, no);
			
			rs = pstmt.executeQuery();
			
			Food bean = null;
			
			if (rs.next()) {
				bean = getBeanData(rs);
			}	
				
			if(rs != null) {rs.close();}
			if(pstmt != null) {pstmt.close();}
			if(conn != null) {conn.close();}
			
			return bean;
		}
		
		// 추천을 했는지 체크하기
		public int	CheckLikes(String no, String id) throws Exception {
			int cnt = -1;
			int count = 0;
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			conn = super.getConnection();
			conn.setAutoCommit(false);
			
			// 추천기록 테이블에서 해당 유저의 추천기록 확인하기
			String sql = " select count(*) as cnt from likes ";
			sql += " where no = ? and category = 'food' and id = ? "; // 여기에 'food' 대신 event, tour, free 입력
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
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
		public int UpdateLikes(String no, String id) throws Exception {
			
			int cnt = -1;
			PreparedStatement pstmt = null;
			
			conn = super.getConnection();
			conn.setAutoCommit(false);
			
			// step1. 추천수 업데이트
			String sql = " update foodiespot set likes = likes +1 "; 
			sql += " where no = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			
			cnt = pstmt.executeUpdate();
			pstmt = null;
			
			// step2. 추천 테이블에 추천기록 입력
			sql = " insert into likes(no, category, id) "; 
			sql += " values(?, 'food' ,?) "; // 여기에 'food' 대신 event, tour, free 입력
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			pstmt.setString(2, id);
			
			cnt = pstmt.executeUpdate();
			
			conn.commit();
			
			if(pstmt != null) {pstmt.close();}
			if(conn != null) {conn.close();}
			
			return cnt;
		}

		// Bean 객체 정보를 이용하여 데이터 베이스에 추가합니다.
		public int InsertData(Food bean) throws Exception {
			System.out.println(bean); 
			
			int cnt = -1 ;
			
			String sql = " insert into foodiespot (no, id, CATEGORY, TITLE, TIME, BREAKTIME, PHONENO, MENU, PLACE, MAP, IMAGE1, IMAGE2, IMAGE3, IMAGE4, IMAGE5) " ;
			sql += " values('fd'||seqfood.nextval, ?, ?, ?, ?, ?, ?, ?, ?, null, ?, ?, ?, ?, ?) " ; 
			
			PreparedStatement pstmt = null ;		
			conn = super.getConnection() ;
			conn.setAutoCommit(false);		
			pstmt = conn.prepareStatement(sql) ; 
			
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getCategory());
			pstmt.setString(3, bean.getTitle());
			pstmt.setString(4, bean.getTime());
			pstmt.setString(5, bean.getBreaktime());
			pstmt.setString(6, bean.getPhoneno());
			pstmt.setString(7, bean.getMenu());
			pstmt.setString(8, bean.getPlace());
			pstmt.setString(9, bean.getImage1());
			pstmt.setString(10, bean.getImage2());
			pstmt.setString(11, bean.getImage3());
			pstmt.setString(12, bean.getImage4());
			pstmt.setString(13, bean.getImage5());
			
			cnt = pstmt.executeUpdate() ; 
			conn.commit();
			
			if(pstmt != null) {pstmt.close();}
			if(conn != null) {conn.close();}
			
			return cnt ;
		}

		// 게시물 번호를 이용하여 해당 상품을 삭제합니다.
		public int DeleteDate(String no) throws Exception {
			String sql = "";
			int cnt = 0;
			
			PreparedStatement pstmt = null;
			conn = super.getConnection();
			conn.setAutoCommit(false);
			
			// 맛집 테이블에서 해당 번호와 관련된 행 삭제하기
			sql = " delete from foodiespot where no = ? ";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, no);
			
			cnt = pstmt.executeUpdate();
			
			conn.commit();
			
			if (pstmt != null) {pstmt.close();} 
			if (conn != null) {conn.close();} 
			
			return cnt;
		}
		
		// 게시물 번호를 입력하여 해당 게시물에 대한 bean 객체를 반환해줍니다.
		public Food GetDataByPK(String no) throws Exception {
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = " select * from foodiespot where no = ? ";
			
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			// 치환
			pstmt.setString(1, no);
			
			rs = pstmt.executeQuery();
			
			Food bean = null;
			
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
		public int UpdateData(Food bean) throws Exception{
			System.out.println("게시물 수정 빈 :\n" + bean);
			
			PreparedStatement pstmt = null;
		    String sql = " update foodiespot set CATEGORY = ?, TITLE = ?, TIME = ?, BREAKTIME = ?, PHONENO = ?, MENU = ?, PLACE = ?, IMAGE1 = ?, IMAGE2 = ?, IMAGE3 = ?, IMAGE4 = ?, IMAGE5 = ? " ;
		    sql += " where no = ? " ; 
		
			int cnt = -1;
			
			conn = super.getConnection();
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement(sql);
			
			// 물음표 치환
			pstmt.setString(1, bean.getCategory());
			pstmt.setString(2, bean.getTitle());
			pstmt.setString(3, bean.getTime());
			pstmt.setString(4, bean.getBreaktime());
			pstmt.setString(5, bean.getPhoneno());
			pstmt.setString(6, bean.getMenu());
			pstmt.setString(7, bean.getPlace());
			pstmt.setString(8, bean.getImage1());
			pstmt.setString(9, bean.getImage2());
			pstmt.setString(10, bean.getImage3());
			pstmt.setString(11, bean.getImage4());
			pstmt.setString(12, bean.getImage5());
			pstmt.setString(13, bean.getNo());
			
			cnt = pstmt.executeUpdate();
			conn.commit();
			
			if(pstmt != null) {pstmt.close();}
			if(conn != null) {conn.close();}
			
			return cnt;
			
		}
	
	
}
