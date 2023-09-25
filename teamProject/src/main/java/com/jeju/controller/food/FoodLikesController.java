package com.jeju.controller.food;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;
import com.jeju.model.dao.FoodDao;

public class FoodLikesController extends SuperClass{
	// 해당 이모티콘의 값을 +1 증가시킵니다.
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		int cnt = -1;
		
		// 게시글의 번호 받아오기
		String no = String.valueOf(request.getParameter("no"));
		// 로그인한 유저 id 받아오기
		String id = String.valueOf(request.getParameter("id"));
		
		// 만약 로그인을 하지 않았을 경우
		if (id == null) {
			String message = "추천을 하시려면 로그인이 필요합니다.";
			this.setAlertMessage(message);
			new FoodDetailController().doGet(request, response);
		}
		
		FoodDao dao = new FoodDao();
		
		try {
			// 유저가 추천을 눌렀는지 확인하고 int를 반환화는 메소드
			int count = 0;
			count = dao.CheckLikes(no, id);
			
			if (count == 1) {
				// 해당 유저가 추천을 누르지 않았을 경우
				// 해당 게시물의 추천수를 올리고 테이블에 기록하는 메소드 호출
				cnt = dao.UpdateLikes(no, id);
				new FoodDetailController().doGet(request, response);
				
			} else if (count == -1) {
				// 해당 유저가 이미 추천을 눌렀을 경우
				String message = "이미 추천을 하셨습니다.";
				this.setAlertMessage(message);
				new FoodDetailController().doGet(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
