package com.jeju.controller.event;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;
import com.jeju.model.bean.Event;
import com.jeju.model.dao.EventDao;
import com.jeju.utility.Paging;

public class EventMainController extends SuperClass {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);

		EventDao dao = new EventDao();
		String pageNumber = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
		String confirmDate = request.getParameter("confirmDate");
		String mode = request.getParameter("mode");
		String keyword = request.getParameter("keyword");
		// 전체,진행중,종료
		String dayConfirm = "";

		try {
			int totalCount = dao.GetTotalRecordCount(mode, keyword); // 수정 예정
			List<Event> eventList = new ArrayList<>();
			// 전체, 진행중, 종료
			String url = super.getUrlInfomation("evMain");
			boolean isGrid = false;
			Paging pageInfo = new Paging(pageNumber, pageSize, totalCount, url, mode, keyword, isGrid);
			
			if (confirmDate.equals("allDate")) {
				dayConfirm = "allDate";
				eventList = dao.selectEventAll(dayConfirm,pageInfo);

			} else if (confirmDate.equals("presentDate")) {
				dayConfirm = "presentDate";
				eventList = dao.selectEventAll(dayConfirm,pageInfo);

			} else if (confirmDate.equals("passDate")) {
				dayConfirm = "passDate";
				eventList = dao.selectEventAll(dayConfirm,pageInfo);
			}else if(confirmDate.equals("futureDate")) {
				dayConfirm="futureDate";
				eventList = dao.selectEventAll(dayConfirm,pageInfo);
			}
			
			
		//검색
			//eventList = dao.selectPageAll(pageInfo);
			

			request.setAttribute("eventList", eventList);

			// 페이징 관련 정보를 바인딩
			request.setAttribute("pageInfo", pageInfo);

			// 검색
			super.gotoPage("/event/eventMain.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
