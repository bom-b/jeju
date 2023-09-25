package com.jeju.controller.tour;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;

public class TourListController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		super.gotoPage("/tour/tourMain.jsp");
		// Categories 테이블에서 상품 카테고리 목록을 읽어서 request에 바인딩합니다.
		
	}
}
