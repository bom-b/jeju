package com.jeju.controller.event;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;
import com.jeju.model.bean.Event;
import com.jeju.model.dao.EventDao;
import com.oreilly.servlet.MultipartRequest;

public class EventUpdateController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {

		super.doGet(request, response);
		// 해당하는 번호를 가져옴
		int eno = Integer.parseInt(request.getParameter("eno"));

		EventDao dao = new EventDao();
		Event bean = dao.GetDataByPk(eno);
		try {
			request.setAttribute("bean", bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
		super.gotoPage("/event/evUpdate.jsp");
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		MultipartRequest mr = (MultipartRequest) request.getAttribute("mr");
		Event bean = new Event();
		//		bean.setEcontent(clob.getSubString(1, (int) clob.length()));
		bean.setEno(super.getNumberData(mr.getParameter("eno")));
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
			cnt = dao.updateData(bean);
			if (cnt == -1) {//수정 실패 시 
				super.gotoPage("/event/evUpdate.jsp");
			} else {
//				response.sendRedirect("jeju?command=evMain");
				//메시지담을 str
				String alerMsg = "수정이 완료되었습니다.";
				request.setAttribute("alertMsg", alerMsg);
				super.gotoPage("/event/eventUpPopup.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
