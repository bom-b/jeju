package com.jeju.controller.food;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;
import com.jeju.model.dao.FoodDao;

public class FoodDeleteController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		super.doGet(request, response);
		
		String no = String.valueOf(request.getParameter("no"));
		
		FoodDao dao = new FoodDao();
		int cnt = -1;
		
		try {
			cnt = dao.DeleteDate(no);
			new FoodMainController().doGet(request, response); 
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}
}
