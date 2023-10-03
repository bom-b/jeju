package com.jeju.controller.event;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;
import com.jeju.model.bean.Event;
import com.jeju.model.dao.EventDao;

public class EventInsertController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		super.gotoPage("event/evInsert.jsp");
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);

		Event bean = new Event();
		bean.setEname(request.getParameter("ename"));
		bean.setStartdate(request.getParameter("startdate"));
		bean.setEnddate(request.getParameter("enddate"));
		bean.setEphoneno(request.getParameter("ephoneno"));
		bean.setEplace(request.getParameter("eplace"));
		bean.setEcontent(request.getParameter("econtent"));

		EventDao dao = new EventDao();
		int cnt = -1;
		try {
			cnt = dao.insertData(bean);
			if (cnt == -1) {
				new EventInsertController().doGet(request, response);
			} else {
				new EventMainController().doGet(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
