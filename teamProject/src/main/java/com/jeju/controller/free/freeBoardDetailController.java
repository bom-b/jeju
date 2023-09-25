package com.jeju.controller.free;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;
import com.jeju.model.bean.freeBoard;
import com.jeju.model.dao.freeBoardDao;


public class freeBoardDetailController extends SuperClass{
@Override
public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
	// TODO Auto-generated method stub
	super.doGet(request, response);
	
	Integer ono = Integer.parseInt(request.getParameter("ono"));
	freeBoardDao dao = new freeBoardDao() ;
	freeBoard bean = null ;
	
	try {
		bean = dao.getDataByPrimaryKey(ono);
		
		if(bean == null) {
			super.setAlertMessage("잘못된 게시물 번호입니다.");
			super.gotoPage("common/home.jsp"); 
		}else {
			request.setAttribute("bean", bean) ;
			super.gotoPage("free/freeDetail.jsp"); 
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
}
}
