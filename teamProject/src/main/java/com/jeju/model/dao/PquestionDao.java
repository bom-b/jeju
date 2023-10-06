package com.jeju.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.jeju.model.bean.Pquestion;

public class PquestionDao extends SuperDao{
	// 해당 조건에 충족하는 카테고리 목록들을 반환해 줍니다.
		public List<Pquestion> GetPquestionList(String module, String type) throws Exception{
			PreparedStatement pstmt = null ;
			ResultSet rs = null ;
			String sql = " select * from pquestion" ;
			sql += " where module = ? and type = ? " ;
			sql += " order by qnum asc " ;
			
			conn = super.getConnection() ;
			
			pstmt = conn.prepareStatement(sql) ;		
			pstmt.setString(1, module);
			pstmt.setString(2, type);
			
			rs = pstmt.executeQuery() ; 
			
			List<Pquestion> lists = new ArrayList<Pquestion>() ;
			
			while(rs.next()) {
				lists.add(getBeanData(rs)) ;
			}
			
			if(rs!=null){rs.close();}
			if(pstmt!=null){pstmt.close();}
			if(conn!=null){conn.close();}
			
			return lists ;
		}
	private Pquestion getBeanData(ResultSet rs) throws Exception{
		Pquestion bean = new Pquestion() ;
		
		bean.setQuestion(rs.getString("question"));
		bean.setModule(rs.getString("module"));
		bean.setType(rs.getString("type"));
		bean.setQnum(Integer.parseInt(rs.getString("qnum")));
		
		return bean ;
	}
}