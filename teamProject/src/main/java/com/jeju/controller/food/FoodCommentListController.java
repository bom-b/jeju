package com.jeju.controller.food;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.jeju.controller.SuperClass;
import com.jeju.model.bean.FoodComment;
import com.jeju.model.dao.FoodCommentDao;

public class FoodCommentListController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		int boardno = Integer.parseInt(request.getParameter("boardno")) ;
		
		FoodCommentDao dao = new FoodCommentDao();
		List<FoodComment> comments = null ; 
		
		try {
			comments = dao.GetDataByPk(boardno) ;
			System.out.println("맛집 " + boardno + "번글에 대한 댓글 갯수 : " + comments.size());
			
			JSONArray jsArr = new JSONArray() ;
			
			for(FoodComment comm : comments) {
				JSONObject obj = new JSONObject() ;
				
				obj.put("cno", comm.getCno());
				obj.put("id", comm.getId());
				obj.put("content", comm.getContent());
				obj.put("regdate", comm.getRegdate());
				
				jsArr.add(obj) ;
			}
			
			System.out.println("jsArr.toString() 결과 보기");
			System.out.println(jsArr.toString());
			
			request.setAttribute("jsArr", jsArr);
			
			super.gotoPage("food/fdcmList.jsp");
		} catch (Exception e) { 
			e.printStackTrace();
		}
	}
}
