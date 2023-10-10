package com.jeju.controller.event;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;
import com.jeju.model.bean.Event;
import com.jeju.model.dao.EventDao;
import com.oreilly.servlet.MultipartRequest;

public class EventInsertController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		super.gotoPage("event/evInsert.jsp");
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
	
		MultipartRequest mr = (MultipartRequest)request.getAttribute("mr");
		Event bean = new Event();
//		String evsection = mr.getParameter("evsection");
		
		bean.setEname(mr.getParameter("ename"));
		bean.setStartdate(mr.getParameter("startdate"));
		bean.setEnddate(mr.getParameter("enddate"));
		bean.setEphoneno(mr.getParameter("ephoneno"));
		bean.setEimage1(mr.getFilesystemName("eimage1"));
		bean.setEimage2(mr.getFilesystemName("eimage2"));
		bean.setEimage3(mr.getFilesystemName("eimage3"));
		bean.setEimage4(mr.getFilesystemName("eimage4"));
		bean.setEimage5(mr.getFilesystemName("eimage5"));
		bean.setEplace(mr.getParameter("eplace"));
		bean.setEcontent(mr.getParameter("econtent"));
		bean.setEvsection(mr.getParameter("evsection"));
		EventDao dao = new EventDao();
		int cnt = -1;
		try {
			cnt=dao.insertData(bean);
			if (cnt == -1) {
				super.gotoPage("event/evInsert.jsp");
			} else {
				//response.sendRedirect("jeju?command=evMain&confirmDate=allDate");
				response.sendRedirect("jeju?command=evMain");
//				 new EventMainController().doGet(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}