package com.jeju.controller.free;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;
import com.jeju.controller.food.FoodMainController;
import com.jeju.model.dao.freeBoardDao;

public class freeDeleteController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		int ono = Integer.parseInt(request.getParameter("ono"));
		
		freeBoardDao dao = new freeBoardDao();
		int cnt = -1;
		
		try {
			cnt = dao.DeleteDate(ono);
			new FoodMainController().doGet(request, response); 
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		   // 삭제성공
		new freeBoardMainController().doGet(request, response);
	}


}
