package com.jeju.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.model.bean.Event;
import com.jeju.model.bean.Food;
import com.jeju.model.bean.Member;
import com.jeju.model.bean.Tour;
import com.jeju.model.bean.freeBoard;
import com.jeju.model.dao.HomeDao;
import com.jeju.model.dao.MemberDao;
import com.jeju.model.dao.freeBoardDao;

public class HomeController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		HomeDao homeDao = new HomeDao();
				
		try {
			// 이벤트 탑 3 받아오기
			List<Event> eventList = homeDao.selectEvent();
			request.setAttribute("eventList", eventList);
			
			// 맛집 탑 4 받아오기
			List<Food> foodList = homeDao.selectFood();
			request.setAttribute("foodList", foodList);
			
			// 관광지 탑 4 받아오기
			List<Tour> tourList = homeDao.selectTour();
			request.setAttribute("tourList", tourList);
			
			// 자유게시판 탑 4 받아오기
			List<freeBoard> freeList = homeDao.selectFree();
			request.setAttribute("freeList", freeList);
			
			// 멤버 탑 10 받아오기
			List<Member> memberList = homeDao.selectMember();
			request.setAttribute("memberList", memberList);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		super.gotoPage("/common/home.jsp");
	}
}
