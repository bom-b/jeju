package com.jeju.controller.tour;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;
import com.jeju.model.dao.TourDao;

public class TourDeleteController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		super.doGet(request, response);
		
		String tno = String.valueOf(request.getParameter("tno"));
		
		TourDao dao = new TourDao();
		int cnt = -1;
		
		try {
			cnt = dao.DeleteDate(tno);
			new TourMainController().doGet(request, response); 
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}
}
