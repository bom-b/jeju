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
		String mode = request.getParameter("mode");
		String keyword = request.getParameter("keyword");
//	String evSection = request.getParameter("evSection");

		// 전체,진행중,종료

		try {
			boolean isGrid = false;
			String url = super.getUrlInfomation("evMain");

			// 전체카운트
			int totalCountAll = dao.GetTotalRecordCount(mode, keyword);
			Paging pageInfoAll = new Paging(pageNumber, pageSize, totalCountAll, url, mode, keyword, isGrid);

			// 진행중 카운트
			int totalCountPR = dao.GetTotalRecordCountGubun(mode, keyword, "진행중");
			Paging pageInfoPr = new Paging(pageNumber, pageSize, totalCountPR, url, mode, keyword, isGrid);

			// 종료 카운트
			int totalCountEnd = dao.GetTotalRecordCountGubun(mode, keyword, "종료");
			Paging pageInfoEnd = new Paging(pageNumber, pageSize, totalCountEnd, url, mode, keyword, isGrid);

			// 예정중 카운트
			int totalCountFu = dao.GetTotalRecordCountGubun(mode, keyword, "예정중");
			Paging pageInfoFu = new Paging(pageNumber, pageSize, totalCountFu, url, mode, keyword, isGrid);

			// 전체
			List<Event> eventAllList = dao.selectEventAll("전체", pageInfoPr);
			request.setAttribute("eventAllList", eventAllList);

			// 진행중
			List<Event> eventPrList = dao.selectEventAll("진행중", pageInfoPr);
			request.setAttribute("eventPrList", eventPrList);

			// 종료
			List<Event> eventEndList = dao.selectEventAll("종료",pageInfoEnd);
		request.setAttribute("eventEndList", eventEndList);
	
		//예정중
		List<Event> eventFuList = dao.selectEventAll("예정중",pageInfoFu);
		request.setAttribute("eventFuList", eventFuList);

			// 페이징 정보를 바인딩
			request.setAttribute("pageInfoAll", pageInfoAll);
			request.setAttribute("pageInfoPr", pageInfoPr);
			request.setAttribute("pageInfoEnd", pageInfoEnd);
			request.setAttribute("pageInfoFu", pageInfoFu);

			// 검색
			super.gotoPage("/event/eventMain.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
