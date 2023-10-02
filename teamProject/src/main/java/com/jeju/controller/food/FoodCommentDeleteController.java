package com.jeju.controller.food;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;
import com.jeju.model.dao.FoodCommentDao;

public class FoodCommentDeleteController extends SuperClass {
	@Override // 지정한 댓글 번호를 사용하여 나의 댓글을 삭제합니다.
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		super.doGet(request, response);
		
		int cno = Integer.parseInt(request.getParameter("cno")) ;
		FoodCommentDao dao = new FoodCommentDao() ;
		int cnt = -1;
		
		try {
			cnt = dao.DeleteData(cno) ;
			
			new FoodDetailController().doGet(request, response); 
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
}
