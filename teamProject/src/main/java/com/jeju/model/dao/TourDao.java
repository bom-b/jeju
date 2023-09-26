package com.jeju.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.jeju.model.bean.Tour;
import com.jeju.utility.Paging;

public class TourDao extends SuperDao{
	public int UpdateEmoticon(int tno, String columnName) throws Exception {
		String sql = " update tourists set " + columnName + "=" + columnName + " + 1  " ;
		sql += " where no = ? " ;
		PreparedStatement pstmt = null ;
		
		int cnt = -1 ;
		conn = super.getConnection() ;
		conn.setAutoCommit(false);  
		pstmt = conn.prepareStatement(sql) ;
		pstmt.setInt(1, tno);
		
		cnt = pstmt.executeUpdate() ;
		
		conn.commit(); 
		
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}
		
		return cnt ;
	}	
	
	public Integer GetReplyCount(int groupno) throws Exception {
		System.out.println("검색할 그룹 번호 : " + groupno);
		
		// 해당 그룹 번호의 데이터 행 개수를 반환해 줍니다.
		int cnt = -1 ;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		String sql = " select count(*) as cnt from tourist " ;
		sql += " where groupno = ? " ; 
		
		conn = super.getConnection() ;
		conn.setAutoCommit(false);
		
		pstmt = conn.prepareStatement(sql) ;
		pstmt.setInt(1, groupno);
		
		rs = pstmt.executeQuery();
		if(rs.next()) {
			cnt = rs.getInt("cnt") ;
		}
		
		conn.commit() ;
		
		if(rs!=null) {rs.close();}
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}		
		
		return cnt ;
	}	
	public int UpdateData(Tour bean) throws Exception {
		System.out.println(bean); 
		
		int cnt = -1 ;
		
		String sql = " update tourist set id = ?, tname = ?, ttime = ?, tphoneno = ?, tprice = ?, tplace = ?, tmap = ?, tlikes = ?, timage1 = ?, timage2 = ?, timage3 = ?, timage4 = ?, timage5 = ?, regdate = ?, tcategory = ? " ;
		sql += " where tno = ? " ; 
		
		PreparedStatement pstmt = null ;		
		conn = super.getConnection() ;
		conn.setAutoCommit(false);		
		pstmt = conn.prepareStatement(sql) ; 
		
		pstmt.setString(1, bean.getTno());
		pstmt.setString(2, bean.getId());		
		pstmt.setString(3, bean.getTname());
		pstmt.setString(4, bean.getTtime());		
		pstmt.setInt(5, bean.getTphoneno());
		pstmt.setString(6, bean.getTprice());
		pstmt.setString(7, bean.getTplace());
		pstmt.setString(8, bean.getTmap());
		pstmt.setString(9, bean.getTlikes());
		pstmt.setString(10, bean.getTimage1());
		pstmt.setString(11, bean.getTimage2());
		pstmt.setString(12, bean.getTimage3());
		pstmt.setString(13, bean.getTimage4());
		pstmt.setString(14, bean.getTimage5());
		pstmt.setString(15, bean.getRegdate());
		pstmt.setString(16, bean.getTcategory());
		
		cnt = pstmt.executeUpdate() ; 
		conn.commit();
		
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return cnt ;
	}	
	public int GetTotalRecordCount(String mode, String keyword) throws Exception {
		System.out.print("검색할 필드명 : " + mode);
		System.out.println(", 검색할 키워드 : " + keyword);
		
		// 테이블의 총 행개수를 구합니다.
		String sql = " select count(*) as cnt from tourist " ;
		if(mode == null || mode.equals("all") ) {			
		}else { // 전체 모드가 아니면
			sql += " where " + mode + " tlikes '%" + keyword + "%'" ;
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

	public int GetTotalRecordCount() throws Exception {
		// 테이블의 총 행개수를 구합니다.
		String sql = " select count(*) as cnt from tourist " ;
		
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
	
	public Tour getDataByPrimaryKey(Integer tno) throws Exception{
		String sql = " select * from tourist " ;
		sql += " where tno = ?" ;
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		conn = super.getConnection() ;
		pstmt = conn.prepareStatement(sql) ;
		pstmt.setInt(1, tno);
		
		rs = pstmt.executeQuery() ; 
		
		Tour bean = null ;
		
		if(rs.next()) {
			bean = this.getBeanData(rs) ;
		}
		
		if(rs!=null) {rs.close();}
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}
		
		return bean;
	}	
	
	public List<Tour> selectAll(Paging pageInfo) throws Exception{
		// TopN 구문을 사용하여 페이징 처리된 게시물 목록을 반환합니다.
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		String sql = " select tno, id, tname, ttime, tphoneno, tprice, tplace, tmap, tlikes, timage1, timage2, timage3, timage4, timage5, regdate, tcategory " ;
		
		// 답글 이전 코딩 방식
		// sql += " from (select no, id, password, subject, content, readhit, regdate, remark, groupno, orderno, depth, rank() over(order by no desc) as ranking " ;
		
		sql += " from (select tno, id, tname, ttime, tphoneno, tprice, tplace, tmap, tlikes, timage1, timage2, timage3, timage4, timage5, regdate, tcategory rank() over(order by groupno desc, orderno asc) as ranking " ;		
		sql += " from tourist " ;
		
		String mode = pageInfo.getMode() ;
		String keyword = pageInfo.getKeyword() ; 
		
		if(mode == null || mode.equals("all") ) {			
		}else { // 전체 모드가 아니면
			sql += " where " + mode + " tlikes '%" + keyword + "%'" ;
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
	
	public List<Tour> selectAll() throws Exception{
		// 게시물 목록을 게시물 글번호 역순 정렬하여 반환합니다.
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		String sql = " select * from tourist order by tno desc";
		
		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql) ;
		
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
	
	private Tour getBeanData(ResultSet rs) throws Exception {
		// ResultSet 정보를 Bean으로 만들어서 반환해 줍니다.
		Tour bean = new Tour() ;
		
		bean.setTno(rs.getString("tno"));		
		bean.setId(rs.getString("id"));
		bean.setTname(rs.getString("tname"));
		bean.setTtime(rs.getString("ttime"));
		bean.setTphoneno(rs.getInt("tphoneno"));
		bean.setTprice(rs.getString("tprice"));
		bean.setTplace(rs.getString("tplace"));
		bean.setTmap(rs.getString("tmap"));
		bean.setTlikes(rs.getString("tlikes")); // 좋아요
		bean.setTimage1(rs.getString("timage1"));
		bean.setTimage1(rs.getString("timage2"));
		bean.setTimage1(rs.getString("timage3"));
		bean.setTimage1(rs.getString("timage4"));
		bean.setTimage1(rs.getString("timage5"));
		bean.setRegdate(String.valueOf(rs.getDate("regdate")));
		bean.setTcategory(rs.getString("tcategory"));
		
		return bean;
	}

	public int InsertData(Tour bean) throws Exception{
		System.out.println(bean); 		
		// Bean 객체 정보를 이용하여 데이터 베이스에 추가합니다.
		int cnt = -1 ;
		
		String sql = " insert into tourist(tno, id, tname, ttime, tphoneno, tprice, tplace, tmap, tlikes, timage1, timage2, timage3, timage4, timage5, regdate, tcategory) " ;
		sql += " values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" ; 
		
		PreparedStatement pstmt = null ;		
		conn = super.getConnection() ;
		conn.setAutoCommit(false);		
		pstmt = conn.prepareStatement(sql) ; 
		
		pstmt.setString(1, bean.getTno());
		pstmt.setString(2, bean.getId());		
		pstmt.setString(3, bean.getTname());
		pstmt.setString(4, bean.getTtime());		
		pstmt.setInt(5, bean.getTphoneno());
		pstmt.setString(6, bean.getTprice());
		pstmt.setString(7, bean.getTplace());
		pstmt.setString(8, bean.getTmap());
		pstmt.setString(9, bean.getTlikes());
		pstmt.setString(10, bean.getTimage1());
		pstmt.setString(11, bean.getTimage2());
		pstmt.setString(12, bean.getTimage3());
		pstmt.setString(13, bean.getTimage4());
		pstmt.setString(14, bean.getTimage5());
		pstmt.setString(15, bean.getRegdate());	
		pstmt.setString(16, bean.getTcategory());
		
		cnt = pstmt.executeUpdate() ; 
		conn.commit();
		
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return cnt ;
	}	
	
	public int ReplyData(Tour bean, Integer orderno) throws Exception{
		System.out.println(bean); 	
		
		PreparedStatement pstmt = null ;		
		int cnt = -1 ;
		
		conn = super.getConnection() ;
		conn.setAutoCommit(false);		
		
		pstmt = null ; 
		// step2 : Bean 객체 정보를 이용하여 답글을 작성합니다.
		String sql2 = " insert into tourist(tno, id, tname, ttime, tphoneno, regdate, tplace, tmap, tprice) " ;
		sql2 += " values(seqboard.nextval, ?, ?, ?, ?, ?, ?, ?, ?)" ; 
		
		pstmt = conn.prepareStatement(sql2) ; 
		
		pstmt.setString(1, bean.getId());		
		pstmt.setString(2, bean.getTname());
		pstmt.setString(3, bean.getTtime());		
		pstmt.setInt(4, bean.getTphoneno());
		pstmt.setString(5, bean.getRegdate());		
		pstmt.setString(6, bean.getTplace());
		pstmt.setString(7, bean.getTmap());
		pstmt.setString(8, bean.getTprice());		
		
		cnt = pstmt.executeUpdate() ; 
		conn.commit();
		
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return cnt ;
	}		

	public Tour GetDataByPk(String tno) throws Exception{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = " select * from tourist where tno=?";
		
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

	public List<Tour> GetCategoryList(String string, String string2) {
		// TODO Auto-generated method stub
		return null;
	}

	

	public List<Tour> selectAll(Paging pageInfo, String category) throws Exception{
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		String sql = " select tno, id, tname, ttime, tphoneno, tprice, tplace, tmap, tlikes, timage1, timage2, timage3, timage4, timage5, regdate, tcategory " ;
		
		sql += " from (select tno, id, tname, ttime, tphoneno, tprice, tplace, tmap, tlikes, timage1, timage2, timage3, timage4, timage5, regdate, tcategory, rank() over(order by tno desc) as ranking " ;
		sql += " from tourist " ;
		
		// 카테고리에 따라 분기
		if (category == "ac") {
			sql += " where tcategory = '액티비티 체험' " ;
			
		} else if (category == "or") {
			sql += " where tcategory = '오름 명소' " ;
			
		} else if (category == "sea") {
			sql += " where tcategory = '해수욕장' " ;
			
		} else if (category == "te") {
			sql += " where tcategory = '테마파크' " ;
			
		}
		
		// 검색 조건에 따라 분기
		String mode = pageInfo.getMode();
		String keyword = pageInfo.getKeyword();
		if (mode == null || mode.equals("all")) {
			// 전체 모드, 또는 입력값이 안들어왔을경우
				
		} else {
			// 전체 모드가 아니라면,
			sql += " and " + mode + " tlikes '%" + keyword + "%' " ;
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

	public int GetTotalRecordCount(String mode, String keyword, String category) throws Exception{
		System.out.print("검색할 필드명 (칼럼명) : " + mode);
		System.out.println(" / 검색할 키워드 : " + keyword);
		
		
		String sql = " select count(*) as cnt from tourist " ;
		
		// 카테고리에 따라 분기
		if (category == "ac") {
			sql += " where tcategory = '액티비티 체험' " ;
			
		} else if (category == "or") {
			sql += " where tcategory = '오름 명소' " ;
			
		} else if (category == "sea") {
			sql += " where tcategory = '해수욕장' " ;
			
		} else if (category == "te") {
			sql += " where tcategory = '테마파크' " ;
			
		}
		
		// 검색 조건에 따라 분기
		if (mode == null || mode.equals("all")) {
			// 전체 모드, 또는 입력값이 안들어왔을경우
			
		} else {
			// 전체 모드가 아니라면,
			sql += " and " + mode + " tlikes '%" + keyword + "%' " ;
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
		
		System.out.println("입력된 sql 문장 : " + sql);
		System.out.println("표시할 게시물의 개수 : " + cnt);
		return cnt;
	}

	public int CheckLikes(String tno, String id) throws Exception{
		int cnt = -1;
		int count = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		conn = super.getConnection();
		conn.setAutoCommit(false);
		
		// 추천기록 테이블에서 해당 유저의 추천기록 확인하기
		String sql = " select count(*) as cnt from tlikes ";
		sql += " where tno = ? and id = ?";
		
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

	public int UpdateLikes(String tno, String id) throws Exception{
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
		sql = " insert into tlikes(tno, id) ";
		sql += " values(?, ?) ";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, tno);
		pstmt.setString(2, id);
		
		cnt = pstmt.executeUpdate();
		
		conn.commit();
		
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return cnt;
	}

}
