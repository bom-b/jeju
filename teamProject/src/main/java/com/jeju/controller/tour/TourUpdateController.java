package com.jeju.controller.tour;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;
import com.jeju.model.bean.Tour;
import com.jeju.model.dao.TourDao;
import com.oreilly.servlet.MultipartRequest;

public class TourUpdateController extends SuperClass{
	private final String PREFIX = "tour/";
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
	
		// 상품 수정시 넘어 오는 상품 번호를 챙긴다.
		String tno = request.getParameter("tno");
		
		// 다오에서 no에 해당하는 데이터를 가져오고 그 가져온 데이터를 빈으로 만든다.
		TourDao dao = new TourDao();
		Tour bean = dao.GetDataByPK(tno);
		
		try {
			request.setAttribute("bean", bean);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		super.gotoPage(PREFIX + "tourUpdateForm.jsp");
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		// 오브젝트로 가져온 mr을 강등해야됨
		MultipartRequest mr = (MultipartRequest)request.getAttribute("mr");
		
		Tour bean = new Tour();
		
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
		
		bean.setTno(mr.getParameter("tno")); // 게시글 수정 시엔 게시글 번호를 반드시 챙겨야함
		bean.setTcategory(koname);
		bean.setTtitle(mr.getParameter("ttitle"));
		bean.setTtime(mr.getParameter("ttime"));
		bean.setTbreaktime(mr.getParameter("tbreaktime"));
		bean.setTphoneno(mr.getParameter("tphoneno"));
		bean.setTmenu(mr.getParameter("tmenu"));
		bean.setTplace(mr.getParameter("tplace"));
		bean.setTimage1(mr.getFilesystemName("timage1"));
		bean.setTimage2(mr.getFilesystemName("timage2"));
		bean.setTimage3(mr.getFilesystemName("timage3"));
		bean.setTimage4(mr.getFilesystemName("timage4"));
		bean.setTimage5(mr.getFilesystemName("timage5"));
		
		TourDao dao = new TourDao();
		
		int cnt = -1;
		try {
			cnt = dao.UpdateData(bean);
			
			if(cnt == -1) {
				// 수정 실패
				super.gotoPage(PREFIX + "tourUpdateForm.jsp");
				
			} else {
				// 수정 성공
				new TourMainController().doGet(request, response); 
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
				
	}
}
