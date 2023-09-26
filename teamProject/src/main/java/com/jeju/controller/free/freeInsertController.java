package com.jeju.controller.free;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;
import com.jeju.model.bean.freeBoard;
import com.jeju.model.dao.freeBoardDao;

public class freeInsertController extends SuperClass{
	private final String PREFIX = "free/" ;
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doGet(request, response);
		super.gotoPage(PREFIX + "freeInsert.jsp");	
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doPost(request, response);
		
		freeBoard bean = new freeBoard();
		bean.setId(request.getParameter("id"));
		bean.setPcategory(request.getParameter("pcategory"));
		bean.setOcontent(request.getParameter("ocontent"));
		bean.setOname(request.getParameter("oname"));
		bean.setOregdate(request.getParameter("oregdate"));
		bean.setOimage1(request.getParameter("oimage1"));
		bean.setOimage2(request.getParameter("oimage2"));
		bean.setOimage3(request.getParameter("oimage3"));
		bean.setOimage4(request.getParameter("oimage4"));
		bean.setOimage5(request.getParameter("oimage5"));
		
		freeBoardDao dao = new freeBoardDao();
		int cnt = 1 ;
		try {
			cnt = dao.InsertData(bean);
			
			if(cnt == -1 ) { //등록 실패
				new freeInsertController().doGet(request, response);
			}else {//성공
				super.gotoPage( PREFIX+"freeBoardMain.jsp");
			}
		} catch (Exception e) { 
			e.printStackTrace();
			new freeInsertController().doGet(request, response);
		}
	}
	

}