package com.jeju.controller.food;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;
import com.jeju.model.bean.Food;
import com.jeju.model.dao.FoodDao;
import com.oreilly.servlet.MultipartRequest;

public class FoodUpdateController extends SuperClass{
	private final String PREFIX = "food/";
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
	
		// 상품 수정시 넘어 오는 상품 번호를 챙긴다.
		String no = request.getParameter("no");
		
		// 다오에서 no에 해당하는 데이터를 가져오고 그 가져온 데이터를 빈으로 만든다.
		FoodDao dao = new FoodDao();
		Food bean = dao.GetDataByPK(no);
		
		try {
			request.setAttribute("bean", bean);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		super.gotoPage(PREFIX + "foodUpdateForm.jsp");
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		// 오브젝트로 가져온 mr을 강등해야됨
		MultipartRequest mr = (MultipartRequest)request.getAttribute("mr");
		
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
		
		bean.setNo(mr.getParameter("no")); // 게시글 수정 시엔 게시글 번호를 반드시 챙겨야함
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
		
		int cnt = -1;
		try {
			cnt = dao.UpdateData(bean);
			
			if(cnt == -1) {
				// 등록 실패
				super.gotoPage(PREFIX + "prUpdateForm.jsp");
				
			} else {
				/*
				 * // 등록 성공 String message = "성공적으로 상품이 수정되었습니다.";
				 * super.setPostiveAlertMessage(message);
				 */
				
				super.gotoPage(PREFIX + "foodMain.jsp");
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
				
	}
}
