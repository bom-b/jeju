package com.jeju.controller.free;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;
import com.jeju.model.bean.freeBoard;
import com.jeju.model.dao.freeBoardDao;
import com.oreilly.servlet.MultipartRequest;

public class freeUpdateController extends SuperClass {
	private final String PREFIX = "free/";

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);

		// 수정할 게시물 번호를 우선 챙깁니다.
		String ono = request.getParameter("ono");

		freeBoardDao dao = new freeBoardDao();
		freeBoard bean = dao.GetDataByPk(ono);

		try {
			request.setAttribute("bean", bean);

		} catch (Exception e) {
			e.printStackTrace();
		}

		super.gotoPage(PREFIX + "freeUpdate.jsp");
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		MultipartRequest mr = (MultipartRequest) request.getAttribute("mr");

		freeBoard bean = new freeBoard();

		bean.setOno(mr.getParameter("ono"));
		bean.setId(mr.getParameter("id"));
		bean.setOname(mr.getParameter("oname"));
		bean.setOcontent(mr.getParameter("ocontent"));
		bean.setPcategory(mr.getParameter("pcategory"));
		bean.setOregdate(mr.getParameter("oregdate"));
		bean.setOimage1(mr.getParameter("oimage1"));
		bean.setOimage2(mr.getParameter("oimage2"));
		bean.setOimage3(mr.getParameter("oimage3"));
		bean.setOimage4(mr.getParameter("oimage4"));
		bean.setOimage5(mr.getParameter("oimage5"));

		freeBoardDao dao = new freeBoardDao();
		int cnt = -1;
		try {
			cnt = dao.UpdateData(bean);

			if (cnt == -1) { // 등록 실패
				String message = "서버 오류로 게시물이 수정되지 않았습니다.";
				super.setAlertMessage(message);
				new freeUpdateController().doGet(request, response);

			} else { // 성공
				new freeBoardMainController().doGet(request, response);

				// 이전 코딩 방식

			}

		} catch (Exception e) {
			e.printStackTrace();
			new freeUpdateController().doGet(request, response);
		}
	}
}