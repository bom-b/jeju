package com.jeju.controller.tour;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;

public class TourMainController extends SuperClass{
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		super.doGet(request, response);
		super.gotoPage("/tour/tourMain.jsp");
	}
}
