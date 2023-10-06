package com.jeju.controller.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;
import com.jeju.model.bean.Food;
import com.jeju.model.bean.Member;
import com.jeju.model.bean.Tour;
import com.jeju.model.bean.freeBoard;
import com.jeju.model.dao.HomeDao;
import com.jeju.model.dao.MemberDao;

public class MemberViewController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		super.doGet(request, response);
		
		String id = String.valueOf(request.getParameter("id"));
        MemberDao dao = new MemberDao();
        Member bean = dao.getDataByPrimaryKey(id);
		
        HomeDao homeDao = new HomeDao();
        
		try {
			// 멤버 정보 받아오기
			bean = dao.getDataByPrimaryKey(id);
			
			// 맛집 게시물 받아오기
			List<Food> foodList = homeDao.membersFood(id);
			List<Tour> tourList = homeDao.membersTour(id);
			List<freeBoard> freeList = homeDao.membersFree(id);
			
			// 길이 확인용 받아오기
			int foodLength = homeDao.membersFoodLength(id);
			int tourLength = homeDao.membersTourLength(id);
			int freeLength = homeDao.membersFreeLength(id);
			
			int totalLength = foodLength + tourLength + freeLength;
			
			if(bean == null) {
				super.setAlertMessage("잘못된 회원 정보입니다.");
				super.gotoPage("/common/home.jsp"); 
			}else {
				request.setAttribute("bean", bean) ;
				request.setAttribute("foodList", foodList);
				request.setAttribute("tourList", tourList);
				request.setAttribute("freeList", freeList);
				request.setAttribute("totalLength", totalLength);
			
				super.gotoPage("/member/meView.jsp"); 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
