package com.jeju.controller.tour;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;
import com.jeju.model.bean.TourComment;
import com.jeju.model.dao.TourCommentDao;

public class TourCommentInsertController extends SuperClass {
	@Override // 부모 글번호에 대하여 로그인 한 사람이 댓글을 작성하는 로직입니다.
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		super.doPost(request, response);
		
		TourComment bean = new TourComment() ;
		bean.setBoardno(Integer.parseInt(request.getParameter("tno"))); // 부모(게시물) 글번호
		bean.setContent(request.getParameter("content")); // 내가 작성한 댓글 내용
		bean.setId(request.getParameter("id")); // 나의 아이디
		TourCommentDao dao = new TourCommentDao() ;
		int cnt = -1 ; 
		
		try {
			cnt = dao.InsertData(bean) ;
			
			new TourDetailController().doGet(request, response); 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
