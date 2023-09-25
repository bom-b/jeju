package com.jeju.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;

public class MemberMenuController extends SuperClass{
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		super.doGet(request, response);
		super.gotoPage("/member/meMenuForm.jsp");
	}
}
