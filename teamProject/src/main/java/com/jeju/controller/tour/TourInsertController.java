package com.jeju.controller.tour;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;
import com.jeju.model.bean.Tour;
import com.jeju.model.dao.TourDao;
import com.oreilly.servlet.MultipartRequest;


public class TourInsertController extends SuperClass{


	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		super.gotoPage("/tour/trInsertForm.jsp");
		// Categories 테이블에서 상품 카테고리 목록을 읽어서 request에 바인딩합니다.
		
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		MultipartRequest mr = (MultipartRequest)request.getAttribute("mr") ;
		
		Tour bean = new Tour() ;
		// bean.setPnum(null); // 상품 번호는 시퀀스가 알아서 처리해 줌
		
		bean.setTno(mr.getParameter("tno"));
		bean.setId(mr.getParameter("id"));
		bean.setTname(mr.getParameter("tname"));
		bean.setTtime(mr.getParameter("ttime"));
		bean.setTphoneno(super.getNumberData(mr.getParameter("tphoneno")));
		bean.setTprice(mr.getParameter("tprice"));
		bean.setTplace(mr.getParameter("tplace"));
		bean.setTmap(mr.getParameter("tmap"));
		bean.setTlikes(mr.getParameter("tlikes"));
		bean.setTimage1(mr.getFilesystemName("timage1"));
		bean.setTimage2(mr.getFilesystemName("timage2"));
		bean.setTimage3(mr.getFilesystemName("timage3"));
		bean.setTimage4(mr.getFilesystemName("timage4"));
		bean.setTimage5(mr.getFilesystemName("timage5"));
		bean.setRegdate(mr.getParameter("regdate"));
		bean.setTcategory(mr.getParameter("tcategory"));
		
		TourDao dao = new TourDao() ;
		int cnt = -1 ;
		try {
			cnt = dao.InsertData(bean) ; 
			
			if(cnt == -1) {
				super.gotoPage("/tour/trInsertForm.jsp");
				
			}else {
				new TourListController().doGet(request, response); 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
