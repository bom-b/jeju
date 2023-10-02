package com.jeju.controller.free;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;
import com.jeju.model.bean.freeBoard;
import com.jeju.model.dao.freeBoardDao;
import com.jeju.utility.Paging;

public class freeBoardMainController extends SuperClass {
	

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	super.doGet(request, response);
    	// 페이징 처리를 위한 파라미터들
        String pageNumber = request.getParameter("pageNumber");
        String pageSize = request.getParameter("pageSize");
        String mode = request.getParameter("mode");
        String keyword = request.getParameter("keyword");

        freeBoardDao dao = new freeBoardDao();
        try {
        	//전체 데이터 개수 구하기
        	int totalCount_pcategory = dao.GetTotalRecordCount(mode, keyword, "pcategory");
            String url_pcategory = super.getUrlInfomation("frMain");
            boolean isGrid_pcategory = false;
            Paging pageInfo_pcategory = new Paging(pageNumber, pageSize, totalCount_pcategory, url_pcategory, mode, keyword, isGrid_pcategory);
        	
        	//잠답 데이터 개수 구하기
            int totalCount_ta = dao.GetTotalRecordCount(mode, keyword, "ta");
            String url_ta = super.getUrlInfomation("frMain");
            boolean isGrid_ta = false;
            Paging pageInfo_ta = new Paging(pageNumber, pageSize, totalCount_ta, url_ta, mode, keyword, isGrid_ta);
            
          	//질문 데이터 개수 구하기
            int totalCount_qu = dao.GetTotalRecordCount(mode, keyword, "qu"); // 수정 예정
            String url_qu = super.getUrlInfomation("frMain");
            boolean isGrid_qu = false;
            Paging pageInfo_qu = new Paging(pageNumber, pageSize, totalCount_qu, url_qu, mode, keyword, isGrid_qu);
            
          	//정보 공유 데이터 개수 구하기
            int totalCount_infor = dao.GetTotalRecordCount(mode, keyword, "infor"); // 수정 예정
            String url_infor = super.getUrlInfomation("frMain");
            boolean isGrid_infor = false;
            Paging pageInfo_infor = new Paging(pageNumber, pageSize, totalCount_infor, url_infor, mode, keyword, isGrid_infor);
       
         // pcategory 데이터 가져오기
            List<freeBoard> pcategorylists = dao.selectAll(pageInfo_pcategory, "pcategory");

            // ta 데이터 가져오기
            List<freeBoard> talists = dao.selectAll(pageInfo_ta, "ta");

            // qu 데이터 가져오기
            List<freeBoard> qulists = dao.selectAll(pageInfo_qu, "qu");

            // infor 데이터 가져오기
            List<freeBoard> inforlists = dao.selectAll(pageInfo_infor, "infor");




            request.setAttribute("pcategory_datalist", pcategorylists);
            request.setAttribute("ta_datalist",talists);
            request.setAttribute("qu_datalist", qulists);
            request.setAttribute("infor_datalist", inforlists);

            // 페이징 관련 정보를 바인딩
            request.setAttribute("pageInfo_pcategory", pageInfo_pcategory);
            request.setAttribute("pageInfo_ta", pageInfo_ta);
            request.setAttribute("pageInfo_qu", pageInfo_qu);
            request.setAttribute("pageInfo_infor", pageInfo_infor);

           super.gotoPage("/free/freeMain.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
