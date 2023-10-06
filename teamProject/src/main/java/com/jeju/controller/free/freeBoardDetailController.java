package com.jeju.controller.free;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;
import com.jeju.controller.food.FoodMainController;
import com.jeju.model.bean.Member;
import com.jeju.model.bean.freeBoard;
import com.jeju.model.dao.MemberDao;
import com.jeju.model.dao.freeBoardDao;

public class freeBoardDetailController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {

		super.doGet(request, response);

		String ono = request.getParameter("ono");
		freeBoardDao dao = new freeBoardDao();
		freeBoard bean = null;

		try {
			bean = dao.getDataByPrimaryKey(ono);

			if (bean == null) {
				super.setAlertMessage("잘못된 게시물 번호입니다.");
				new freeBoardMainController().doGet(request, response);
			} else {
				// 게시글 작성자의 id 가져오기
				String writerId = bean.getId(); // 여기서 작성자의 id를 가져온다

				MemberDao dao2 = new MemberDao();
				Member bean2 = dao2.getDataByPrimaryKey(writerId); // 작성자의 id를 이용하여 회원 정보 가져온다

				request.setAttribute("bean", bean);
				request.setAttribute("bean2", bean2); // 게시글 작성자 정보를 request에 추가
				super.gotoPage("/free/freeDetail.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}