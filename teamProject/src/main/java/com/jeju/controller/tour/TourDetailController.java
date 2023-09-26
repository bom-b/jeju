package com.jeju.controller.tour;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;
import com.jeju.model.bean.Tour;
import com.jeju.model.dao.TourDao;

public class TourDetailController extends SuperClass{
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		super.doGet(request, response);
		
		String tno = request.getParameter("tno");
		TourDao dao = new TourDao();
		Tour bean = null;
		
		try {
			bean = dao.GetDataByPk(tno);
			
			if(bean == null) {
				super.setAlertMessage("잘못된 게시글 정보 입니다.");
				super.gotoPage("tour/tourMain.jsp");
			} else {
				request.setAttribute("bean", bean);
				super.gotoPage("/tour/tourDetail.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
