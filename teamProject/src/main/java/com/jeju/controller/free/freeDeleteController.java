package com.jeju.controller.free;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;
import com.jeju.model.dao.freeBoardDao;

public class freeDeleteController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int ono = Integer.parseInt(request.getParameter("ono"));
		
		freeBoardDao dao = new freeBoardDao();
		int result = dao.deleteFree(ono);
		
		if(result == 1 ) {
			request.setAttribute("message", "게시물이 삭제되었습니다.");
		}else {
			request.setAttribute("message", "게시물이 삭제 실패하였습니다..");
		}
		
		super.gotoPage("free/freeBoardMain.jsp");
		
		super.doGet(request, response);
	}


}
