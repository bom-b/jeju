package com.jeju.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import com.jeju.model.bean.FreeComment;

public class freeCommentDao  extends SuperDao{
	// 해당 게시물 번호에 달려 있는 댓글 목록을 정렬 시켜 반환해 줍니다.
	public List<FreeComment> GetDataByPk(int boardno) throws Exception {
		String sql = " select * from comments " ;
		sql += " where BOARDNO = ? and CATEGORY = 'free' order by cno asc " ;
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;

		conn = super.getConnection() ;
		pstmt = conn.prepareStatement(sql) ;
		pstmt.setInt(1, boardno);
		
		rs = pstmt.executeQuery() ;
		
		List<FreeComment> lists = new ArrayList<FreeComment>();
		
		while(rs.next()) {
			lists.add(GetBeanData(rs));
		}
		
		if(rs!=null) {rs.close();}
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}
		
		return lists;
	}
	
	private FreeComment GetBeanData(ResultSet rs) throws Exception{
		FreeComment bean = new FreeComment() ;
		
		bean.setCno(rs.getInt("cno"));
		bean.setId(rs.getString("id"));
		bean.setBoardno(rs.getInt("boardno"));
		bean.setCategory(rs.getString("category"));
		bean.setContent(rs.getString("content"));
		bean.setRegdate(rs.getString("regdate"));

		
		return bean;
	}

	// 넘겨진 댓글 정보를 데이터 베이스에 추가합니다.
	public int InsertData(FreeComment bean) throws Exception {
		
		int cnt = -1 ;
		
		String sql = " insert into comments (cno, id, boardno, category, content, regdate) " ;
		sql += " values(seqcomment.nextval, ?, ?, 'free', ?, sysdate) " ; // 'food' 대신 게시판별로 카테고리 입력
		
		PreparedStatement pstmt = null ;
		
		conn = super.getConnection() ;
		conn.setAutoCommit(false);
		
		pstmt = conn.prepareStatement(sql) ;
		
		pstmt.setString(1, bean.getId());
		pstmt.setInt(2, bean.getBoardno());
		pstmt.setString(3, bean.getContent());		
		
		cnt = pstmt.executeUpdate() ; 
		conn.commit();
		
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return cnt ;
	}

	// 댓글 번호 cno을 삭제합니다.	
	public int DeleteData(int cno) throws Exception {
		PreparedStatement pstmt = null ;
		String sql = " delete from comments where cno = ? " ;
		
		conn = super.getConnection() ;
		conn.setAutoCommit(false);
		
		pstmt = conn.prepareStatement(sql) ;
				
		int cnt = -1 ;
		pstmt.setInt(1, cno);
		
		cnt = pstmt.executeUpdate() ;
		conn.commit();
		
		if(pstmt!=null){pstmt.close();}
		if(conn!=null){conn.close();}
		
		return cnt ;
	}
}
