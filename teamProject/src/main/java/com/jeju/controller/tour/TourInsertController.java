package com.jeju.controller.tour;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.jeju.controller.SuperClass;
import com.jeju.model.bean.Tour;
import com.jeju.model.dao.TourDao;
import com.oreilly.servlet.MultipartRequest;


public class TourInsertController extends SuperClass{

	private final String PREFIX = "tour/";
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		// 로그인한 유저 id 받아오기
		String id = String.valueOf(request.getParameter("id"));
				
		// 만약 로그인을 하지 않았을 경우
		if (id == null || id == "") {
			String message = "게시글을 작성 하시려면 로그인이 필요합니다.";
			this.setAlertMessage(message);
			super.gotoPage(PREFIX + "tourMain.jsp");
			return;
		}
				
				
		super.gotoPage("/tour/tourInsertForm.jsp");
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		MultipartRequest mr = (MultipartRequest)request.getAttribute("mr") ;
		
		Tour bean = new Tour() ;
		// 카테고리 한국어로 다시 변환
		String koname = "";
		String enname = mr.getParameter("tcategory"); 

		if (enname.equals("ac")) {
		    koname = "액티비티 체험";
		} else if (enname.equals("or")) {
		    koname = "오름 명소";
		} else if (enname.equals("sea")) {
		    koname = "해수욕장";
		} else if (enname.equals("te")) {
		    koname = "테마파크";
		}
		
		bean.setId(mr.getParameter("id"));
		bean.setTcategory(koname);
		bean.setTname(mr.getParameter("tname"));
		bean.setTtime(mr.getParameter("ttime"));
		bean.setTphoneno(super.getNumberData(mr.getParameter("tphoneno")));
		bean.setTprice(mr.getParameter("tprice"));
		bean.setTplace(mr.getParameter("tplace"));
		bean.setTimage1(mr.getFilesystemName("timage1"));
		bean.setTimage2(mr.getFilesystemName("timage2"));
		bean.setTimage3(mr.getFilesystemName("timage3"));
		bean.setTimage4(mr.getFilesystemName("timage4"));
		bean.setTimage5(mr.getFilesystemName("timage5"));
		
		TourDao dao = new TourDao() ;
		int cnt = -1 ;
		try {
			cnt = dao.InsertData(bean) ; 
			
			if(cnt == -1) {
				
				String message = "서버 오류로 게시물이 등록되지 않았습니다.";
				super.setAlertMessage(message);
				super.gotoPage("/tour/tourInsertForm.jsp");
				
			}else {
				
				new TourMainController().doGet(request, response); 
			
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
