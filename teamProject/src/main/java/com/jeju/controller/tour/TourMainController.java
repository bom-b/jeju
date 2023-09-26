package com.jeju.controller.tour;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;
import com.jeju.model.bean.Tour;
import com.jeju.model.dao.TourDao;
import com.jeju.utility.Paging;

public class TourMainController extends SuperClass{
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		
		super.doGet(request, response);
		
		// 페이징 처리를 위한 파라미터들
		String pageNumber = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
		String mode = request.getParameter("mode");
		String keyword = request.getParameter("keyword");
				
		TourDao dao = new TourDao();
		
		try {
			// 액티비티 체험 데이터 개수 구하기
			int totalCount_ac = dao.GetTotalRecordCount(mode, keyword, "ac");
			String url_ac = super.getUrlInfomation("trMain") ;
			boolean isGrid_ac = false ;
			Paging PageInfo_ac = new Paging(pageNumber, pageSize, totalCount_ac, url_ac, mode, keyword, isGrid_ac);
			
			// 오름 명소 데이터 개수 구하기
			int totalCount_or = dao.GetTotalRecordCount(mode, keyword, "or");
			String url_or = super.getUrlInfomation("trMain") ;
			boolean isGrid_or = false ;
			Paging PageInfo_or = new Paging(pageNumber, pageSize, totalCount_or, url_or, mode, keyword, isGrid_or);
			
			// 해수욕장 데이터 개수 구하기
			int totalCount_sea = dao.GetTotalRecordCount(mode, keyword, "sea");
			String url_sea = super.getUrlInfomation("trMain") ;
			boolean isGrid_sea = false ;
			Paging PageInfo_sea = new Paging(pageNumber, pageSize, totalCount_sea, url_sea, mode, keyword, isGrid_sea);
						
			// 테마파크 데이터 개수 구하기
			int totalCount_te = dao.GetTotalRecordCount(mode, keyword, "te");
			String url_te = super.getUrlInfomation("trMain") ;
			boolean isGrid_te = false ;
			Paging PageInfo_te = new Paging(pageNumber, pageSize, totalCount_te, url_te, mode, keyword, isGrid_te);
			
			
			// 액티비티 체험 게시물들을 담는 리스트
			List<Tour> aclists = dao.selectAll(PageInfo_ac, "ac");
			
			// 오름 명소 게시물들을 담는 리스트
			List<Tour> orlists = dao.selectAll(PageInfo_or, "or");
			
			// 해수욕장 게시물들을 담는 리스트
			List<Tour> sealists = dao.selectAll(PageInfo_sea, "sea");
						
			// 테마파크 게시물들을 담는 리스트
			List<Tour> telists = dao.selectAll(PageInfo_te, "te");
			
			
			// 액티비티 체험  게시물을 담은 리스트를 리퀘스트 저장소에 할당한다. (바인딩)
			request.setAttribute("ac_datalist", aclists);
			
			// 오름 명소 게시물을 담은 리스트를 리퀘스트 저장소에 할당한다. (바인딩)
			request.setAttribute("or_datalist", orlists);
			
			// 해수욕장 게시물을 담은 리스트를 리퀘스트 저장소에 할당한다. (바인딩)
			request.setAttribute("sea_datalist", sealists);
			
			// 테마파크 게시물을 담은 리스트를 리퀘스트 저장소에 할당한다. (바인딩)
			request.setAttribute("te_datalist", telists);
			
			// 페이징 정보를 바인딩
			request.setAttribute("PageInfo_ac", PageInfo_ac);
			request.setAttribute("PageInfo_or", PageInfo_or);
			request.setAttribute("PageInfo_sea", PageInfo_sea);
			request.setAttribute("PageInfo_te", PageInfo_te);
			
			// 바인딩한 것을 페이지로 보냅니다.
		
		
		
		super.gotoPage("/tour/tourMain.jsp");
		
		}  catch (Exception e) {
			e.printStackTrace();
		}
	}
}
