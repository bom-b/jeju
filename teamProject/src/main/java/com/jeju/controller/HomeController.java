package com.jeju.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.model.bean.Event;
import com.jeju.model.dao.HomeDao;

public class HomeController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		// 이벤트 탑 3 받아오기
		HomeDao homeDao = new HomeDao();
		
		try {
			List<Event> eventList = homeDao.selectEvent();
			request.setAttribute("eventList", eventList);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		super.gotoPage("/home.jsp");
	}
}
