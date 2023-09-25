package com.jeju.controller.event;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;
import com.jeju.model.bean.Event;
import com.jeju.model.dao.EventDao;

public class EventDetailController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);

		Integer eno = Integer.parseInt(request.getParameter("eno"));
		EventDao dao = new EventDao();
		try {
			Event bean = dao.GetDataByPk(eno);
			request.setAttribute("eventDetail", bean);

			super.gotoPage("event/evDetail.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
