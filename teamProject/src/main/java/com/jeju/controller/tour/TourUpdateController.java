package com.jeju.controller.tour;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.jeju.controller.SuperClass;
import com.jeju.model.bean.category;
import com.jeju.model.bean.Tour;
import com.jeju.model.dao.CategoryDao;
import com.jeju.model.dao.TourDao;

public class TourUpdateController extends SuperClass{
	private final String PREFIX = "product/" ;
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		// Categories 테이블에서 상품 카테고리 목록을 읽어서 request에 바인딩합니다.
		CategoryDao cdao = new CategoryDao() ;
		List<Category> lists = null ;
		
		// 상품 수정시 넘어 오는 상품 번호를 우선 챙깁니다. 
		Integer pnum = Integer.parseInt(request.getParameter("tno")) ;
		
		TourDao pdao = new TourDao() ;
		Tour bean = pdao.GetDataByPk(tno) ;
		
		try {
			lists = cdao.GetCategoryList("tour", "select") ;
			request.setAttribute("categories", lists);
			request.setAttribute("bean", bean); 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		super.gotoPage(PREFIX + "trUpdateForm.jsp");
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		MultipartRequest mr = (MultipartRequest)request.getAttribute("mr") ;
		
		Tour bean = new Tour() ;
		 
		// 상품 등록과는 다르게 수정은 상품 번호를 반드시 챙겨야 합니다.
		bean.setTno(mr.getParameter("tno"));
				
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
		
		TourDao dao = new TourDao() ;
		int cnt = -1 ;
		try {
			cnt = dao.UpdateData(bean) ; 
			
			if(cnt == -1) {
				super.gotoPage(PREFIX + "trUpdateForm.jsp");
				
			}else {
				// 이전 방식
				//new ProductListController().doGet(request, response);
				
				String gotopage = super.getUrlInfomation("trList") ;
				gotopage += "&pageNumber=" + mr.getParameter("pageNumber");
				gotopage += "&pageSize=" + mr.getParameter("pageSize");
				gotopage += "&mode=" + mr.getParameter("mode");
				gotopage += "&keyword=" + mr.getParameter("keyword");
				response.sendRedirect(gotopage); 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
