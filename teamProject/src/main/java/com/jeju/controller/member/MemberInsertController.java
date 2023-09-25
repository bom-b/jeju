package com.jeju.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;
import com.jeju.model.bean.Member;
import com.jeju.model.dao.MemberDao;

// 회원 가입을 위한 컨트롤러 입니다.
public class MemberInsertController extends SuperClass {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		super.gotoPage("/member/meInsertForm.jsp");		
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		Member bean = new Member();
		
		bean.setId(request.getParameter("id"));
		bean.setPassword(request.getParameter("password"));
		bean.setName(request.getParameter("name"));
		bean.setGender(request.getParameter("gender"));
		bean.setMquestion(request.getParameter("mquestion"));
		bean.setManswer(request.getParameter("manswer"));
		bean.setMphoneno(Integer.parseInt(request.getParameter("mphoneno")));
		//bean.setMrating(request.getParameter("mrating"));
		bean.setBirth(request.getParameter("birth"));
		//bean.setRatingimg(request.getParameter("ratingimg"));
		
		MemberDao dao = new MemberDao() ;
		int cnt = -1 ;
		try {
			cnt = dao.InsertData(bean) ;
			if(cnt == -1) { // 가입 실패
				new MemberInsertController().doGet(request, response);
				
			}else { // 가입 성공
				new MemberLoginController().doPost(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			new MemberInsertController().doGet(request, response);
		}
	}
}