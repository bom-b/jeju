package com.jeju.controller.food;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.jeju.controller.SuperClass;
import com.jeju.controller.tour.TourListController;
import com.jeju.model.bean.Food;
import com.jeju.model.dao.FoodDao;
import com.oreilly.servlet.MultipartRequest;

public class FoodInsertController extends SuperClass {
	
	private final String PREFIX = "food/";
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		// 로그인한 유저 id 받아오기
		String id = String.valueOf(request.getParameter("id"));
		
		// 만약 로그인을 하지 않았을 경우
		if (id == null || id == "") {
			String message = "게시글을 작성 하시려면 로그인이 필요합니다.";
			this.setAlertMessage(message);
			new FoodMainController().doGet(request, response);
			return;
		}
		
		
		super.gotoPage(PREFIX + "foodInsertForm.jsp");
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		MultipartRequest mr = (MultipartRequest)request.getAttribute("mr") ;
		
		// 만약 로그인을 하지 않았을 경우
		String id = mr.getParameter("id");
		
		if (id == null || id == "") {
			String message = "게시글을 작성 하시려면 로그인이 필요합니다.";
			this.setAlertMessage(message);
			super.gotoPage(PREFIX + "foodMain.jsp");
			return;
		}
		
		Food bean = new Food();
		
		// 카테고리 한국어로 다시 변환
		String koname = "";
		String enname = mr.getParameter("category"); 

		if (enname.equals("ko")) {
		    koname = "한식";
		} else if (enname.equals("fo")) {
		    koname = "세계음식";
		} else if (enname.equals("ca")) {
		    koname = "카페";
		} else if (enname.equals("be")) {
		    koname = "술집";
		}
		
		bean.setId(mr.getParameter("id"));
		bean.setCategory(koname);
		bean.setTitle(mr.getParameter("title"));
		bean.setTime(mr.getParameter("time"));
		bean.setBreaktime(mr.getParameter("breaktime"));
		bean.setPhoneno(mr.getParameter("phoneno"));
		bean.setMenu(mr.getParameter("menu"));
		bean.setPlace(mr.getParameter("place"));
		bean.setImage1(mr.getFilesystemName("image1"));
		bean.setImage2(mr.getFilesystemName("image2"));
		bean.setImage3(mr.getFilesystemName("image3"));
		bean.setImage4(mr.getFilesystemName("image4"));
		bean.setImage5(mr.getFilesystemName("image5"));
		
		FoodDao dao = new FoodDao();
		int cnt = -1 ;
		
		try {
			cnt = dao.InsertData(bean) ; 
			
			if(cnt == -1) {
				
				String message = "서버 오류로 게시물이 등록되지 않았습니다.";
				super.setAlertMessage(message);
				super.gotoPage("/food/fdInsertForm.jsp");
				
			}else {
				
				new FoodMainController().doGet(request, response); 
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
				
	}
}
