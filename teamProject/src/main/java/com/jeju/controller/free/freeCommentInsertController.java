package com.jeju.controller.free;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;
import com.jeju.model.bean.FreeComment;
import com.jeju.model.dao.freeCommentDao;


public class freeCommentInsertController extends SuperClass{
@Override
public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
	// TODO Auto-generated method stub
	super.doPost(request, response);
	
	FreeComment bean = new FreeComment();
	bean.setBoardno(Integer.parseInt(request.getParameter("ono"))); // 부모(게시물) 글번호
	bean.setContent(request.getParameter("content")); // 내가 작성한 댓글 내용
	bean.setId(request.getParameter("id")); // 나의 아이디
	freeCommentDao dao = new freeCommentDao();
	int cnt= -1;
	
	try {
		cnt = dao.InsertData(bean);
		
		new freeBoardDetailController().doGet(request, response);
	} catch (Exception e) {
		e.printStackTrace();
	}
}

}
