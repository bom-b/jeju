package com.jeju.controller.food;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;
import com.jeju.model.bean.Food;
import com.jeju.model.dao.FoodDao;
import com.jeju.utility.Paging;


public class FoodMainController extends SuperClass{
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		super.doGet(request, response);
		
		// 페이징 처리를 위한 파라미터들
		String pageNumber = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
		String mode = request.getParameter("mode");
		String keyword = request.getParameter("keyword");
		
		FoodDao dao = new FoodDao();
		
		try {
			// 한식 데이터 개수 구하기
			int totalCount_Ko = dao.GetTotalRecordCount(mode, keyword, "ko");
			String url_ko = super.getUrlInfomation("fdMain") ;
			boolean isGrid_ko = false ;
			Paging PageInfo_ko = new Paging(pageNumber, pageSize, totalCount_Ko, url_ko, mode, keyword, isGrid_ko);
			
			// 세계음식 데이터 개수 구하기
			int totalCount_fo = dao.GetTotalRecordCount(mode, keyword, "fo");
			String url_fo = super.getUrlInfomation("fdMain") ;
			boolean isGrid_fo = false ;
			Paging PageInfo_fo = new Paging(pageNumber, pageSize, totalCount_fo, url_fo, mode, keyword, isGrid_fo);
			
			// 카페 데이터 개수 구하기
			int totalCount_ca = dao.GetTotalRecordCount(mode, keyword, "ca");
			String url_ca = super.getUrlInfomation("fdMain") ;
			boolean isGrid_ca = false ;
			Paging PageInfo_ca = new Paging(pageNumber, pageSize, totalCount_ca, url_ca, mode, keyword, isGrid_ca);
						
			// 술집 데이터 개수 구하기
			int totalCount_be = dao.GetTotalRecordCount(mode, keyword, "be");
			String url_be = super.getUrlInfomation("fdMain") ;
			boolean isGrid_be = false ;
			Paging PageInfo_be = new Paging(pageNumber, pageSize, totalCount_be, url_be, mode, keyword, isGrid_be);
			
			
			// 한식 게시물들을 담는 리스트
			List<Food> kolists = dao.selectAll(PageInfo_ko, "ko");
			
			// 세계음식 게시물들을 담는 리스트
			List<Food> folists = dao.selectAll(PageInfo_fo, "fo");
			
			// 카페 게시물들을 담는 리스트
			List<Food> calists = dao.selectAll(PageInfo_ca, "ca");
						
			// 술집 게시물들을 담는 리스트
			List<Food> belists = dao.selectAll(PageInfo_be, "be");
			
			
			// 한식 게시물을 담은 리스트를 리퀘스트 저장소에 할당한다. (바인딩)
			request.setAttribute("ko_datalist", kolists);
			
			// 세계음식 게시물을 담은 리스트를 리퀘스트 저장소에 할당한다. (바인딩)
			request.setAttribute("fo_datalist", folists);
			
			// 카페 게시물을 담은 리스트를 리퀘스트 저장소에 할당한다. (바인딩)
			request.setAttribute("ca_datalist", calists);
			
			// 술집 게시물을 담은 리스트를 리퀘스트 저장소에 할당한다. (바인딩)
			request.setAttribute("be_datalist", belists);
			
			// 페이징 정보를 바인딩
			request.setAttribute("PageInfo_ko", PageInfo_ko);
			request.setAttribute("PageInfo_fo", PageInfo_fo);
			request.setAttribute("PageInfo_ca", PageInfo_ca);
			request.setAttribute("PageInfo_be", PageInfo_be);
			
			// 바인딩한 것을 페이지로 보냅니다.
			super.gotoPage("/food/foodMain.jsp");
			
		}  catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
}
