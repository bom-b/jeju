package com.jeju.controller.tour;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;
import com.jeju.controller.food.FoodMainController;
import com.jeju.model.bean.Member;
import com.jeju.model.bean.Tour;
import com.jeju.model.dao.MemberDao;
import com.jeju.model.dao.TourDao;


public class TourDetailController extends SuperClass{
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {		

		super.doGet(request, response);
		
		String tno = request.getParameter("tno");
		TourDao dao = new TourDao();
		Tour bean = null;
		
		try {
			bean = dao.getDataByPrimarykey(tno);
			
			if(bean == null) {
				super.setAlertMessage("잘못된 게시글 정보 입니다.");
				new TourMainController().doGet(request, response);
			} else {
				// 게시글 작성자의 id 가져오기
				String writerId = bean.getId(); // 여기서 작성자의 id를 가져온다

				MemberDao dao2 = new MemberDao();
				Member bean2 = dao2.getDataByPrimaryKey(writerId); // 작성자의 id를 이용하여 회원 정보 가져온다
				
				if (bean2 == null) {
					super.setAlertMessage("잘못된 게시글 작성자 정보 입니다.");
					new TourMainController().doGet(request, response);
				}
				request.setAttribute("bean", bean);
				request.setAttribute("bean2", bean2); // 게시글 작성자 정보를 request에 추가
				super.gotoPage("/tour/tourDetail.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
