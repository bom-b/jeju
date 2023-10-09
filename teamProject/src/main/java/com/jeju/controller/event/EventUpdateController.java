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
			System.out.println("=========bean content: " + bean.getEcontent());
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
			if (cnt == -1) {
				super.gotoPage("/event/evUpdate.jsp");
			} else {
				String gotopage = super.getUrlInfomation("evMain") ;
				gotopage += "&pageNumber=" + mr.getParameter("pageNumber");
				gotopage += "&pageSize=" + mr.getParameter("pageSize");
				gotopage += "&mode=" + mr.getParameter("mode");
				gotopage += "&keyword=" + mr.getParameter("keyword");
				response.sendRedirect(gotopage); 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
