package com.jeju.controller.free;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;
import com.jeju.model.bean.freeBoard;
import com.jeju.model.dao.freeBoardDao;

public class freeUpdateController extends SuperClass {
	private final String PREFIX = "free/";

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);

		// 수정할 게시물 번호를 우선 챙깁니다.
		Integer ono = Integer.parseInt(request.getParameter("ono"));

		freeBoardDao dao = new freeBoardDao();
		freeBoard bean = dao.GetDataByPk(ono);
		request.setAttribute("bean", bean);

		super.gotoPage(PREFIX + "freeUpdate.jsp");
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);

		freeBoard bean = new freeBoard();
		
		  bean.setOno(Integer.parseInt(request.getParameter("ono")));
		  bean.setId(request.getParameter("id"));
		  bean.setOname(request.getParameter("oname"));
		  bean.setOcontent(request.getParameter("ocontent"));
		  bean.setOregdate(request.getParameter("oregdate"));
		  bean.setOimage1(request.getParameter("oimage1"));
		  bean.setOimage2(request.getParameter("oimage2"));
		  bean.setOimage3(request.getParameter("oimage3"));
		  bean.setOimage4(request.getParameter("oimage4"));
		  bean.setOimage5(request.getParameter("oimage5"));
		  
		//  bean.setGroupno(Integer.parseInt(request.getParameter("groupno"))); 
		// bean.setOrderno(Integer.parseInt(request.getParameter("orderno"))); 
		//  bean.setDepth(Integer.parseInt(request.getParameter("depth")));
		
		freeBoardDao dao = new freeBoardDao();
		int cnt = -1;
		try {
			cnt = dao.UpdateData(bean);

			if (cnt == -1) { // 등록 실패
				new freeUpdateController().doGet(request, response);

			} else { // 성공
				// 게시물 목록 보기 페이지로 이동합니다.
				// 현재 진행 중인 페이지로 이동하기 위하여 페이징 관련 파라미터도 넘겨 주어야 합니다.
				String gotopage = super.getUrlInfomation("frMain");
				gotopage += "&pageNumber=" + request.getParameter("pageNumber");
				gotopage += "&pageSize=" + request.getParameter("pageSize");
				gotopage += "&mode=" + request.getParameter("mode");
				gotopage += "&keyword=" + request.getParameter("keyword");
				response.sendRedirect(gotopage);

				// 이전 코딩 방식

			}

		} catch (Exception e) {
			e.printStackTrace();
			new freeUpdateController().doGet(request, response);
		}
	}
}