package com.jeju.controller.event;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;
import com.jeju.model.dao.EventDao;

public class EventDeleteController extends SuperClass{
@Override
public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
	super.doGet(request, response);
	int eno = Integer.parseInt(request.getParameter("eno"));
	EventDao dao  = new EventDao();
	int cnt=-1;
	try {
		cnt = dao.deleteData(eno);
		new EventMainController().doGet(request, response);
	} catch (Exception e) {
		e.printStackTrace();
	}
}
}
