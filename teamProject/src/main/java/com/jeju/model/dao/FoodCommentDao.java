package com.jeju.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.jeju.model.bean.FoodComment;

public class FoodCommentDao extends SuperDao {

	// 해당 게시물 번호에 달려 있는 댓글 목록을 정렬 시켜 반환해 줍니다.
	public List<FoodComment> GetDataByPk(int boardno) throws Exception {
		String sql = " select * from comments " ;
		sql += " where BOARDNO = ? and CATEGORY = 'fd' order by cno asc " ;
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;

		conn = super.getConnection() ;
		pstmt = conn.prepareStatement(sql) ;
		pstmt.setInt(1, boardno);
		
		rs = pstmt.executeQuery() ;
		
		List<FoodComment> lists = new ArrayList<FoodComment>();
		
		while(rs.next()) {
			lists.add(GetBeanData(rs));
		}
		
		if(rs!=null) {rs.close();}
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}
		
		return lists;
	}
	
	private FoodComment GetBeanData(ResultSet rs) throws Exception{
		FoodComment bean = new FoodComment() ;
		
		bean.setCno(rs.getInt("cno"));
		bean.setId(rs.getString("id"));
		bean.setBoardno(rs.getInt("boardno"));
		bean.setCategory(rs.getString("category"));
		bean.setContent(rs.getString("content"));
		bean.setRegdate(rs.getString("regdate"));

		
		return bean;
	}


}
