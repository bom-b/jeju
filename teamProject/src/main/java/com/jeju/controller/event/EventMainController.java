package com.jeju.controller.event;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;
import com.jeju.model.bean.Event;
import com.jeju.model.dao.EventDao;

public class EventMainController extends SuperClass {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);

		EventDao dao = new EventDao();
		try {
			List<Event> eventList = dao.selectEventAll();
			request.setAttribute("eventList", eventList);
			super.gotoPage("/event/eventMain.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
