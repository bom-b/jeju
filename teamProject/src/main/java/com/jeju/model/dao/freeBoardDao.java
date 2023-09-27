package com.jeju.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.jeju.model.bean.freeBoard;
import com.jeju.utility.Paging;

public class freeBoardDao extends SuperDao {
	private freeBoard getBeanData(ResultSet rs) throws Exception {
		// ResultSet 정보를 Bean으로 만들어서 반환해 줍니다.
		freeBoard bean = new freeBoard();

		bean.setOno(rs.getInt("ono"));
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

		bean.setDepth(rs.getInt("depth"));
		bean.setGroupno(rs.getInt("groupno"));
		bean.setOrderno(rs.getInt("orderno"));

		bean.setLikes(rs.getInt("likes")); // 좋아요
		bean.setHates(rs.getInt("hates")); // 싫어요

		return bean;
	}

	public freeBoard getDataByPrimaryKey(Integer ono) throws Exception {
		String sql = " select * from openforum ";
		sql += " where ono = ?";

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, ono);

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

		String sql = " select * from openForum order by ono desc";

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

	public int GetTotalRecordCount(String mode, String keyword) throws Exception {
		System.out.print("검색할 필드명 : " + mode);
		System.out.println(", 검색할 키워드 : " + keyword);

		// 테이블의 총 행개수를 구합니다.
		String sql = " select count(*) as cnt from openforum ";
		if (mode == null || mode.equals("all")) {
		} else { // 전체 모드가 아니면
			sql += " where " + mode + " like '%" + keyword + "%'";
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

	public List<freeBoard> selectAll(Paging pageInfo) throws Exception {
		// TopN 구문을 사용하여 페이징 처리된 게시물 목록을 반환합니다.
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = " select ono, id, oname, ocontent , readhit, oregdate, pcategory , oimage1, oimage2, oimage3, oimage4, oimage5, groupno, orderno, depth, likes, hates ";

		// 답글 이전 코딩 방식
		// sql += " from (select no, id, password, subject, content, readhit, oregdate,
		// remark, groupno, orderno, depth, rank() over(order by no desc) as ranking " ;

		sql += " from (select ono, id, oname, ocontent, readhit, oregdate,  pcategory ,oimage1, oimage2, oimage3, oimage4, oimage5, groupno, orderno, depth, likes, hates, rank() over(order by groupno desc, orderno asc) as ranking ";
		sql += " from openforum ";

		String mode = ((com.jeju.utility.Paging) pageInfo).getMode();
		String keyword = ((com.jeju.utility.Paging) pageInfo).getKeyword();

		if (mode == null || mode.equalsIgnoreCase("all")) {
		} else { // 전체 모드가 아니면
			sql += " where " + mode + " like '%" + keyword + "%'";
		}

		sql += " ) ";
		sql += " where ranking between ? and ? ";

		conn = super.getConnection();

		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, ((com.jeju.utility.Paging) pageInfo).getBeginRow());
		pstmt.setInt(2, ((com.jeju.utility.Paging) pageInfo).getEndRow());

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

		String sql = "INSERT INTO openforum (ono, id, oname, ocontent, oregdate, pcategory, oimage1, oimage2, oimage3, oimage4, oimage5, groupno, orderno, depth) ";
	    sql += "VALUES (seqopen.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, seqopen.currval, default, default)";
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

	public freeBoard GetDataByPk(Integer ono) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " select * from openforum ";
		sql += " where ono = ? ";

		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, ono);

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

		String sql = " update openforum set id = ?, oname = ?, ocontent = ?, oregdate = ?, pcategory = ?,oimage1 = ?,oimage2 = ?,oimage3 = ?,oimage4 = ?,oimage5 = ?, groupno = ?, orderno = ?, depth = ? ";
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
		pstmt.setInt(11, bean.getGroupno());
		pstmt.setInt(12, bean.getOrderno());
		pstmt.setInt(13, bean.getDepth());
		  pstmt.setInt(14, bean.getOno());

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

	public int UpdateEmoticon(int ono, String columnName) throws Exception {
		String sql = " update openforum set " + columnName + "=" + columnName + " + 1  ";
		sql += " where ono = ? ";
		PreparedStatement pstmt = null;

		int cnt = -1;
		conn = super.getConnection();
		conn.setAutoCommit(false);
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, ono);

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
