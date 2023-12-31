package com.jeju.controller.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;
import com.jeju.model.bean.Member;
import com.jeju.model.dao.MemberDao;
import com.jeju.utility.Paging;

public class MemberListController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		String pageNumber = request.getParameter("pageNumber") ;
		String pageSize = request.getParameter("pageSize") ;
		String mode = request.getParameter("mode") ;
		String keyword = request.getParameter("keyword") ;
		
		MemberDao dao = new MemberDao();
		try {
			int totalCount = dao.GetTotalRecordCount(); 
			String url = super.getUrlInfomation("meList") ;
			boolean isGrid = false ;
			Paging pageInfo = new Paging(pageNumber, pageSize, totalCount, url, mode, keyword, isGrid);
			
			List<Member> lists = dao.selectAll(pageInfo);
			
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("datalist", lists);
			super.gotoPage("member/meList.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
