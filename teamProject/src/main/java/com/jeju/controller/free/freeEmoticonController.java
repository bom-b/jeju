package com.jeju.controller.free;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;
import com.jeju.controller.food.FoodDetailController;
import com.jeju.model.dao.FoodDao;
import com.jeju.model.dao.freeBoardDao;



public class freeEmoticonController extends SuperClass{
	@Override // 해당 이모티콘의 값을 +1 증가시킵니다.
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		super.doGet(request, response);
		
		
		int cnt = -1;
		
		// 게시글의 번호 받아오기
		// 저는 게시글 no를 string으로 세팅해서 int로 변경해주시면 될것같습니다.
		String ono = String.valueOf(request.getParameter("ono"));
		// 로그인한 유저 id 받아오기
		String id = String.valueOf(request.getParameter("id"));
		// 게시글을 작성한 유저 id 받아오기
		String writer = String.valueOf(request.getParameter("writer"));
		
		// 만약 로그인을 하지 않았을 경우
		if (id == null || id == "") {
			String message = "추천을 하시려면 로그인이 필요합니다.";
			this.setAlertMessage(message);
			new freeBoardDetailController().doGet(request, response);
			return;
		}
		
		// 만약 로그인을한 사람이 작성자 본인인 경우
		if (id.equals(writer)) {
			String message = "자신의 게시물은 추천할 수 없습니다.";
			this.setAlertMessage(message);
			new freeBoardDetailController().doGet(request, response);
			return;
		}
		
		freeBoardDao dao = new freeBoardDao();
		
		try {
			// CheckLikes : 유저가 추천을 눌렀는지 확인하고 int를 반환하는 메소드
			int count = 0;
			
			count = dao.CheckLikes(ono, id);
			
			if (count == 1) {
				// 해당 유저가 추천을 누르지 않았을 경우
				// UpdateLikes : 해당 게시물의 추천수를 올리고 테이블에 기록하는 메소드
				cnt = dao.UpdateEmoticon(ono, id);
				new freeBoardDetailController().doGet(request, response);
				
			} else if (count == -1) {
				// 해당 유저가 이미 추천을 눌렀을 경우
				String message = "이미 추천을 하셨습니다.";
				this.setAlertMessage(message);
				new freeBoardDetailController().doGet(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
