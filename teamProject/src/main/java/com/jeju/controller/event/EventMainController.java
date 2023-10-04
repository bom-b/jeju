package com.jeju.controller.event;

import java.util.ArrayList;
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
		String confirmDate = request.getParameter("confirmDate");
		String search = request.getParameter("search");
		String keyword = request.getParameter("keyword");
		//전체,진행중,종료 
		String dayConfirm = "";
	
		try {
			List<Event> eventList = new ArrayList<>();
			//전체, 진행중, 종료
		
				if (confirmDate.equals("allDate")) {
					dayConfirm = "allDate";
					eventList = dao.selectEventAll(dayConfirm);
				
				}else if(confirmDate.equals("presentDate")) {
					dayConfirm="presentDate";
					eventList = dao.selectEventAll(dayConfirm);
					
				}else if(confirmDate.equals("passDate")) {
					dayConfirm = "passDate";
					eventList = dao.selectEventAll(dayConfirm);
				}
			
				
			request.setAttribute("eventList", eventList);

			
				
			
			//검색
			super.gotoPage("/event/eventMain.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
