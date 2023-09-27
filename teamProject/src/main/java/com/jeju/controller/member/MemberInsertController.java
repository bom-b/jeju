package com.jeju.controller.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;
import com.jeju.model.bean.Member;
import com.jeju.model.dao.MemberDao;
import com.jeju.model.bean.Pquestion;
import com.jeju.model.dao.PquestionDao;

// 회원 가입을 위한 컨트롤러 입니다.
public class MemberInsertController extends SuperClass {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		// Pquestion 테이블에서 상품 카테고리 목록을 읽어서 request에 바인딩합니다.
		PquestionDao dao = new PquestionDao() ;
		List<Pquestion> lists = null ;
				
		try {
			lists = dao.GetPquestionList("members", "select") ;
			request.setAttribute("pquestion", lists); 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
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