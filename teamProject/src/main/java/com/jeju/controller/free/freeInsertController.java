package com.jeju.controller.free;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;
import com.jeju.model.bean.freeBoard;
import com.jeju.model.dao.freeBoardDao;
import com.oreilly.servlet.MultipartRequest;

public class freeInsertController extends SuperClass{
	private final String PREFIX = "free/" ;
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doGet(request, response);
		

		// 로그인한 유저 id 받아오기
		String id = String.valueOf(request.getParameter("id"));
		
		// 만약 로그인을 하지 않았을 경우
		if (id == null || id == "") {
			String message = "게시글을 작성 하시려면 로그인이 필요합니다.";
			this.setAlertMessage(message);
			super.gotoPage(PREFIX + "freeMain.jsp");
			return;
		}
		
		
		super.gotoPage(PREFIX + "freeInsert.jsp");	
	}
@Override
public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
	super.doPost(request, response);

		MultipartRequest mr = (MultipartRequest)request.getAttribute("mr") ;
	
		    // 만약 로그인을 하지 않았을 경우
		    String id = mr.getParameter("id");
		    
		    if (id == null || id.trim().equals("")) {
		    	String message = "게시글을 작성 하시려면 로그인이 필요합니다.";
		    	this.setAlertMessage(message);
		    	new freeInsertController().doGet(request, response);
		    	return;
		    }
	
		

		freeBoard bean = new freeBoard();
	
		bean.setId(mr.getParameter("id"));
		bean.setOname(mr.getParameter("oname"));
		bean.setPcategory(mr.getParameter("pcategory"));
		bean.setOcontent(mr.getParameter("ocontent"));
		bean.setOregdate(mr.getParameter("oregdate"));
		bean.setOimage1(mr.getFilesystemName("oimage1"));
		bean.setOimage2(mr.getFilesystemName("oimage2"));
		bean.setOimage3(mr.getFilesystemName("oimage3"));
		bean.setOimage4(mr.getFilesystemName("oimage4"));
		bean.setOimage5(mr.getFilesystemName("oimage5"));
		
		
		
		freeBoardDao dao = new freeBoardDao();
		int cnt = 1 ;
		try {
			cnt = dao.InsertData(bean);
			
			if(cnt == -1 ) { //등록 실패
				String message = "서버 오류로 게시물이 등록되지 않았습니다.";
				super.setAlertMessage(message);
			super.gotoPage("/free/freeDetail.jsp");
			}else {//성공
				new freeBoardMainController().doGet(request, response);
			}
		} catch (Exception e) { 
			e.printStackTrace();
			
		}
	}
	

}