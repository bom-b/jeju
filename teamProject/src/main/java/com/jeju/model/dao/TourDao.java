package com.jeju.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.jeju.model.bean.Tour;
import com.jeju.utility.Paging;

public class TourDao extends SuperDao{
	public int UpdateEmoticon(int no, String columnName) throws Exception {
		String sql = " update tourists set " + columnName + "=" + columnName + " + 1  " ;
		sql += " where no = ? " ;
		PreparedStatement pstmt = null ;
		
		int cnt = -1 ;
		conn = super.getConnection() ;
		conn.setAutoCommit(false);  
		pstmt = conn.prepareStatement(sql) ;
		pstmt.setInt(1, no);
		
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
		
		String sql = " update tourist set id = ?, tname = ?, ttime = ?, tphoneno = ?, tprice = ?, tplace = ?, tmap = ?, tlikes = ?, timage1 = ?, timage2 = ?, timage3 = ?, timage4 = ?, timage5 = ?, regdate = ? " ;
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
			sql += " where " + mode + " like '%" + keyword + "%'" ;
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
	
	public Tour getDataByPrimaryKey(Integer no) throws Exception{
		String sql = " select * from tourist " ;
		sql += " where no = ?" ;
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		conn = super.getConnection() ;
		pstmt = conn.prepareStatement(sql) ;
		pstmt.setInt(1, no);
		
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
		
		String sql = " select tno, id, tname, ttime, tphoneno, tprice, tplace, tmap, tlikes, timage1, timage2, timage3, timage4, timage5, regdate " ;
		
		// 답글 이전 코딩 방식
		// sql += " from (select no, id, password, subject, content, readhit, regdate, remark, groupno, orderno, depth, rank() over(order by no desc) as ranking " ;
		
		sql += " from (select tno, id, tname, ttime, tphoneno, tprice, tplace, tmap, tlikes, timage1, timage2, timage3, timage4, timage5, regdate, rank() over(order by groupno desc, orderno asc) as ranking " ;		
		sql += " from tourist " ;
		
		String mode = pageInfo.getMode() ;
		String keyword = pageInfo.getKeyword() ; 
		
		if(mode == null || mode.equals("all") ) {			
		}else { // 전체 모드가 아니면
			sql += " where " + mode + " like '%" + keyword + "%'" ;
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
		
		String sql = " select * from tourist order by no desc";
		
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
		
		return bean;
	}

	public int InsertData(Tour bean) throws Exception{
		System.out.println(bean); 		
		// Bean 객체 정보를 이용하여 데이터 베이스에 추가합니다.
		int cnt = -1 ;
		
		String sql = " insert into tourist(tno, id, tname, ttime, tphoneno, tprice, tplace, tmap, tlikes, timage1, timage2, timage3, timage4, timage5, regdate) " ;
		sql += " values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" ; 
		
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
		
		/*
		 * // step1 : 동일한 그룹 번호에 대하여 orderno 컬럼의 숫자를 1씩 증가 시켜야 합니다. String sql1 =
		 * " update tourist set orderno = orderno + 1 " ; sql1 +=
		 * " where groupno = ? and orderno > ? " ;
		 */
		
		/*
		 * pstmt = conn.prepareStatement(sql1) ; pstmt.setInt(1, bean.getTno());
		 * pstmt.setInt(2, orderno); cnt = pstmt.executeUpdate() ;
		 */
		
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
	
	/*
	 * public Tour getDataByPk(int no) { Tour bean = new Tour(no, "hong", "abc123",
	 * "jsp 프로그래밍", "잼있어요", 10,"2023/08/20", 0);
	 * 
	 * return bean; }
	 * 
	 * public List<Tour> getDataList(){ List<Tour> datalist = new ArrayList<Tour>();
	 * 
	 * datalist.add(new Tour(10, "hong", "abc123", "jsp 프로그래밍", "잼있어요",
	 * 10,"2023/08/20", 0)); datalist.add(new Tour(20, "hong", "abc123", "파이썬 프로그램",
	 * "잼있어요", 20,"2023/08/20", 0)); datalist.add(new Tour(30, "hong", "abc123",
	 * "database", "잼있어요", 30,"2023/08/20", 1)); datalist.add(new Tour(40, "park",
	 * "abc123", "R 프로그래밍", "잼있어요", 40,"2023/08/20", 2)); datalist.add(new Tour(50,
	 * "park", "abc123", "확률과 통계", "잼있어요", 50,"2023/08/20", 2));
	 * 
	 * return datalist ; }
	 */

	public Tour GetDataByPk(Integer no) throws Exception {
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;		
		String sql = " select * from tourist ";
		sql += " where no = ? " ;
		
		conn = super.getConnection();		
		pstmt = conn.prepareStatement(sql) ;
		pstmt.setInt(1, no); 
		
		rs = pstmt.executeQuery() ;
		
		Tour bean = null ;
		
		if(rs.next()) {
			bean = this.getBeanData(rs);
			
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
}
