package com.jeju.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;
import com.jeju.model.bean.Member;
import com.jeju.model.dao.MemberDao;

public class MemberViewController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		super.doGet(request, response);
		
		String id = String.valueOf(request.getParameter("id"));
        MemberDao dao = new MemberDao();
        Member bean = dao.getDataByPrimaryKey(id);
		
		try {
			bean = dao.getDataByPrimaryKey(id);
			
			if(bean == null) {
				super.setAlertMessage("잘못된 회원 정보입니다.");
				super.gotoPage("/common/home.jsp"); 
			}else {
				request.setAttribute("bean", bean) ;
				super.gotoPage("/member/meView.jsp"); 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
