package com.jeju.controller.free;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;
import com.jeju.model.dao.freeCommentDao;

public class freeCommentDeleteController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);

		int cno = Integer.parseInt(request.getParameter("cno"));
		freeCommentDao dao = new freeCommentDao();
		int cnt = -1;

		try {
			cnt = dao.DeleteData(cno);

			new freeBoardDetailController().doGet(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
