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
            int totalCount = dao.GetTotalRecordCount(mode, keyword); // 수정 예정
            String url = super.getUrlInfomation("frMain");
            boolean isGrid = false;
            Paging pageInfo = new Paging(pageNumber, pageSize, totalCount, url, mode, keyword, isGrid);

            List<freeBoard> lists = dao.selectAll(pageInfo);

            request.setAttribute("datalist", lists);

            // 페이징 관련 정보를 바인딩
            request.setAttribute("pageInfo", pageInfo);

            super.gotoPage("free/freeBoardMain.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
